// Gate-level testbench for core after Synthesis (pre-PnR verification)
`timescale 1ns/1ps

module core_syn_tb;

parameter total_cycle = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 16;
parameter col = 8;

`define NULL 0

integer qk_file;
integer qk_scan_file;
integer captured_data;

integer K[col-1:0][pr-1:0];
integer Q[total_cycle-1:0][pr-1:0];
integer result[total_cycle-1:0][col-1:0];

integer q, j, k, t;
integer out_idx;
integer errors;

reg reset = 1;
reg clk = 0;
reg [pr*bw-1:0] mem_in = 0;
reg ofifo_rd = 0;
wire [16:0] inst;
reg qmem_rd = 0;
reg qmem_wr = 0;
reg kmem_rd = 0;
reg kmem_wr = 0;
reg pmem_rd = 0;
reg pmem_wr = 0;
reg execute = 0;
reg load = 0;
reg [3:0] qkmem_add = 0;
reg [3:0] pmem_add = 0;

wire [bw_psum+3:0] sum_out;
wire [bw_psum*col-1:0] out;
wire rd_en, wr_en;

// SFP transceiver loopback
reg  [bw_psum+3:0] loopback_sum;
reg  loopback_valid;
wire txrx_empty_w = ~loopback_valid;
wire [bw_psum+3:0] sum_in_w = loopback_sum;

reg [bw_psum-1:0] lane_word;
reg [bw_psum*col-1:0] expected_word;

assign inst[16] = ofifo_rd;
assign inst[15:12] = qkmem_add;
assign inst[11:8]  = pmem_add;
assign inst[7] = execute;
assign inst[6] = load;
assign inst[5] = qmem_rd;
assign inst[4] = qmem_wr;
assign inst[3] = kmem_rd;
assign inst[2] = kmem_wr;
assign inst[1] = pmem_rd;
assign inst[0] = pmem_wr;

