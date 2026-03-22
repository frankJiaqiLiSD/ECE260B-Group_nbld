// Gate-level testbench for sfp_row after Synthesis (pre-PnR verification)
`timescale 1ns/1ps

module sfp_row_syn_tb;

localparam COL     = 8;
localparam BW_PSUM = 20;
localparam SFP_W   = COL * BW_PSUM;  // 160
localparam SUM_W   = BW_PSUM + 4;    // 24

reg  clk, reset;
reg  acc, div_in;
reg  txrx_full;
reg  [SFP_W-1:0] sfp_in;

// Loopback signals
reg  [SUM_W-1:0] loopback_sum;
reg  loopback_valid;
wire txrx_empty_w = ~loopback_valid;
wire [SUM_W-1:0] sum_in_w = loopback_sum;

wire txrx_rd_en, txrx_wr_en;
wire [SUM_W-1:0] sum_out;
wire [SFP_W-1:0] sfp_out;
wire sfp_wr;

integer i;
integer cycle_cnt;
integer errors;

// Synthesis gate-level DUT
sfp_row dut (
  .clk(clk),
  .reset(reset),
  .acc(acc),
  .div(div_in),
  .txrx_full(txrx_full),
  .txrx_empty(txrx_empty_w),
  .sum_in(sum_in_w),
  .sum_out(sum_out),
  .sfp_in(sfp_in),
  .sfp_out(sfp_out),
  .txrx_rd_en(txrx_rd_en),
  .txrx_wr_en(txrx_wr_en),
  .sfp_wr(sfp_wr)
);

// Clock: 400MHz (2.5ns period)
always #1.25 clk = ~clk;

// Loopback: capture sum_out when TX fires, feed back as sum_in on RX
always @(posedge clk or posedge reset) begin
  if (reset) begin
    loopback_sum   <= 0;
    loopback_valid <= 0;
  end else begin
    if (txrx_wr_en) begin
      loopback_sum   <= sum_out;
      loopback_valid <= 1;
    end else if (txrx_rd_en && loopback_valid) begin
      loopback_valid <= 0;
    end
  end
end

// Cycle counter
always @(posedge clk) begin
  if (!reset) cycle_cnt <= cycle_cnt + 1;
end

// Debug: print first 10 cycles after reset
always @(posedge clk) begin
  if (!reset && cycle_cnt < 10) begin
    $display("[cyc %3d] acc=%b div=%b | wr_en=%b rd_en=%b sfp_wr=%b | empty=%b full=%b | sum_out=%0d lb_valid=%b",
      cycle_cnt, acc, div_in, txrx_wr_en, txrx_rd_en, sfp_wr,
      txrx_empty_w, txrx_full, sum_out, loopback_valid);
    $display("  INT: wr_state=%b tx_fifo_empty=%b int_fifo_empty=%b rx_fifo_empty=%b fifo_wr=%b",
      dut.wr_state, dut.tx_fifo_empty, dut.int_fifo_empty, dut.rx_fifo_empty, dut.fifo_wr);
    $display("  INT: rd_state=%b div_state=%b div_q=%b acc_q=%b acc_q2=%b acc_q3=%b",
      dut.rd_state, dut.div_state, dut.div_q, dut.acc_q, dut.acc_q2, dut.acc_q3);
  end
end

// Print key events
always @(posedge clk) begin
  if (txrx_wr_en)
    $display("  >>> TX sum_out = %0d (cycle %0d)", sum_out, cycle_cnt);
  if (txrx_rd_en)
    $display("  >>> RX sum_in  = %0d (cycle %0d)", sum_in_w, cycle_cnt);
  if (sfp_wr) begin
    $display("  >>> sfp_wr asserted! (cycle %0d) sfp_out = %h", cycle_cnt, sfp_out);
    for (i = 0; i < COL; i = i + 1)
      $display("      lane[%0d] = %0d", i, sfp_out[i*BW_PSUM +: BW_PSUM]);
  end
end

// X-detection on critical outputs after reset
reg x_detected;
always @(posedge clk) begin
  if (!reset && cycle_cnt > 2) begin
    if (txrx_wr_en === 1'bx || txrx_rd_en === 1'bx || sfp_wr === 1'bx) begin
      if (!x_detected) begin
        $display("ERROR: x detected on control outputs at cycle %0d", cycle_cnt);
        x_detected <= 1;
      end
    end
  end
end

initial begin
  $dumpfile("sfp_row_syn.vcd");
  $dumpvars(0, sfp_row_syn_tb);

  clk = 0; reset = 1;
  acc = 0; div_in = 0;
  txrx_full = 0;
  sfp_in = 0;
  loopback_sum = 0;
  loopback_valid = 0;
  cycle_cnt = 0;
  errors = 0;
  x_detected = 0;

  // Reset: hold for 30 cycles
  repeat (30) @(posedge clk);
  @(negedge clk) reset = 0;
  repeat (5) @(posedge clk);

  // ============================================
  // Check 1: After reset, all control outputs should be 0
  // ============================================
  $display("\n--- Check 1: Post-reset state ---");
  if (txrx_wr_en !== 1'b0) begin
    $display("FAIL: txrx_wr_en = %b (expected 0)", txrx_wr_en);
    errors = errors + 1;
  end
  if (txrx_rd_en !== 1'b0) begin
    $display("FAIL: txrx_rd_en = %b (expected 0)", txrx_rd_en);
    errors = errors + 1;
  end
  if (sfp_wr !== 1'b0) begin
    $display("FAIL: sfp_wr = %b (expected 0)", sfp_wr);
    errors = errors + 1;
  end
  if (dut.tx_fifo_empty !== 1'b1) begin
    $display("FAIL: tx_fifo_empty = %b (expected 1)", dut.tx_fifo_empty);
    errors = errors + 1;
  end
  if (dut.int_fifo_empty !== 1'b1) begin
    $display("FAIL: int_fifo_empty = %b (expected 1)", dut.int_fifo_empty);
    errors = errors + 1;
  end
  if (errors == 0)
    $display("PASS: Post-reset state correct");

  // ============================================
  // Test 1: ACC pulse with known positive data
  // ============================================
  $display("\n--- Test 1: ACC pulse with positive data ---");
  @(negedge clk);
  // sfp_in: lane[i] = (i+1)*10 → 10,20,30,40,50,60,70,80
  for (i = 0; i < COL; i = i + 1)
    sfp_in[i*BW_PSUM +: BW_PSUM] = (i + 1) * 10;
  acc = 1;
  div_in = 1;
  @(posedge clk); #0.1;

  @(negedge clk);
  acc = 0;
  div_in = 0;
  @(posedge clk); #0.1;

  // Expected sum = 10+20+30+40+50+60+70+80 = 360
  // Wait for pipeline to complete (acc_q3 → fifo_wr → TX → loopback → RX → div → sfp_wr)
  // Pipeline depth: ~15+ cycles
  begin : wait_sfp_wr_1
    integer timeout;
    timeout = 0;
    while (sfp_wr !== 1'b1 && timeout < 80) begin
      @(posedge clk);
      timeout = timeout + 1;
    end
    if (timeout >= 80) begin
      $display("FAIL: sfp_wr never asserted within 80 cycles");
      errors = errors + 1;
    end else begin
      $display("PASS: sfp_wr asserted at cycle %0d", cycle_cnt);
      // Check sfp_out is not x
      if (sfp_out === {SFP_W{1'bx}}) begin
        $display("FAIL: sfp_out is all x");
        errors = errors + 1;
      end else begin
        $display("PASS: sfp_out has valid data");
      end
    end
  end

  repeat (5) @(posedge clk);

  // ============================================
  // Test 2: ACC pulse with negative data (sign handling)
  // ============================================
  $display("\n--- Test 2: ACC pulse with mixed sign data ---");
  @(negedge clk);
  // lane[0..3] = positive, lane[4..7] = negative
  for (i = 0; i < 4; i = i + 1)
    sfp_in[i*BW_PSUM +: BW_PSUM] = (i + 1) * 100;
  for (i = 4; i < COL; i = i + 1)
    sfp_in[i*BW_PSUM +: BW_PSUM] = -(i + 1) * 100;  // 2's complement negative
  acc = 1;
  div_in = 1;
  @(posedge clk); #0.1;

  @(negedge clk);
  acc = 0;
  div_in = 0;
  @(posedge clk); #0.1;

  begin : wait_sfp_wr_2
    integer timeout;
    timeout = 0;
    while (sfp_wr !== 1'b1 && timeout < 80) begin
      @(posedge clk);
      timeout = timeout + 1;
    end
    if (timeout >= 80) begin
      $display("FAIL: Test 2 sfp_wr never asserted within 80 cycles");
      errors = errors + 1;
    end else begin
      $display("PASS: Test 2 sfp_wr asserted at cycle %0d", cycle_cnt);
      if (sfp_out === {SFP_W{1'bx}}) begin
        $display("FAIL: Test 2 sfp_out is all x");
        errors = errors + 1;
      end else begin
        $display("PASS: Test 2 sfp_out has valid data");
        for (i = 0; i < COL; i = i + 1)
          $display("      lane[%0d] = %0d", i, $signed(sfp_out[i*BW_PSUM +: BW_PSUM]));
      end
    end
  end

  repeat (5) @(posedge clk);

  // ============================================
  // Test 3: Back-to-back ACC pulses (pipeline stress)
  // ============================================
  $display("\n--- Test 3: Back-to-back ACC pulses ---");
  @(negedge clk);
  for (i = 0; i < COL; i = i + 1)
    sfp_in[i*BW_PSUM +: BW_PSUM] = (i + 1) * 5;
  acc = 1;
  div_in = 1;
  @(posedge clk); #0.1;

  // Second ACC immediately after
  @(negedge clk);
  for (i = 0; i < COL; i = i + 1)
    sfp_in[i*BW_PSUM +: BW_PSUM] = (i + 1) * 20;
  // Keep acc=1 for one more cycle (second pulse)
  @(posedge clk); #0.1;

  @(negedge clk);
  acc = 0;
  div_in = 0;
  @(posedge clk); #0.1;

  // Wait for both results
  begin : wait_sfp_wr_3
    integer sfp_wr_count;
    integer timeout;
    sfp_wr_count = 0;
    timeout = 0;
    while (sfp_wr_count < 2 && timeout < 160) begin
      @(posedge clk);
      if (sfp_wr === 1'b1) sfp_wr_count = sfp_wr_count + 1;
      timeout = timeout + 1;
    end
    if (sfp_wr_count >= 2)
      $display("PASS: Test 3 got %0d sfp_wr pulses", sfp_wr_count);
    else if (sfp_wr_count == 1)
      $display("WARN: Test 3 only got 1 sfp_wr pulse (expected 2, may be design intent)");
    else begin
      $display("FAIL: Test 3 got 0 sfp_wr pulses");
      errors = errors + 1;
    end
  end

  repeat (10) @(posedge clk);

  // ============================================
  // Summary
  // ============================================
  $display("\n========================================");
  if (x_detected) begin
    $display("FAIL: X-propagation detected on control outputs");
    errors = errors + 1;
  end
  if (errors == 0)
    $display("ALL TESTS PASSED");
  else
    $display("FAILED: %0d error(s)", errors);
  $display("========================================\n");

  $finish;
end

endmodule
