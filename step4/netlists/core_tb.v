// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission

`timescale 1ns/1ps

module core_tb;

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

core core_instance (
      .reset(reset),
      .clk(clk),
      .mem_in(mem_in),
      .inst(inst),
      .out(out),
      .sum_out(sum_out)
);

`ifdef USE_SDF
initial $sdf_annotate("./constraints/core_BC.sdf", core_instance, , ,"MAXIMUM","1:1:1","FROM_MTM");
`endif

initial begin
  $dumpfile("core_tb.vcd");
  $dumpvars(0, core_tb);

  qk_file = $fopen("qdata.txt", "r");
  if (qk_file == `NULL) qk_file = $fopen("../qdata.txt", "r");
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

  // Reset settling clocks
  for (q = 0; q < 12; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.5 clk = 1'b1;
  end
  #0.1 reset = 0;

  qk_file = $fopen("kdata.txt", "r");
  if (qk_file == `NULL) qk_file = $fopen("../kdata.txt", "r");
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

  // Estimated outputs
  $display("##### Estimated multiplication result #####");
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

  // Write Q to qmem
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
  #0.1 begin
    qmem_wr = 0;
    qkmem_add = 0;
  end
  #0.4 clk = 1'b1;

  // Write K to kmem
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
  #0.1 begin
    kmem_wr = 0;
    qkmem_add = 0;
  end
  #0.4 clk = 1'b1;

  // K load phase (timing kept to avoid X during delayed key capture)
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
  #0.1 begin
    kmem_rd = 0;
    qkmem_add = 0;
  end
  #0.4 clk = 1'b1;

  #0.5 clk = 1'b0;
  #0.1 load = 0;
  #0.4 clk = 1'b1;

  // Pipeline fill gap
  for (q = 0; q < 10; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.5 clk = 1'b1;
  end

  // Execute phase
  for (q = 0; q < total_cycle + col; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.1 begin
      execute = 1;
      qmem_rd = 1;
      qkmem_add = (q < total_cycle) ? q[3:0] : (total_cycle-1);
    end
    #0.4 clk = 1'b1;
  end

  #0.5 clk = 1'b0;
  #0.1 begin
    qmem_rd = 0;
    qkmem_add = 0;
    execute = 0;
  end
  #0.4 clk = 1'b1;

  // Pipeline drain gap
  for (q = 0; q < 10; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.5 clk = 1'b1;
  end

  // Move OFIFO data to pmem
  for (q = 0; q < total_cycle; q = q + 1) begin
    #0.5 clk = 1'b0;
    #0.1 begin
      ofifo_rd = 1;
      pmem_wr = 1;
      pmem_add = q[3:0];
    end
    #0.4 clk = 1'b1;
  end

  #0.5 clk = 1'b0;
  #0.1 begin
    pmem_wr = 0;
    pmem_add = 0;
    ofifo_rd = 0;
  end
  #0.4 clk = 1'b1;

  // Read calculated outputs from pmem
  $display("##### Calculated output #####");
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
  #0.1 begin
    pmem_rd = 0;
    pmem_add = 0;
  end
  #0.4 clk = 1'b1;

  #10 $finish;
end

endmodule