core dut (
      .reset(reset),
      .clk(clk),
      .mem_in(mem_in),
      .inst(inst),
      .out(out),
      .sum_out(sum_out),
      .sum_in(sum_in_w),
      .empty(txrx_empty_w),
      .full(1'b0),
      .rd_en(rd_en),
      .wr_en(wr_en)
);

// SFP loopback: TX → RX
always @(posedge clk or posedge reset) begin
  if (reset) begin
    loopback_sum   <= 0;
    loopback_valid <= 0;
  end else begin
    if (wr_en) begin
      loopback_sum   <= sum_out;
      loopback_valid <= 1;
    end else if (rd_en && loopback_valid) begin
      loopback_valid <= 0;
    end
  end
end

// Track sfp_wr events
reg sfp_wr_seen;
always @(posedge clk) begin
  if (!reset && dut.sfp_wr)
    sfp_wr_seen <= 1;
end

initial begin
  $dumpfile("core_syn.vcd");
  $dumpvars(0, core_syn_tb);

  errors = 0;
  sfp_wr_seen = 0;
  loopback_sum = 0;
  loopback_valid = 0;

  qk_file = $fopen("qdata.txt", "r");
  if (qk_file == `NULL) qk_file = $fopen("../../qdata.txt", "r");
  if (qk_file == `NULL) begin
    $display("FATAL: cannot open qdata.txt");
    $finish;
  end

  // Skip headers
  qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);

  for (q = 0; q < total_cycle; q = q + 1) begin
    for (j = 0; j < pr; j = j + 1) begin
      qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
      Q[q][j] = captured_data;
    end
  end

  // Reset
  for (q = 0; q < 12; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.5 clk = 1'b1;
  end
  #0.1 reset = 0;

  qk_file = $fopen("kdata.txt", "r");
  if (qk_file == `NULL) qk_file = $fopen("../../kdata.txt", "r");
  if (qk_file == `NULL) begin
    $display("FATAL: cannot open kdata.txt");
    $finish;
  end

  // Skip headers
  qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);
  qk_scan_file = $fscanf(qk_file, "%s\n", captured_data);

  for (q = 0; q < col; q = q + 1) begin
    for (j = 0; j < pr; j = j + 1) begin
      qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
      K[q][j] = captured_data;
    end
  end

  // Compute expected results
  $display("##### Expected multiplication result #####");
  for (t = 0; t < total_cycle; t = t + 1) begin
    expected_word = {bw_psum*col{1'b0}};
    for (q = 0; q < col; q = q + 1) begin
      result[t][q] = 0;
      for (k = 0; k < pr; k = k + 1) begin
        result[t][q] = result[t][q] + Q[t][k] * K[q][k];
      end
      lane_word = result[t][q];
      expected_word = {expected_word[bw_psum*(col-1)-1:0], lane_word};
    end
    $display("prd @cycle %0d: %40h", t, expected_word);
  end

  // ============================================
  // Write Q to qmem
  // ============================================
  for (q = 0; q < total_cycle; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.1 begin
      qmem_wr = 1;
      qkmem_add = q[3:0];
      for (j = 0; j < pr; j = j + 1)
        mem_in[bw*j +: bw] = Q[q][j];
    end
    #0.4 clk = 1'b1;
  end
  #0.5 clk = 1'b0;
  #0.1 begin qmem_wr = 0; qkmem_add = 0; end
  #0.4 clk = 1'b1;

  // ============================================
  // Write K to kmem
  // ============================================
  for (q = 0; q < col; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.1 begin
      kmem_wr = 1;
      qkmem_add = q[3:0];
      for (j = 0; j < pr; j = j + 1)
        mem_in[bw*j +: bw] = K[q][j];
    end
    #0.4 clk = 1'b1;
  end
  #0.5 clk = 1'b0;
  #0.1 begin kmem_wr = 0; qkmem_add = 0; end
  #0.4 clk = 1'b1;

  // ============================================
  // K load phase
  // ============================================
  for (q = 0; q < col + 1; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.1 begin
      load = 1;
      kmem_rd = (q > 0);
      qkmem_add = (q > 0) ? (q - 1) : 0;
    end
    #0.4 clk = 1'b1;
  end
  #0.5 clk = 1'b0;
  #0.1 begin kmem_rd = 0; qkmem_add = 0; end
  #0.4 clk = 1'b1;

  #0.5 clk = 1'b0;
  #0.1 load = 0;
  #0.4 clk = 1'b1;

  // Pipeline fill gap
  for (q = 0; q < 10; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.5 clk = 1'b1;
  end

  // ============================================
  // Execute phase: MAC computation (with diagnostics)
  // ============================================
  for (q = 0; q < total_cycle + col; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.1 begin
      execute = 1;
      qmem_rd = 1;
      qkmem_add = (q < total_cycle) ? q[3:0] : (total_cycle-1);
    end
    #0.4 clk = 1'b1;
    if (q < 3 || (q >= col-1 && q <= col+1))
      $strobe("  exec[%2d]: fifo_wr=%b array_out[19:0]=%h", q, dut.fifo_wr, dut.array_out[19:0]);
  end

  #0.5 clk = 1'b0;
  #0.1 begin qmem_rd = 0; qkmem_add = 0; execute = 0; end
  #0.4 clk = 1'b1;

  // Pipeline drain gap
  for (q = 0; q < 10; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.5 clk = 1'b1;
  end

  // ============================================
  // Move OFIFO data to pmem (with diagnostics)
  // ============================================
  $display("\n##### OFIFO -> PMEM write phase #####");
  for (q = 0; q < total_cycle; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.1 begin
      ofifo_rd = 1;
      pmem_wr = 1;
      pmem_add = q[3:0];
    end
    #0.4 clk = 1'b1;
    // Probe: what data is ofifo outputting to pmem?
    $strobe("  pmem_wr[%0d]: pmem_in=%h", q, dut.pmem_in);
  end

  #0.5 clk = 1'b0;
  #0.1 begin pmem_wr = 0; pmem_add = 0; ofifo_rd = 0; end
  #0.4 clk = 1'b1;

  // ============================================
  // Read calculated outputs from pmem
  // ============================================
  $display("\n##### Calculated output #####");
  for (q = 0; q < total_cycle; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.1 begin
      pmem_rd = 1;
      pmem_add = q[3:0];
      out_idx = q + 1;
    end
    #0.4 clk = 1'b1;
    $strobe("Output %2d: %40h", out_idx, out);
  end

  #0.5 clk = 1'b0;
  #0.1 begin pmem_rd = 0; pmem_add = 0; end
  #0.4 clk = 1'b1;

  // Wait for SFP pipeline to complete (acc/div triggered by pmem_rd)
  for (q = 0; q < 80; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.5 clk = 1'b1;
  end

  // ============================================
  // Summary
  // ============================================
  $display("\n========================================");
  if (sfp_wr_seen)
    $display("SFP: sfp_wr asserted — normalization pipeline completed");
  else
    $display("SFP: sfp_wr never asserted (may need more cycles or loopback data)");
  $display("========================================\n");

  #10 $finish;
end

endmodule
