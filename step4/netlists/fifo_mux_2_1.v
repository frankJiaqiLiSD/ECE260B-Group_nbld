// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission
module fifo_mux_2_1(in0, in1, sel, out);

  parameter bw = 8;
  parameter simd = 4;

  input [simd*bw-1:0] in0;
  input [simd*bw-1:0] in1; 
  input sel;
  output [simd*bw-1:0] out;
  assign out = sel ? in1 : in0;

 endmodule
