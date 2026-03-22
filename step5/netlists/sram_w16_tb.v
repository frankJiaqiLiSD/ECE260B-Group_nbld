`timescale 1ns/1ps

module sram_w16_tb;

  parameter sram_bit = 128;

  reg CLK;
  reg CEN, WEN;
  reg [3:0] A;
  reg [sram_bit-1:0] D;
  wire [sram_bit-1:0] Q;

  integer i;
  integer pass, fail;

  sram_w16 #(.sram_bit(sram_bit)) dut (
    .CLK(CLK), .D(D), .Q(Q), .CEN(CEN), .WEN(WEN), .A(A)
  );

  // Clock: 1GHz (1ns period)
  always #0.5 CLK = ~CLK;

  initial begin
    $dumpfile("sram_w16_tb.vcd");
    $dumpvars(0, sram_w16_tb);

    CLK = 0; CEN = 1; WEN = 1; A = 0; D = 0;
    pass = 0; fail = 0;

    #5; // wait for initial settling

    // ============================================
    // Test 1: Write all 16 addresses
    // ============================================
    $display("\n--- Test 1: Write all 16 addresses ---");
    for (i = 0; i < 16; i = i + 1) begin
      @(negedge CLK);
      CEN = 0; WEN = 0;      // write mode
      A = i[3:0];
      D = (i + 1) * 100;     // write value = (addr+1)*100
      @(posedge CLK);
      #0.1;
    end
    CEN = 1; // disable
    #2;

    // ============================================
    // Test 2: Read all 16 addresses and verify
    // ============================================
    $display("--- Test 2: Read all 16 addresses ---");
    for (i = 0; i < 16; i = i + 1) begin
      @(negedge CLK);
      CEN = 0; WEN = 1;      // read mode
      A = i[3:0];
      @(posedge CLK);
      #0.1; // wait for Q to update
      @(negedge CLK); // sample Q after it's registered
      if (Q == (i + 1) * 100) begin
        $display("  PASS: addr[%0d] = %0d", i, Q);
        pass = pass + 1;
      end else begin
        $display("  FAIL: addr[%0d] = %0d, expected %0d", i, Q, (i+1)*100);
        fail = fail + 1;
      end
    end
    CEN = 1;
    #2;

    // ============================================
    // Test 3: Overwrite addr 0 and verify
    // ============================================
    $display("--- Test 3: Overwrite addr 0 ---");
    @(negedge CLK);
    CEN = 0; WEN = 0; A = 4'd0; D = 128'hDEAD_BEEF;
    @(posedge CLK); #0.1;

    @(negedge CLK);
    CEN = 0; WEN = 1; A = 4'd0; // read back
    @(posedge CLK); #0.1;
    @(negedge CLK);
    if (Q == 128'hDEAD_BEEF) begin
      $display("  PASS: addr[0] overwrite = 0x%h", Q);
      pass = pass + 1;
    end else begin
      $display("  FAIL: addr[0] = 0x%h, expected 0xDEAD_BEEF", Q);
      fail = fail + 1;
    end

    // ============================================
    // Test 4: CEN=1 should not read/write
    // ============================================
    $display("--- Test 4: CEN=1 disabled ---");
    @(negedge CLK);
    CEN = 1; WEN = 0; A = 4'd1; D = 128'hFFFF;
    @(posedge CLK); #0.1;

    @(negedge CLK);
    CEN = 0; WEN = 1; A = 4'd1; // read addr 1
    @(posedge CLK); #0.1;
    @(negedge CLK);
    if (Q == 200) begin  // should still be original value
      $display("  PASS: CEN=1 did not overwrite addr[1]");
      pass = pass + 1;
    end else begin
      $display("  FAIL: addr[1] = %0d, expected 200", Q);
      fail = fail + 1;
    end

    CEN = 1;
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
