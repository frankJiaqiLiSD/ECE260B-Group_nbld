`timescale 1ns/1ps

module sram_2ports_tb;

  parameter sram_bit = 160;

  reg CLK;
  reg CEN_A, WEN_A, CEN_B, WEN_B;
  reg [3:0] A_A, A_B;
  reg [sram_bit-1:0] D_A, D_B;
  wire [sram_bit-1:0] Q_B;

  integer i;
  integer pass, fail;

  sram_2ports #(.sram_bit(sram_bit)) dut (
    .CLK(CLK),
    .D_A(D_A), .CEN_A(CEN_A), .WEN_A(WEN_A), .A_A(A_A),
    .D_B(D_B), .Q_B(Q_B), .CEN_B(CEN_B), .WEN_B(WEN_B), .A_B(A_B)
  );

  // Clock: 1GHz (1ns period)
  always #0.5 CLK = ~CLK;

  task disable_all;
    begin
      CEN_A = 1; WEN_A = 1; CEN_B = 1; WEN_B = 1;
      A_A = 0; A_B = 0; D_A = 0; D_B = 0;
    end
  endtask

  initial begin
    $dumpfile("sram_2ports_tb.vcd");
    $dumpvars(0, sram_2ports_tb);

    CLK = 0;
    disable_all;
    pass = 0; fail = 0;

    #5;

    // ============================================
    // Test 1: Port A write, Port A read
    // ============================================
    $display("\n--- Test 1: Port A write all 16 addresses ---");
    for (i = 0; i < 16; i = i + 1) begin
      @(negedge CLK);
      CEN_A = 0; WEN_A = 0;  // Port A write
      A_A = i[3:0];
      D_A = (i + 1) * 1000;
      CEN_B = 1;             // Port B disabled
      @(posedge CLK); #0.1;
    end
    disable_all;
    #2;

    $display("--- Test 1b: Port A read all 16 addresses ---");
    for (i = 0; i < 16; i = i + 1) begin
      @(negedge CLK);
      CEN_A = 0; WEN_A = 1;  // Port A read -> Q_B
      A_A = i[3:0];
      CEN_B = 1;
      @(posedge CLK); #0.1;
      @(negedge CLK);
      if (Q_B == (i + 1) * 1000) begin
        $display("  PASS: PortA read addr[%0d] = %0d", i, Q_B);
        pass = pass + 1;
      end else begin
        $display("  FAIL: PortA read addr[%0d] = %0d, expected %0d", i, Q_B, (i+1)*1000);
        fail = fail + 1;
      end
    end
    disable_all;
    #2;

    // ============================================
    // Test 2: Port B write, Port A read back
    // ============================================
    $display("--- Test 2: Port B write addr[5], Port A read back ---");
    @(negedge CLK);
    CEN_A = 1;                    // Port A disabled
    CEN_B = 0; WEN_B = 0;        // Port B write
    A_B = 4'd5;
    D_B = 160'hAAAA_BBBB_CCCC;
    @(posedge CLK); #0.1;
    disable_all;

    @(negedge CLK);
    CEN_A = 0; WEN_A = 1;        // Port A read
    A_A = 4'd5;
    CEN_B = 1;
    @(posedge CLK); #0.1;
    @(negedge CLK);
    if (Q_B == 160'hAAAA_BBBB_CCCC) begin
      $display("  PASS: PortB wrote, PortA read addr[5] = 0x%h", Q_B);
      pass = pass + 1;
    end else begin
      $display("  FAIL: addr[5] = 0x%h, expected 0xAAAA_BBBB_CCCC", Q_B);
      fail = fail + 1;
    end
    disable_all;
    #2;

    // ============================================
    // Test 3: Port A write has priority over Port B
    // (both ports active same cycle, Port A is in the if, Port B in else if)
    // ============================================
    $display("--- Test 3: Port A write priority over Port B write ---");
    @(negedge CLK);
    CEN_A = 0; WEN_A = 0;        // Port A write
    A_A = 4'd10;
    D_A = 160'h1111;
    CEN_B = 0; WEN_B = 0;        // Port B write (same cycle)
    A_B = 4'd10;
    D_B = 160'h2222;
    @(posedge CLK); #0.1;
    disable_all;

    @(negedge CLK);
    CEN_A = 0; WEN_A = 1;        // read addr 10
    A_A = 4'd10;
    CEN_B = 1;
    @(posedge CLK); #0.1;
    @(negedge CLK);
    if (Q_B == 160'h1111) begin
      $display("  PASS: Port A write won priority, addr[10] = 0x%h", Q_B);
      pass = pass + 1;
    end else if (Q_B == 160'h2222) begin
      $display("  INFO: Port B write won (unexpected), addr[10] = 0x%h", Q_B);
      fail = fail + 1;
    end else begin
      $display("  FAIL: addr[10] = 0x%h", Q_B);
      fail = fail + 1;
    end
    disable_all;
    #2;

    // ============================================
    // Test 4: CEN disabled should not write
    // ============================================
    $display("--- Test 4: CEN=1 should not write ---");
    @(negedge CLK);
    CEN_A = 1; WEN_A = 0;        // Port A disabled
    A_A = 4'd0;
    D_A = 160'hDEAD;
    CEN_B = 1;
    @(posedge CLK); #0.1;
    disable_all;

    @(negedge CLK);
    CEN_A = 0; WEN_A = 1;        // read addr 0
    A_A = 4'd0;
    CEN_B = 1;
    @(posedge CLK); #0.1;
    @(negedge CLK);
    if (Q_B == 1000) begin  // original value from Test 1
      $display("  PASS: CEN=1 did not overwrite addr[0], Q_B = %0d", Q_B);
      pass = pass + 1;
    end else begin
      $display("  FAIL: addr[0] = %0d, expected 1000", Q_B);
      fail = fail + 1;
    end

    disable_all;
    #5;

    // ============================================
    // Summary
    // ============================================
    $display("\n============================");
    $display("  PASS: %0d  FAIL: %0d", pass, fail);
    $display("============================\n");

    $finish;
  end

endmodule
