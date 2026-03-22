/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06-SP2
// Date      : Sat Mar 21 16:39:09 2026
/////////////////////////////////////////////////////////////


module fifo_mux_2_1_bw24_simd1_21 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U2 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U3 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U4 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U5 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U6 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U7 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U8 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U9 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U12 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U13 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U14 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U15 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U16 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U17 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U18 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U19 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U20 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
  MUX2D0 U21 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U22 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U23 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U24 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
endmodule


module fifo_mux_2_1_bw24_simd1_22 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_23 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_24 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_25 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_26 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_27 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_8_1_bw24_simd1_3 ( out, sel, in0, in1, in2, in3, in4, in5, in6, 
        in7 );
  output [23:0] out;
  input [2:0] sel;
  input [23:0] in0;
  input [23:0] in1;
  input [23:0] in2;
  input [23:0] in3;
  input [23:0] in4;
  input [23:0] in5;
  input [23:0] in6;
  input [23:0] in7;

  wire   [23:0] out_sub0_0;
  wire   [23:0] out_sub0_1;
  wire   [23:0] out_sub0_2;
  wire   [23:0] out_sub0_3;
  wire   [23:0] out_sub1_0;
  wire   [23:0] out_sub1_1;

  fifo_mux_2_1_bw24_simd1_27 fifo_mux_2_1a ( .in0(in0), .in1(in1), .sel(sel[0]), .out(out_sub0_0) );
  fifo_mux_2_1_bw24_simd1_26 fifo_mux_2_1b ( .in0(in2), .in1(in3), .sel(sel[0]), .out(out_sub0_1) );
  fifo_mux_2_1_bw24_simd1_25 fifo_mux_2_1c ( .in0(in4), .in1(in5), .sel(sel[0]), .out(out_sub0_2) );
  fifo_mux_2_1_bw24_simd1_24 fifo_mux_2_1d ( .in0(in6), .in1(in7), .sel(sel[0]), .out(out_sub0_3) );
  fifo_mux_2_1_bw24_simd1_23 fifo_mux_2_1e ( .in0(out_sub0_0), .in1(out_sub0_1), .sel(sel[1]), .out(out_sub1_0) );
  fifo_mux_2_1_bw24_simd1_22 fifo_mux_2_1f ( .in0(out_sub0_2), .in1(out_sub0_3), .sel(sel[1]), .out(out_sub1_1) );
  fifo_mux_2_1_bw24_simd1_21 fifo_mux_2_1g ( .in0(out_sub1_0), .in1(out_sub1_1), .sel(sel[2]), .out(out) );
endmodule


module fifo_mux_2_1_bw24_simd1_29 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;

  tri   [23:0] out;

  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_14 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
  MUX2D0 U2 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U3 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U4 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U5 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U6 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U7 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U8 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U9 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U10 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U11 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U12 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U13 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U14 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U15 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U16 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U17 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U18 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U19 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U20 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U21 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U22 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U23 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U24 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
endmodule


module fifo_mux_2_1_bw24_simd1_15 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_16 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_17 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_18 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_19 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_20 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_8_1_bw24_simd1_2 ( out, sel, in0, in1, in2, in3, in4, in5, in6, 
        in7 );
  output [23:0] out;
  input [2:0] sel;
  input [23:0] in0;
  input [23:0] in1;
  input [23:0] in2;
  input [23:0] in3;
  input [23:0] in4;
  input [23:0] in5;
  input [23:0] in6;
  input [23:0] in7;

  wire   [23:0] out_sub0_0;
  wire   [23:0] out_sub0_1;
  wire   [23:0] out_sub0_2;
  wire   [23:0] out_sub0_3;
  wire   [23:0] out_sub1_0;
  wire   [23:0] out_sub1_1;

  fifo_mux_2_1_bw24_simd1_20 fifo_mux_2_1a ( .in0(in0), .in1(in1), .sel(sel[0]), .out(out_sub0_0) );
  fifo_mux_2_1_bw24_simd1_19 fifo_mux_2_1b ( .in0(in2), .in1(in3), .sel(sel[0]), .out(out_sub0_1) );
  fifo_mux_2_1_bw24_simd1_18 fifo_mux_2_1c ( .in0(in4), .in1(in5), .sel(sel[0]), .out(out_sub0_2) );
  fifo_mux_2_1_bw24_simd1_17 fifo_mux_2_1d ( .in0(in6), .in1(in7), .sel(sel[0]), .out(out_sub0_3) );
  fifo_mux_2_1_bw24_simd1_16 fifo_mux_2_1e ( .in0(out_sub0_0), .in1(out_sub0_1), .sel(sel[1]), .out(out_sub1_0) );
  fifo_mux_2_1_bw24_simd1_15 fifo_mux_2_1f ( .in0(out_sub0_2), .in1(out_sub0_3), .sel(sel[1]), .out(out_sub1_1) );
  fifo_mux_2_1_bw24_simd1_14 fifo_mux_2_1g ( .in0(out_sub1_0), .in1(out_sub1_1), .sel(sel[2]), .out(out) );
endmodule


module fifo_mux_16_1_bw24_simd1_1 ( out, sel, in0, in1, in2, in3, in4, in5, 
        in6, in7, in8, in9, in10, in11, in12, in13, in14, in15 );
  output [23:0] out;
  input [3:0] sel;
  input [23:0] in0;
  input [23:0] in1;
  input [23:0] in2;
  input [23:0] in3;
  input [23:0] in4;
  input [23:0] in5;
  input [23:0] in6;
  input [23:0] in7;
  input [23:0] in8;
  input [23:0] in9;
  input [23:0] in10;
  input [23:0] in11;
  input [23:0] in12;
  input [23:0] in13;
  input [23:0] in14;
  input [23:0] in15;

  wire   [23:0] out_sub0;
  wire   [23:0] out_sub1;
  tri   [23:0] out;

  fifo_mux_8_1_bw24_simd1_3 mux_8_1a ( .out(out_sub0), .sel(sel[2:0]), .in0(
        in0), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .in5(in5), .in6(in6), 
        .in7(in7) );
  fifo_mux_8_1_bw24_simd1_2 mux_8_1b ( .out(out_sub1), .sel(sel[2:0]), .in0(
        in8), .in1(in9), .in2(in10), .in3(in11), .in4(in12), .in5(in13), .in6(
        in14), .in7(in15) );
  fifo_mux_2_1_bw24_simd1_29 mux_2_1a ( .in0(out_sub0), .in1(out_sub1), .sel(
        sel[3]), .out(out) );
endmodule


module sync_bw5_3 ( clk, in, out, reset );
  input [4:0] in;
  output [4:0] out;
  input clk, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12;
  wire   [4:0] int1;
  tri   clk;
  tri   reset;

  DFQD1 int1_reg_4_ ( .D(N7), .CP(clk), .Q(int1[4]) );
  DFQD1 int1_reg_3_ ( .D(N6), .CP(clk), .Q(int1[3]) );
  DFQD1 int1_reg_2_ ( .D(N5), .CP(clk), .Q(int1[2]) );
  DFQD1 int1_reg_1_ ( .D(N4), .CP(clk), .Q(int1[1]) );
  DFQD1 int1_reg_0_ ( .D(N3), .CP(clk), .Q(int1[0]) );
  DFQD1 int2_reg_4_ ( .D(N12), .CP(clk), .Q(out[4]) );
  DFQD1 int2_reg_3_ ( .D(N11), .CP(clk), .Q(out[3]) );
  DFQD1 int2_reg_2_ ( .D(N10), .CP(clk), .Q(out[2]) );
  DFQD1 int2_reg_1_ ( .D(N9), .CP(clk), .Q(out[1]) );
  DFQD1 int2_reg_0_ ( .D(N8), .CP(clk), .Q(out[0]) );
  INR2D0 U3 ( .A1(int1[0]), .B1(reset), .ZN(N8) );
  INR2D0 U4 ( .A1(int1[1]), .B1(reset), .ZN(N9) );
  INR2D0 U5 ( .A1(int1[2]), .B1(reset), .ZN(N10) );
  INR2D0 U6 ( .A1(int1[3]), .B1(reset), .ZN(N11) );
  INR2D0 U7 ( .A1(int1[4]), .B1(reset), .ZN(N12) );
  INR2D0 U8 ( .A1(in[0]), .B1(reset), .ZN(N3) );
  INR2D0 U9 ( .A1(in[1]), .B1(reset), .ZN(N4) );
  INR2D0 U10 ( .A1(in[2]), .B1(reset), .ZN(N5) );
  INR2D0 U11 ( .A1(in[3]), .B1(reset), .ZN(N6) );
  INR2D0 U12 ( .A1(in[4]), .B1(reset), .ZN(N7) );
endmodule


module ctrl_tx_1 ( clk_tx, rd_ptr_tx, wr_ptr_o, wr_ptr_gray_o, wr_en, sf_wr_en, 
        full_o, reset );
  input [4:0] rd_ptr_tx;
  output [4:0] wr_ptr_o;
  output [4:0] wr_ptr_gray_o;
  input clk_tx, wr_en, reset;
  output sf_wr_en, full_o;
  wire   n1, N8, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35;
  tri   clk_tx;
  tri   wr_en;
  tri   full_o;
  tri   reset;

  DFQD1 wr_ptr_reg_4_ ( .D(n42), .CP(clk_tx), .Q(n1) );
  DFQD1 wr_ptr_reg_3_ ( .D(n43), .CP(clk_tx), .Q(wr_ptr_o[3]) );
  DFQD1 wr_ptr_reg_2_ ( .D(n44), .CP(clk_tx), .Q(wr_ptr_o[2]) );
  DFQD1 wr_ptr_reg_1_ ( .D(n45), .CP(clk_tx), .Q(wr_ptr_o[1]) );
  DFQD1 wr_ptr_reg_0_ ( .D(n46), .CP(clk_tx), .Q(wr_ptr_o[0]) );
  DFQD1 wr_ptr_gray_reg_4_ ( .D(n41), .CP(clk_tx), .Q(wr_ptr_gray_o[4]) );
  DFQD1 wr_ptr_gray_reg_3_ ( .D(n40), .CP(clk_tx), .Q(wr_ptr_gray_o[3]) );
  DFQD1 wr_ptr_gray_reg_2_ ( .D(n39), .CP(clk_tx), .Q(wr_ptr_gray_o[2]) );
  DFQD1 wr_ptr_gray_reg_1_ ( .D(n38), .CP(clk_tx), .Q(wr_ptr_gray_o[1]) );
  DFQD1 wr_ptr_gray_reg_0_ ( .D(n37), .CP(clk_tx), .Q(wr_ptr_gray_o[0]) );
  DFQD1 full_reg ( .D(N8), .CP(clk_tx), .Q(full_o) );
  INVD0 U3 ( .I(n27), .ZN(n33) );
  INVD0 U4 ( .I(n25), .ZN(n24) );
  CKND2D0 U5 ( .A1(n2), .A2(n28), .ZN(n27) );
  NR2D0 U6 ( .A1(n21), .A2(n20), .ZN(N8) );
  AOI22D0 U7 ( .A1(n19), .A2(rd_ptr_tx[2]), .B1(n18), .B2(rd_ptr_tx[4]), .ZN(
        n17) );
  MOAI22D0 U8 ( .A1(n19), .A2(n31), .B1(wr_ptr_gray_o[2]), .B2(n33), .ZN(n39)
         );
  IOA21D0 U9 ( .A1(n33), .A2(wr_ptr_gray_o[4]), .B(n22), .ZN(n41) );
  OAI22D0 U10 ( .A1(n6), .A2(n5), .B1(n8), .B2(n27), .ZN(n43) );
  OAI21D0 U11 ( .A1(n10), .A2(n27), .B(n22), .ZN(n42) );
  NR2D0 U12 ( .A1(n29), .A2(n32), .ZN(n4) );
  OAI21D0 U13 ( .A1(n16), .A2(rd_ptr_tx[3]), .B(n15), .ZN(n21) );
  INVD0 U14 ( .I(n35), .ZN(n31) );
  INR2D0 U15 ( .A1(wr_en), .B1(full_o), .ZN(sf_wr_en) );
  INVD0 U16 ( .I(sf_wr_en), .ZN(n2) );
  INVD0 U17 ( .I(reset), .ZN(n28) );
  NR2D0 U18 ( .A1(reset), .A2(n2), .ZN(n35) );
  INVD0 U19 ( .I(n1), .ZN(n10) );
  INVD0 U20 ( .I(wr_ptr_o[2]), .ZN(n29) );
  CKND2D0 U21 ( .A1(sf_wr_en), .A2(wr_ptr_o[0]), .ZN(n25) );
  CKND2D0 U22 ( .A1(wr_ptr_o[1]), .A2(n24), .ZN(n32) );
  NR2D0 U23 ( .A1(wr_ptr_o[3]), .A2(n4), .ZN(n6) );
  MUX2ND0 U24 ( .I0(n1), .I1(n10), .S(n6), .ZN(n16) );
  AO22D0 U25 ( .A1(wr_ptr_gray_o[3]), .A2(n33), .B1(n35), .B2(n16), .Z(n40) );
  NR2D0 U26 ( .A1(wr_ptr_o[1]), .A2(n24), .ZN(n3) );
  MUX2ND0 U27 ( .I0(n29), .I1(wr_ptr_o[2]), .S(n3), .ZN(n12) );
  MOAI22D0 U28 ( .A1(n12), .A2(n31), .B1(wr_ptr_gray_o[1]), .B2(n33), .ZN(n38)
         );
  CKND2D0 U29 ( .A1(wr_ptr_o[3]), .A2(n4), .ZN(n9) );
  CKND2D0 U30 ( .A1(n35), .A2(n9), .ZN(n5) );
  INVD0 U31 ( .I(wr_ptr_o[3]), .ZN(n8) );
  CKAN2D0 U32 ( .A1(n32), .A2(n29), .Z(n7) );
  MUX2ND0 U33 ( .I0(n8), .I1(wr_ptr_o[3]), .S(n7), .ZN(n19) );
  MUX2ND0 U34 ( .I0(n1), .I1(n10), .S(n9), .ZN(n18) );
  CKND2D0 U35 ( .A1(n18), .A2(n35), .ZN(n22) );
  NR2D0 U36 ( .A1(sf_wr_en), .A2(wr_ptr_o[0]), .ZN(n23) );
  INVD0 U37 ( .I(wr_ptr_o[1]), .ZN(n34) );
  MUX2ND0 U38 ( .I0(n34), .I1(wr_ptr_o[1]), .S(rd_ptr_tx[0]), .ZN(n13) );
  AOI22D0 U39 ( .A1(n23), .A2(n13), .B1(n12), .B2(rd_ptr_tx[1]), .ZN(n11) );
  OAI221D0 U40 ( .A1(n23), .A2(n13), .B1(n12), .B2(rd_ptr_tx[1]), .C(n11), 
        .ZN(n14) );
  AOI211D0 U41 ( .A1(n16), .A2(rd_ptr_tx[3]), .B(reset), .C(n14), .ZN(n15) );
  OAI221D0 U42 ( .A1(n19), .A2(rd_ptr_tx[2]), .B1(n18), .B2(rd_ptr_tx[4]), .C(
        n17), .ZN(n20) );
  NR3D0 U43 ( .A1(n24), .A2(reset), .A3(n23), .ZN(n46) );
  CKND2D0 U44 ( .A1(n35), .A2(n32), .ZN(n26) );
  OAI222D0 U45 ( .A1(n34), .A2(n27), .B1(n34), .B2(n26), .C1(n26), .C2(n25), 
        .ZN(n45) );
  CKND2D0 U46 ( .A1(n28), .A2(n32), .ZN(n30) );
  OAI32D0 U47 ( .A1(wr_ptr_o[2]), .A2(n32), .A3(n31), .B1(n30), .B2(n29), .ZN(
        n44) );
  AO22D0 U48 ( .A1(n35), .A2(n34), .B1(wr_ptr_gray_o[0]), .B2(n33), .Z(n37) );
endmodule


module ctrl_rx_1 ( clk_rx, wr_ptr_rx, rd_ptr_o, rd_ptr_gray_o, rd_en, sf_rd_en, 
        empty_o, reset );
  input [4:0] wr_ptr_rx;
  output [4:0] rd_ptr_o;
  output [4:0] rd_ptr_gray_o;
  input clk_rx, rd_en, reset;
  output sf_rd_en, empty_o;
  wire   n1, N5, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;
  tri   clk_rx;
  tri   rd_en;
  tri   empty_o;
  tri   reset;

  DFQD1 rd_ptr_reg_4_ ( .D(n45), .CP(clk_rx), .Q(n1) );
  DFQD1 rd_ptr_reg_3_ ( .D(n46), .CP(clk_rx), .Q(rd_ptr_o[3]) );
  DFQD1 rd_ptr_gray_reg_3_ ( .D(n43), .CP(clk_rx), .Q(rd_ptr_gray_o[3]) );
  DFQD1 rd_ptr_gray_reg_2_ ( .D(n42), .CP(clk_rx), .Q(rd_ptr_gray_o[2]) );
  DFQD1 rd_ptr_gray_reg_1_ ( .D(n41), .CP(clk_rx), .Q(rd_ptr_gray_o[1]) );
  DFQD1 rd_ptr_gray_reg_0_ ( .D(n40), .CP(clk_rx), .Q(rd_ptr_gray_o[0]) );
  DFQD1 rd_ptr_gray_reg_4_ ( .D(n44), .CP(clk_rx), .Q(rd_ptr_gray_o[4]) );
  DFQD1 empty_reg ( .D(N5), .CP(clk_rx), .Q(empty_o) );
  DFQD4 rd_ptr_reg_1_ ( .D(n48), .CP(clk_rx), .Q(rd_ptr_o[1]) );
  DFQD4 rd_ptr_reg_0_ ( .D(n49), .CP(clk_rx), .Q(rd_ptr_o[0]) );
  DFQD2 rd_ptr_reg_2_ ( .D(n47), .CP(clk_rx), .Q(rd_ptr_o[2]) );
  AN2D0 U3 ( .A1(n17), .A2(rd_ptr_o[0]), .Z(n29) );
  CKND2D0 U4 ( .A1(rd_ptr_o[1]), .A2(n29), .ZN(n32) );
  INVD0 U5 ( .I(n32), .ZN(n5) );
  OAI22D0 U6 ( .A1(n16), .A2(wr_ptr_rx[2]), .B1(n15), .B2(wr_ptr_rx[3]), .ZN(
        n14) );
  AOI22D0 U7 ( .A1(n21), .A2(wr_ptr_rx[1]), .B1(n28), .B2(n20), .ZN(n19) );
  OAI21D0 U8 ( .A1(rd_ptr_o[3]), .A2(n11), .B(n1), .ZN(n10) );
  NR2D0 U9 ( .A1(n30), .A2(n32), .ZN(n11) );
  NR2D0 U10 ( .A1(n33), .A2(n7), .ZN(n31) );
  NR2D0 U11 ( .A1(n11), .A2(n34), .ZN(n7) );
  CKND2D0 U12 ( .A1(rd_ptr_o[3]), .A2(n11), .ZN(n12) );
  CKND2D0 U13 ( .A1(n27), .A2(n26), .ZN(N5) );
  OAI211D0 U14 ( .A1(wr_ptr_rx[4]), .A2(n25), .B(n24), .C(n23), .ZN(n26) );
  MOAI22D0 U15 ( .A1(n25), .A2(n34), .B1(n33), .B2(rd_ptr_gray_o[4]), .ZN(n44)
         );
  MOAI22D0 U16 ( .A1(n21), .A2(n34), .B1(rd_ptr_gray_o[1]), .B2(n33), .ZN(n41)
         );
  MOAI22D0 U17 ( .A1(n16), .A2(n34), .B1(rd_ptr_gray_o[2]), .B2(n33), .ZN(n42)
         );
  MOAI22D0 U18 ( .A1(n15), .A2(n34), .B1(rd_ptr_gray_o[3]), .B2(n33), .ZN(n43)
         );
  OAI32D0 U19 ( .A1(rd_ptr_o[3]), .A2(n9), .A3(n34), .B1(n31), .B2(n8), .ZN(
        n46) );
  INVD0 U20 ( .I(n11), .ZN(n9) );
  MOAI22D0 U21 ( .A1(n25), .A2(n34), .B1(n1), .B2(n33), .ZN(n45) );
  AOI21D0 U22 ( .A1(wr_ptr_rx[4]), .A2(n25), .B(n22), .ZN(n23) );
  OAI31D0 U23 ( .A1(rd_ptr_o[3]), .A2(n1), .A3(n11), .B(n10), .ZN(n15) );
  OAI31D0 U24 ( .A1(n5), .A2(n4), .A3(n34), .B(n3), .ZN(n48) );
  INR2D0 U25 ( .A1(rd_en), .B1(empty_o), .ZN(n17) );
  NR2D0 U26 ( .A1(rd_ptr_o[1]), .A2(n29), .ZN(n4) );
  INVD0 U27 ( .I(reset), .ZN(n27) );
  CKND2D0 U28 ( .A1(n17), .A2(n27), .ZN(n34) );
  NR2D0 U29 ( .A1(reset), .A2(n17), .ZN(n33) );
  CKND2D0 U30 ( .A1(rd_ptr_o[1]), .A2(n33), .ZN(n3) );
  INVD0 U31 ( .I(rd_ptr_o[2]), .ZN(n30) );
  MUX2ND0 U32 ( .I0(n30), .I1(rd_ptr_o[2]), .S(n4), .ZN(n21) );
  INVD0 U33 ( .I(rd_ptr_o[3]), .ZN(n8) );
  NR2D0 U34 ( .A1(rd_ptr_o[2]), .A2(n5), .ZN(n6) );
  MUX2ND0 U35 ( .I0(n8), .I1(rd_ptr_o[3]), .S(n6), .ZN(n16) );
  INVD0 U36 ( .I(n1), .ZN(n13) );
  MUX2ND0 U37 ( .I0(n13), .I1(n1), .S(n12), .ZN(n25) );
  AOI221D0 U38 ( .A1(n16), .A2(wr_ptr_rx[2]), .B1(wr_ptr_rx[3]), .B2(n15), .C(
        n14), .ZN(n24) );
  NR2D0 U39 ( .A1(n17), .A2(rd_ptr_o[0]), .ZN(n28) );
  INVD0 U40 ( .I(rd_ptr_o[1]), .ZN(n18) );
  MUX2ND0 U41 ( .I0(n18), .I1(rd_ptr_o[1]), .S(wr_ptr_rx[0]), .ZN(n20) );
  OAI221D0 U42 ( .A1(n21), .A2(wr_ptr_rx[1]), .B1(n28), .B2(n20), .C(n19), 
        .ZN(n22) );
  NR3D0 U43 ( .A1(reset), .A2(n29), .A3(n28), .ZN(n49) );
  OAI32D0 U44 ( .A1(rd_ptr_o[2]), .A2(n32), .A3(n34), .B1(n31), .B2(n30), .ZN(
        n47) );
  MOAI22D0 U45 ( .A1(rd_ptr_o[1]), .A2(n34), .B1(rd_ptr_gray_o[0]), .B2(n33), 
        .ZN(n40) );
endmodule


module sync_bw5_2 ( clk, in, out, reset );
  input [4:0] in;
  output [4:0] out;
  input clk, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12;
  wire   [4:0] int1;
  tri   clk;
  tri   reset;

  DFQD1 int2_reg_4_ ( .D(N12), .CP(clk), .Q(out[4]) );
  DFQD1 int2_reg_3_ ( .D(N11), .CP(clk), .Q(out[3]) );
  DFQD1 int2_reg_2_ ( .D(N10), .CP(clk), .Q(out[2]) );
  DFQD1 int2_reg_1_ ( .D(N9), .CP(clk), .Q(out[1]) );
  DFQD1 int2_reg_0_ ( .D(N8), .CP(clk), .Q(out[0]) );
  DFQD1 int1_reg_4_ ( .D(N7), .CP(clk), .Q(int1[4]) );
  DFQD1 int1_reg_3_ ( .D(N6), .CP(clk), .Q(int1[3]) );
  DFQD1 int1_reg_2_ ( .D(N5), .CP(clk), .Q(int1[2]) );
  DFQD1 int1_reg_1_ ( .D(N4), .CP(clk), .Q(int1[1]) );
  DFQD1 int1_reg_0_ ( .D(N3), .CP(clk), .Q(int1[0]) );
  INR2D0 U3 ( .A1(int1[0]), .B1(reset), .ZN(N8) );
  INR2D0 U4 ( .A1(int1[1]), .B1(reset), .ZN(N9) );
  INR2D0 U5 ( .A1(int1[2]), .B1(reset), .ZN(N10) );
  INR2D0 U6 ( .A1(int1[3]), .B1(reset), .ZN(N11) );
  INR2D0 U7 ( .A1(int1[4]), .B1(reset), .ZN(N12) );
  INR2D0 U8 ( .A1(in[0]), .B1(reset), .ZN(N3) );
  INR2D0 U9 ( .A1(in[1]), .B1(reset), .ZN(N4) );
  INR2D0 U10 ( .A1(in[2]), .B1(reset), .ZN(N5) );
  INR2D0 U11 ( .A1(in[3]), .B1(reset), .ZN(N6) );
  INR2D0 U12 ( .A1(in[4]), .B1(reset), .ZN(N7) );
endmodule


module async_fifo_depth16_bw24_1 ( clk_rx, clk_tx, wr_data, rd_data, wr_en, 
        rd_en, o_full, o_empty, reset );
  input [23:0] wr_data;
  output [23:0] rd_data;
  input clk_rx, clk_tx, wr_en, rd_en, reset;
  output o_full, o_empty;
  wire   sf_wr_en, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2;
  wire   [383:0] q;
  wire   [3:0] rd_ptr;
  wire   [4:0] rd_ptr_gray;
  wire   [4:0] rd_ptr_tx;
  wire   [4:0] wr_ptr_gray;
  wire   [4:0] wr_ptr_rx;
  wire   [3:0] wr_ptr;
  tri   clk_rx;
  tri   clk_tx;
  tri   [23:0] wr_data;
  tri   [23:0] rd_data;
  tri   wr_en;
  tri   rd_en;
  tri   o_full;
  tri   o_empty;
  tri   reset;

  fifo_mux_16_1_bw24_simd1_1 fifo_mux_16_1a ( .out(rd_data), .sel(rd_ptr), 
        .in0(q[383:360]), .in1(q[359:336]), .in2(q[335:312]), .in3(q[311:288]), 
        .in4(q[287:264]), .in5(q[263:240]), .in6(q[239:216]), .in7(q[215:192]), 
        .in8(q[191:168]), .in9(q[167:144]), .in10(q[143:120]), .in11(q[119:96]), .in12(q[95:72]), .in13(q[71:48]), .in14(q[47:24]), .in15(q[23:0]) );
  sync_bw5_3 r2w_sync ( .clk(clk_tx), .in(rd_ptr_gray), .out(rd_ptr_tx), 
        .reset(reset) );
  sync_bw5_2 w2r_sync ( .clk(clk_rx), .in(wr_ptr_gray), .out(wr_ptr_rx), 
        .reset(reset) );
  ctrl_tx_1 ctrl_tx_instance ( .clk_tx(clk_tx), .rd_ptr_tx(rd_ptr_tx), 
        .wr_ptr_o({SYNOPSYS_UNCONNECTED_1, wr_ptr}), .wr_ptr_gray_o(
        wr_ptr_gray), .wr_en(wr_en), .sf_wr_en(sf_wr_en), .full_o(o_full), 
        .reset(reset) );
  ctrl_rx_1 ctrl_rx_instance ( .clk_rx(clk_rx), .wr_ptr_rx(wr_ptr_rx), 
        .rd_ptr_o({SYNOPSYS_UNCONNECTED_2, rd_ptr}), .rd_ptr_gray_o(
        rd_ptr_gray), .rd_en(rd_en), .empty_o(o_empty), .reset(reset) );
  DFQD1 q_reg_4__23_ ( .D(n332), .CP(clk_tx), .Q(q[287]) );
  DFQD1 q_reg_4__22_ ( .D(n331), .CP(clk_tx), .Q(q[286]) );
  DFQD1 q_reg_4__21_ ( .D(n330), .CP(clk_tx), .Q(q[285]) );
  DFQD1 q_reg_4__20_ ( .D(n329), .CP(clk_tx), .Q(q[284]) );
  DFQD1 q_reg_4__19_ ( .D(n328), .CP(clk_tx), .Q(q[283]) );
  DFQD1 q_reg_4__18_ ( .D(n327), .CP(clk_tx), .Q(q[282]) );
  DFQD1 q_reg_4__17_ ( .D(n326), .CP(clk_tx), .Q(q[281]) );
  DFQD1 q_reg_4__16_ ( .D(n325), .CP(clk_tx), .Q(q[280]) );
  DFQD1 q_reg_4__15_ ( .D(n324), .CP(clk_tx), .Q(q[279]) );
  DFQD1 q_reg_4__14_ ( .D(n323), .CP(clk_tx), .Q(q[278]) );
  DFQD1 q_reg_4__13_ ( .D(n322), .CP(clk_tx), .Q(q[277]) );
  DFQD1 q_reg_4__12_ ( .D(n321), .CP(clk_tx), .Q(q[276]) );
  DFQD1 q_reg_4__11_ ( .D(n320), .CP(clk_tx), .Q(q[275]) );
  DFQD1 q_reg_4__10_ ( .D(n319), .CP(clk_tx), .Q(q[274]) );
  DFQD1 q_reg_4__9_ ( .D(n318), .CP(clk_tx), .Q(q[273]) );
  DFQD1 q_reg_6__23_ ( .D(n284), .CP(clk_tx), .Q(q[239]) );
  DFQD1 q_reg_6__22_ ( .D(n283), .CP(clk_tx), .Q(q[238]) );
  DFQD1 q_reg_6__21_ ( .D(n282), .CP(clk_tx), .Q(q[237]) );
  DFQD1 q_reg_6__20_ ( .D(n281), .CP(clk_tx), .Q(q[236]) );
  DFQD1 q_reg_6__19_ ( .D(n280), .CP(clk_tx), .Q(q[235]) );
  DFQD1 q_reg_6__18_ ( .D(n279), .CP(clk_tx), .Q(q[234]) );
  DFQD1 q_reg_6__17_ ( .D(n278), .CP(clk_tx), .Q(q[233]) );
  DFQD1 q_reg_6__16_ ( .D(n277), .CP(clk_tx), .Q(q[232]) );
  DFQD1 q_reg_6__15_ ( .D(n276), .CP(clk_tx), .Q(q[231]) );
  DFQD1 q_reg_6__14_ ( .D(n275), .CP(clk_tx), .Q(q[230]) );
  DFQD1 q_reg_6__13_ ( .D(n274), .CP(clk_tx), .Q(q[229]) );
  DFQD1 q_reg_6__12_ ( .D(n273), .CP(clk_tx), .Q(q[228]) );
  DFQD1 q_reg_6__11_ ( .D(n272), .CP(clk_tx), .Q(q[227]) );
  DFQD1 q_reg_6__10_ ( .D(n271), .CP(clk_tx), .Q(q[226]) );
  DFQD1 q_reg_6__9_ ( .D(n270), .CP(clk_tx), .Q(q[225]) );
  DFQD1 q_reg_6__8_ ( .D(n269), .CP(clk_tx), .Q(q[224]) );
  DFQD1 q_reg_6__7_ ( .D(n268), .CP(clk_tx), .Q(q[223]) );
  DFQD1 q_reg_6__6_ ( .D(n267), .CP(clk_tx), .Q(q[222]) );
  DFQD1 q_reg_6__5_ ( .D(n266), .CP(clk_tx), .Q(q[221]) );
  DFQD1 q_reg_6__4_ ( .D(n265), .CP(clk_tx), .Q(q[220]) );
  DFQD1 q_reg_6__3_ ( .D(n264), .CP(clk_tx), .Q(q[219]) );
  DFQD1 q_reg_6__2_ ( .D(n263), .CP(clk_tx), .Q(q[218]) );
  DFQD1 q_reg_6__1_ ( .D(n262), .CP(clk_tx), .Q(q[217]) );
  DFQD1 q_reg_6__0_ ( .D(n261), .CP(clk_tx), .Q(q[216]) );
  EDFQD1 q_reg_4__8_ ( .D(wr_data[8]), .E(n20), .CP(clk_tx), .Q(q[272]) );
  EDFQD1 q_reg_4__7_ ( .D(wr_data[7]), .E(n20), .CP(clk_tx), .Q(q[271]) );
  EDFQD1 q_reg_4__6_ ( .D(wr_data[6]), .E(n20), .CP(clk_tx), .Q(q[270]) );
  EDFQD1 q_reg_4__5_ ( .D(wr_data[5]), .E(n20), .CP(clk_tx), .Q(q[269]) );
  EDFQD1 q_reg_4__4_ ( .D(wr_data[4]), .E(n20), .CP(clk_tx), .Q(q[268]) );
  EDFQD1 q_reg_4__3_ ( .D(wr_data[3]), .E(n20), .CP(clk_tx), .Q(q[267]) );
  EDFQD1 q_reg_4__2_ ( .D(wr_data[2]), .E(n20), .CP(clk_tx), .Q(q[266]) );
  EDFQD1 q_reg_4__1_ ( .D(wr_data[1]), .E(n20), .CP(clk_tx), .Q(q[265]) );
  EDFQD1 q_reg_4__0_ ( .D(wr_data[0]), .E(n20), .CP(clk_tx), .Q(q[264]) );
  EDFQD1 q_reg_2__23_ ( .D(wr_data[23]), .E(n18), .CP(clk_tx), .Q(q[335]) );
  EDFQD1 q_reg_2__22_ ( .D(wr_data[22]), .E(n18), .CP(clk_tx), .Q(q[334]) );
  EDFQD1 q_reg_2__21_ ( .D(wr_data[21]), .E(n18), .CP(clk_tx), .Q(q[333]) );
  EDFQD1 q_reg_2__20_ ( .D(wr_data[20]), .E(n18), .CP(clk_tx), .Q(q[332]) );
  EDFQD1 q_reg_2__19_ ( .D(wr_data[19]), .E(n18), .CP(clk_tx), .Q(q[331]) );
  EDFQD1 q_reg_2__18_ ( .D(wr_data[18]), .E(n18), .CP(clk_tx), .Q(q[330]) );
  EDFQD1 q_reg_2__17_ ( .D(wr_data[17]), .E(n18), .CP(clk_tx), .Q(q[329]) );
  EDFQD1 q_reg_2__16_ ( .D(wr_data[16]), .E(n18), .CP(clk_tx), .Q(q[328]) );
  EDFQD1 q_reg_2__15_ ( .D(wr_data[15]), .E(n18), .CP(clk_tx), .Q(q[327]) );
  EDFQD1 q_reg_2__14_ ( .D(wr_data[14]), .E(n18), .CP(clk_tx), .Q(q[326]) );
  EDFQD1 q_reg_2__13_ ( .D(wr_data[13]), .E(n18), .CP(clk_tx), .Q(q[325]) );
  EDFQD1 q_reg_2__12_ ( .D(wr_data[12]), .E(n18), .CP(clk_tx), .Q(q[324]) );
  EDFQD1 q_reg_2__11_ ( .D(wr_data[11]), .E(n18), .CP(clk_tx), .Q(q[323]) );
  EDFQD1 q_reg_2__10_ ( .D(wr_data[10]), .E(n18), .CP(clk_tx), .Q(q[322]) );
  EDFQD1 q_reg_2__9_ ( .D(wr_data[9]), .E(n18), .CP(clk_tx), .Q(q[321]) );
  EDFQD1 q_reg_2__8_ ( .D(wr_data[8]), .E(n18), .CP(clk_tx), .Q(q[320]) );
  EDFQD1 q_reg_2__7_ ( .D(wr_data[7]), .E(n18), .CP(clk_tx), .Q(q[319]) );
  EDFQD1 q_reg_2__6_ ( .D(wr_data[6]), .E(n18), .CP(clk_tx), .Q(q[318]) );
  EDFQD1 q_reg_2__5_ ( .D(wr_data[5]), .E(n18), .CP(clk_tx), .Q(q[317]) );
  EDFQD1 q_reg_2__4_ ( .D(wr_data[4]), .E(n18), .CP(clk_tx), .Q(q[316]) );
  EDFQD1 q_reg_2__3_ ( .D(wr_data[3]), .E(n18), .CP(clk_tx), .Q(q[315]) );
  EDFQD1 q_reg_2__2_ ( .D(wr_data[2]), .E(n18), .CP(clk_tx), .Q(q[314]) );
  EDFQD1 q_reg_2__1_ ( .D(wr_data[1]), .E(n18), .CP(clk_tx), .Q(q[313]) );
  EDFQD1 q_reg_2__0_ ( .D(wr_data[0]), .E(n18), .CP(clk_tx), .Q(q[312]) );
  EDFQD1 q_reg_7__23_ ( .D(wr_data[23]), .E(n22), .CP(clk_tx), .Q(q[215]) );
  EDFQD1 q_reg_7__22_ ( .D(wr_data[22]), .E(n22), .CP(clk_tx), .Q(q[214]) );
  EDFQD1 q_reg_7__21_ ( .D(wr_data[21]), .E(n22), .CP(clk_tx), .Q(q[213]) );
  EDFQD1 q_reg_7__20_ ( .D(wr_data[20]), .E(n22), .CP(clk_tx), .Q(q[212]) );
  EDFQD1 q_reg_7__19_ ( .D(wr_data[19]), .E(n22), .CP(clk_tx), .Q(q[211]) );
  EDFQD1 q_reg_7__18_ ( .D(wr_data[18]), .E(n22), .CP(clk_tx), .Q(q[210]) );
  EDFQD1 q_reg_7__17_ ( .D(wr_data[17]), .E(n22), .CP(clk_tx), .Q(q[209]) );
  EDFQD1 q_reg_7__16_ ( .D(wr_data[16]), .E(n22), .CP(clk_tx), .Q(q[208]) );
  EDFQD1 q_reg_7__15_ ( .D(wr_data[15]), .E(n22), .CP(clk_tx), .Q(q[207]) );
  EDFQD1 q_reg_7__14_ ( .D(wr_data[14]), .E(n22), .CP(clk_tx), .Q(q[206]) );
  EDFQD1 q_reg_7__13_ ( .D(wr_data[13]), .E(n22), .CP(clk_tx), .Q(q[205]) );
  EDFQD1 q_reg_7__12_ ( .D(wr_data[12]), .E(n22), .CP(clk_tx), .Q(q[204]) );
  EDFQD1 q_reg_7__11_ ( .D(wr_data[11]), .E(n22), .CP(clk_tx), .Q(q[203]) );
  EDFQD1 q_reg_7__10_ ( .D(wr_data[10]), .E(n22), .CP(clk_tx), .Q(q[202]) );
  EDFQD1 q_reg_7__9_ ( .D(wr_data[9]), .E(n22), .CP(clk_tx), .Q(q[201]) );
  EDFQD1 q_reg_7__8_ ( .D(wr_data[8]), .E(n22), .CP(clk_tx), .Q(q[200]) );
  EDFQD1 q_reg_7__7_ ( .D(wr_data[7]), .E(n22), .CP(clk_tx), .Q(q[199]) );
  EDFQD1 q_reg_7__6_ ( .D(wr_data[6]), .E(n22), .CP(clk_tx), .Q(q[198]) );
  EDFQD1 q_reg_7__5_ ( .D(wr_data[5]), .E(n22), .CP(clk_tx), .Q(q[197]) );
  EDFQD1 q_reg_7__4_ ( .D(wr_data[4]), .E(n22), .CP(clk_tx), .Q(q[196]) );
  EDFQD1 q_reg_7__3_ ( .D(wr_data[3]), .E(n22), .CP(clk_tx), .Q(q[195]) );
  EDFQD1 q_reg_7__2_ ( .D(wr_data[2]), .E(n22), .CP(clk_tx), .Q(q[194]) );
  EDFQD1 q_reg_7__1_ ( .D(wr_data[1]), .E(n22), .CP(clk_tx), .Q(q[193]) );
  EDFQD1 q_reg_7__0_ ( .D(wr_data[0]), .E(n22), .CP(clk_tx), .Q(q[192]) );
  EDFQD1 q_reg_5__23_ ( .D(wr_data[23]), .E(n21), .CP(clk_tx), .Q(q[263]) );
  EDFQD1 q_reg_5__22_ ( .D(wr_data[22]), .E(n21), .CP(clk_tx), .Q(q[262]) );
  EDFQD1 q_reg_5__21_ ( .D(wr_data[21]), .E(n21), .CP(clk_tx), .Q(q[261]) );
  EDFQD1 q_reg_5__20_ ( .D(wr_data[20]), .E(n21), .CP(clk_tx), .Q(q[260]) );
  EDFQD1 q_reg_5__19_ ( .D(wr_data[19]), .E(n21), .CP(clk_tx), .Q(q[259]) );
  EDFQD1 q_reg_5__18_ ( .D(wr_data[18]), .E(n21), .CP(clk_tx), .Q(q[258]) );
  EDFQD1 q_reg_5__17_ ( .D(wr_data[17]), .E(n21), .CP(clk_tx), .Q(q[257]) );
  EDFQD1 q_reg_5__16_ ( .D(wr_data[16]), .E(n21), .CP(clk_tx), .Q(q[256]) );
  EDFQD1 q_reg_5__15_ ( .D(wr_data[15]), .E(n21), .CP(clk_tx), .Q(q[255]) );
  EDFQD1 q_reg_5__14_ ( .D(wr_data[14]), .E(n21), .CP(clk_tx), .Q(q[254]) );
  EDFQD1 q_reg_5__13_ ( .D(wr_data[13]), .E(n21), .CP(clk_tx), .Q(q[253]) );
  EDFQD1 q_reg_5__12_ ( .D(wr_data[12]), .E(n21), .CP(clk_tx), .Q(q[252]) );
  EDFQD1 q_reg_5__11_ ( .D(wr_data[11]), .E(n21), .CP(clk_tx), .Q(q[251]) );
  EDFQD1 q_reg_5__10_ ( .D(wr_data[10]), .E(n21), .CP(clk_tx), .Q(q[250]) );
  EDFQD1 q_reg_5__9_ ( .D(wr_data[9]), .E(n21), .CP(clk_tx), .Q(q[249]) );
  EDFQD1 q_reg_5__8_ ( .D(wr_data[8]), .E(n21), .CP(clk_tx), .Q(q[248]) );
  EDFQD1 q_reg_5__7_ ( .D(wr_data[7]), .E(n21), .CP(clk_tx), .Q(q[247]) );
  EDFQD1 q_reg_5__6_ ( .D(wr_data[6]), .E(n21), .CP(clk_tx), .Q(q[246]) );
  EDFQD1 q_reg_5__5_ ( .D(wr_data[5]), .E(n21), .CP(clk_tx), .Q(q[245]) );
  EDFQD1 q_reg_5__4_ ( .D(wr_data[4]), .E(n21), .CP(clk_tx), .Q(q[244]) );
  EDFQD1 q_reg_5__3_ ( .D(wr_data[3]), .E(n21), .CP(clk_tx), .Q(q[243]) );
  EDFQD1 q_reg_5__2_ ( .D(wr_data[2]), .E(n21), .CP(clk_tx), .Q(q[242]) );
  EDFQD1 q_reg_5__1_ ( .D(wr_data[1]), .E(n21), .CP(clk_tx), .Q(q[241]) );
  EDFQD1 q_reg_5__0_ ( .D(wr_data[0]), .E(n21), .CP(clk_tx), .Q(q[240]) );
  EDFQD1 q_reg_3__23_ ( .D(wr_data[23]), .E(n19), .CP(clk_tx), .Q(q[311]) );
  EDFQD1 q_reg_3__22_ ( .D(wr_data[22]), .E(n19), .CP(clk_tx), .Q(q[310]) );
  EDFQD1 q_reg_3__21_ ( .D(wr_data[21]), .E(n19), .CP(clk_tx), .Q(q[309]) );
  EDFQD1 q_reg_3__20_ ( .D(wr_data[20]), .E(n19), .CP(clk_tx), .Q(q[308]) );
  EDFQD1 q_reg_3__19_ ( .D(wr_data[19]), .E(n19), .CP(clk_tx), .Q(q[307]) );
  EDFQD1 q_reg_3__18_ ( .D(wr_data[18]), .E(n19), .CP(clk_tx), .Q(q[306]) );
  EDFQD1 q_reg_3__17_ ( .D(wr_data[17]), .E(n19), .CP(clk_tx), .Q(q[305]) );
  EDFQD1 q_reg_3__16_ ( .D(wr_data[16]), .E(n19), .CP(clk_tx), .Q(q[304]) );
  EDFQD1 q_reg_3__15_ ( .D(wr_data[15]), .E(n19), .CP(clk_tx), .Q(q[303]) );
  EDFQD1 q_reg_3__14_ ( .D(wr_data[14]), .E(n19), .CP(clk_tx), .Q(q[302]) );
  EDFQD1 q_reg_3__13_ ( .D(wr_data[13]), .E(n19), .CP(clk_tx), .Q(q[301]) );
  EDFQD1 q_reg_3__12_ ( .D(wr_data[12]), .E(n19), .CP(clk_tx), .Q(q[300]) );
  EDFQD1 q_reg_3__11_ ( .D(wr_data[11]), .E(n19), .CP(clk_tx), .Q(q[299]) );
  EDFQD1 q_reg_3__10_ ( .D(wr_data[10]), .E(n19), .CP(clk_tx), .Q(q[298]) );
  EDFQD1 q_reg_3__9_ ( .D(wr_data[9]), .E(n19), .CP(clk_tx), .Q(q[297]) );
  EDFQD1 q_reg_3__8_ ( .D(wr_data[8]), .E(n19), .CP(clk_tx), .Q(q[296]) );
  EDFQD1 q_reg_3__7_ ( .D(wr_data[7]), .E(n19), .CP(clk_tx), .Q(q[295]) );
  EDFQD1 q_reg_3__6_ ( .D(wr_data[6]), .E(n19), .CP(clk_tx), .Q(q[294]) );
  EDFQD1 q_reg_3__5_ ( .D(wr_data[5]), .E(n19), .CP(clk_tx), .Q(q[293]) );
  EDFQD1 q_reg_3__4_ ( .D(wr_data[4]), .E(n19), .CP(clk_tx), .Q(q[292]) );
  EDFQD1 q_reg_3__3_ ( .D(wr_data[3]), .E(n19), .CP(clk_tx), .Q(q[291]) );
  EDFQD1 q_reg_3__2_ ( .D(wr_data[2]), .E(n19), .CP(clk_tx), .Q(q[290]) );
  EDFQD1 q_reg_3__1_ ( .D(wr_data[1]), .E(n19), .CP(clk_tx), .Q(q[289]) );
  EDFQD1 q_reg_3__0_ ( .D(wr_data[0]), .E(n19), .CP(clk_tx), .Q(q[288]) );
  EDFQD1 q_reg_0__23_ ( .D(wr_data[23]), .E(n16), .CP(clk_tx), .Q(q[383]) );
  EDFQD1 q_reg_0__22_ ( .D(wr_data[22]), .E(n16), .CP(clk_tx), .Q(q[382]) );
  EDFQD1 q_reg_0__21_ ( .D(wr_data[21]), .E(n16), .CP(clk_tx), .Q(q[381]) );
  EDFQD1 q_reg_0__20_ ( .D(wr_data[20]), .E(n16), .CP(clk_tx), .Q(q[380]) );
  EDFQD1 q_reg_0__19_ ( .D(wr_data[19]), .E(n16), .CP(clk_tx), .Q(q[379]) );
  EDFQD1 q_reg_0__18_ ( .D(wr_data[18]), .E(n16), .CP(clk_tx), .Q(q[378]) );
  EDFQD1 q_reg_0__17_ ( .D(wr_data[17]), .E(n16), .CP(clk_tx), .Q(q[377]) );
  EDFQD1 q_reg_0__16_ ( .D(wr_data[16]), .E(n16), .CP(clk_tx), .Q(q[376]) );
  EDFQD1 q_reg_0__15_ ( .D(wr_data[15]), .E(n16), .CP(clk_tx), .Q(q[375]) );
  EDFQD1 q_reg_0__14_ ( .D(wr_data[14]), .E(n16), .CP(clk_tx), .Q(q[374]) );
  EDFQD1 q_reg_0__13_ ( .D(wr_data[13]), .E(n16), .CP(clk_tx), .Q(q[373]) );
  EDFQD1 q_reg_0__12_ ( .D(wr_data[12]), .E(n16), .CP(clk_tx), .Q(q[372]) );
  EDFQD1 q_reg_0__11_ ( .D(wr_data[11]), .E(n16), .CP(clk_tx), .Q(q[371]) );
  EDFQD1 q_reg_0__10_ ( .D(wr_data[10]), .E(n16), .CP(clk_tx), .Q(q[370]) );
  EDFQD1 q_reg_0__9_ ( .D(wr_data[9]), .E(n16), .CP(clk_tx), .Q(q[369]) );
  EDFQD1 q_reg_0__8_ ( .D(wr_data[8]), .E(n16), .CP(clk_tx), .Q(q[368]) );
  EDFQD1 q_reg_0__7_ ( .D(wr_data[7]), .E(n16), .CP(clk_tx), .Q(q[367]) );
  EDFQD1 q_reg_0__6_ ( .D(wr_data[6]), .E(n16), .CP(clk_tx), .Q(q[366]) );
  EDFQD1 q_reg_0__5_ ( .D(wr_data[5]), .E(n16), .CP(clk_tx), .Q(q[365]) );
  EDFQD1 q_reg_0__4_ ( .D(wr_data[4]), .E(n16), .CP(clk_tx), .Q(q[364]) );
  EDFQD1 q_reg_0__3_ ( .D(wr_data[3]), .E(n16), .CP(clk_tx), .Q(q[363]) );
  EDFQD1 q_reg_0__2_ ( .D(wr_data[2]), .E(n16), .CP(clk_tx), .Q(q[362]) );
  EDFQD1 q_reg_0__1_ ( .D(wr_data[1]), .E(n16), .CP(clk_tx), .Q(q[361]) );
  EDFQD1 q_reg_0__0_ ( .D(wr_data[0]), .E(n16), .CP(clk_tx), .Q(q[360]) );
  EDFQD1 q_reg_1__23_ ( .D(wr_data[23]), .E(n17), .CP(clk_tx), .Q(q[359]) );
  EDFQD1 q_reg_1__22_ ( .D(wr_data[22]), .E(n17), .CP(clk_tx), .Q(q[358]) );
  EDFQD1 q_reg_1__21_ ( .D(wr_data[21]), .E(n17), .CP(clk_tx), .Q(q[357]) );
  EDFQD1 q_reg_1__20_ ( .D(wr_data[20]), .E(n17), .CP(clk_tx), .Q(q[356]) );
  EDFQD1 q_reg_1__19_ ( .D(wr_data[19]), .E(n17), .CP(clk_tx), .Q(q[355]) );
  EDFQD1 q_reg_1__18_ ( .D(wr_data[18]), .E(n17), .CP(clk_tx), .Q(q[354]) );
  EDFQD1 q_reg_1__17_ ( .D(wr_data[17]), .E(n17), .CP(clk_tx), .Q(q[353]) );
  EDFQD1 q_reg_1__16_ ( .D(wr_data[16]), .E(n17), .CP(clk_tx), .Q(q[352]) );
  EDFQD1 q_reg_1__15_ ( .D(wr_data[15]), .E(n17), .CP(clk_tx), .Q(q[351]) );
  EDFQD1 q_reg_1__14_ ( .D(wr_data[14]), .E(n17), .CP(clk_tx), .Q(q[350]) );
  EDFQD1 q_reg_1__13_ ( .D(wr_data[13]), .E(n17), .CP(clk_tx), .Q(q[349]) );
  EDFQD1 q_reg_1__12_ ( .D(wr_data[12]), .E(n17), .CP(clk_tx), .Q(q[348]) );
  EDFQD1 q_reg_1__11_ ( .D(wr_data[11]), .E(n17), .CP(clk_tx), .Q(q[347]) );
  EDFQD1 q_reg_1__10_ ( .D(wr_data[10]), .E(n17), .CP(clk_tx), .Q(q[346]) );
  EDFQD1 q_reg_1__9_ ( .D(wr_data[9]), .E(n17), .CP(clk_tx), .Q(q[345]) );
  EDFQD1 q_reg_1__8_ ( .D(wr_data[8]), .E(n17), .CP(clk_tx), .Q(q[344]) );
  EDFQD1 q_reg_1__7_ ( .D(wr_data[7]), .E(n17), .CP(clk_tx), .Q(q[343]) );
  EDFQD1 q_reg_1__6_ ( .D(wr_data[6]), .E(n17), .CP(clk_tx), .Q(q[342]) );
  EDFQD1 q_reg_1__5_ ( .D(wr_data[5]), .E(n17), .CP(clk_tx), .Q(q[341]) );
  EDFQD1 q_reg_1__4_ ( .D(wr_data[4]), .E(n17), .CP(clk_tx), .Q(q[340]) );
  EDFQD1 q_reg_1__3_ ( .D(wr_data[3]), .E(n17), .CP(clk_tx), .Q(q[339]) );
  EDFQD1 q_reg_1__2_ ( .D(wr_data[2]), .E(n17), .CP(clk_tx), .Q(q[338]) );
  EDFQD1 q_reg_1__1_ ( .D(wr_data[1]), .E(n17), .CP(clk_tx), .Q(q[337]) );
  EDFQD1 q_reg_1__0_ ( .D(wr_data[0]), .E(n17), .CP(clk_tx), .Q(q[336]) );
  EDFQD1 q_reg_15__23_ ( .D(wr_data[23]), .E(n30), .CP(clk_tx), .Q(q[23]) );
  EDFQD1 q_reg_15__22_ ( .D(wr_data[22]), .E(n30), .CP(clk_tx), .Q(q[22]) );
  EDFQD1 q_reg_15__21_ ( .D(wr_data[21]), .E(n30), .CP(clk_tx), .Q(q[21]) );
  EDFQD1 q_reg_15__20_ ( .D(wr_data[20]), .E(n30), .CP(clk_tx), .Q(q[20]) );
  EDFQD1 q_reg_15__19_ ( .D(wr_data[19]), .E(n30), .CP(clk_tx), .Q(q[19]) );
  EDFQD1 q_reg_15__18_ ( .D(wr_data[18]), .E(n30), .CP(clk_tx), .Q(q[18]) );
  EDFQD1 q_reg_15__17_ ( .D(wr_data[17]), .E(n30), .CP(clk_tx), .Q(q[17]) );
  EDFQD1 q_reg_15__16_ ( .D(wr_data[16]), .E(n30), .CP(clk_tx), .Q(q[16]) );
  EDFQD1 q_reg_15__15_ ( .D(wr_data[15]), .E(n30), .CP(clk_tx), .Q(q[15]) );
  EDFQD1 q_reg_15__14_ ( .D(wr_data[14]), .E(n30), .CP(clk_tx), .Q(q[14]) );
  EDFQD1 q_reg_15__13_ ( .D(wr_data[13]), .E(n30), .CP(clk_tx), .Q(q[13]) );
  EDFQD1 q_reg_15__12_ ( .D(wr_data[12]), .E(n30), .CP(clk_tx), .Q(q[12]) );
  EDFQD1 q_reg_15__11_ ( .D(wr_data[11]), .E(n30), .CP(clk_tx), .Q(q[11]) );
  EDFQD1 q_reg_15__10_ ( .D(wr_data[10]), .E(n30), .CP(clk_tx), .Q(q[10]) );
  EDFQD1 q_reg_15__9_ ( .D(wr_data[9]), .E(n30), .CP(clk_tx), .Q(q[9]) );
  EDFQD1 q_reg_15__8_ ( .D(wr_data[8]), .E(n30), .CP(clk_tx), .Q(q[8]) );
  EDFQD1 q_reg_15__7_ ( .D(wr_data[7]), .E(n30), .CP(clk_tx), .Q(q[7]) );
  EDFQD1 q_reg_15__6_ ( .D(wr_data[6]), .E(n30), .CP(clk_tx), .Q(q[6]) );
  EDFQD1 q_reg_15__5_ ( .D(wr_data[5]), .E(n30), .CP(clk_tx), .Q(q[5]) );
  EDFQD1 q_reg_15__4_ ( .D(wr_data[4]), .E(n30), .CP(clk_tx), .Q(q[4]) );
  EDFQD1 q_reg_15__3_ ( .D(wr_data[3]), .E(n30), .CP(clk_tx), .Q(q[3]) );
  EDFQD1 q_reg_15__2_ ( .D(wr_data[2]), .E(n30), .CP(clk_tx), .Q(q[2]) );
  EDFQD1 q_reg_15__1_ ( .D(wr_data[1]), .E(n30), .CP(clk_tx), .Q(q[1]) );
  EDFQD1 q_reg_15__0_ ( .D(wr_data[0]), .E(n30), .CP(clk_tx), .Q(q[0]) );
  EDFQD1 q_reg_13__23_ ( .D(wr_data[23]), .E(n28), .CP(clk_tx), .Q(q[71]) );
  EDFQD1 q_reg_13__22_ ( .D(wr_data[22]), .E(n28), .CP(clk_tx), .Q(q[70]) );
  EDFQD1 q_reg_13__21_ ( .D(wr_data[21]), .E(n28), .CP(clk_tx), .Q(q[69]) );
  EDFQD1 q_reg_13__20_ ( .D(wr_data[20]), .E(n28), .CP(clk_tx), .Q(q[68]) );
  EDFQD1 q_reg_13__19_ ( .D(wr_data[19]), .E(n28), .CP(clk_tx), .Q(q[67]) );
  EDFQD1 q_reg_13__18_ ( .D(wr_data[18]), .E(n28), .CP(clk_tx), .Q(q[66]) );
  EDFQD1 q_reg_13__17_ ( .D(wr_data[17]), .E(n28), .CP(clk_tx), .Q(q[65]) );
  EDFQD1 q_reg_13__16_ ( .D(wr_data[16]), .E(n28), .CP(clk_tx), .Q(q[64]) );
  EDFQD1 q_reg_13__15_ ( .D(wr_data[15]), .E(n28), .CP(clk_tx), .Q(q[63]) );
  EDFQD1 q_reg_13__14_ ( .D(wr_data[14]), .E(n28), .CP(clk_tx), .Q(q[62]) );
  EDFQD1 q_reg_13__13_ ( .D(wr_data[13]), .E(n28), .CP(clk_tx), .Q(q[61]) );
  EDFQD1 q_reg_13__12_ ( .D(wr_data[12]), .E(n28), .CP(clk_tx), .Q(q[60]) );
  EDFQD1 q_reg_13__11_ ( .D(wr_data[11]), .E(n28), .CP(clk_tx), .Q(q[59]) );
  EDFQD1 q_reg_13__10_ ( .D(wr_data[10]), .E(n28), .CP(clk_tx), .Q(q[58]) );
  EDFQD1 q_reg_13__9_ ( .D(wr_data[9]), .E(n28), .CP(clk_tx), .Q(q[57]) );
  EDFQD1 q_reg_13__8_ ( .D(wr_data[8]), .E(n28), .CP(clk_tx), .Q(q[56]) );
  EDFQD1 q_reg_13__7_ ( .D(wr_data[7]), .E(n28), .CP(clk_tx), .Q(q[55]) );
  EDFQD1 q_reg_13__6_ ( .D(wr_data[6]), .E(n28), .CP(clk_tx), .Q(q[54]) );
  EDFQD1 q_reg_13__5_ ( .D(wr_data[5]), .E(n28), .CP(clk_tx), .Q(q[53]) );
  EDFQD1 q_reg_13__4_ ( .D(wr_data[4]), .E(n28), .CP(clk_tx), .Q(q[52]) );
  EDFQD1 q_reg_13__3_ ( .D(wr_data[3]), .E(n28), .CP(clk_tx), .Q(q[51]) );
  EDFQD1 q_reg_13__2_ ( .D(wr_data[2]), .E(n28), .CP(clk_tx), .Q(q[50]) );
  EDFQD1 q_reg_13__1_ ( .D(wr_data[1]), .E(n28), .CP(clk_tx), .Q(q[49]) );
  EDFQD1 q_reg_13__0_ ( .D(wr_data[0]), .E(n28), .CP(clk_tx), .Q(q[48]) );
  EDFQD1 q_reg_11__23_ ( .D(wr_data[23]), .E(n26), .CP(clk_tx), .Q(q[119]) );
  EDFQD1 q_reg_11__22_ ( .D(wr_data[22]), .E(n26), .CP(clk_tx), .Q(q[118]) );
  EDFQD1 q_reg_11__21_ ( .D(wr_data[21]), .E(n26), .CP(clk_tx), .Q(q[117]) );
  EDFQD1 q_reg_11__20_ ( .D(wr_data[20]), .E(n26), .CP(clk_tx), .Q(q[116]) );
  EDFQD1 q_reg_11__19_ ( .D(wr_data[19]), .E(n26), .CP(clk_tx), .Q(q[115]) );
  EDFQD1 q_reg_11__18_ ( .D(wr_data[18]), .E(n26), .CP(clk_tx), .Q(q[114]) );
  EDFQD1 q_reg_11__17_ ( .D(wr_data[17]), .E(n26), .CP(clk_tx), .Q(q[113]) );
  EDFQD1 q_reg_11__16_ ( .D(wr_data[16]), .E(n26), .CP(clk_tx), .Q(q[112]) );
  EDFQD1 q_reg_11__15_ ( .D(wr_data[15]), .E(n26), .CP(clk_tx), .Q(q[111]) );
  EDFQD1 q_reg_11__14_ ( .D(wr_data[14]), .E(n26), .CP(clk_tx), .Q(q[110]) );
  EDFQD1 q_reg_11__13_ ( .D(wr_data[13]), .E(n26), .CP(clk_tx), .Q(q[109]) );
  EDFQD1 q_reg_11__12_ ( .D(wr_data[12]), .E(n26), .CP(clk_tx), .Q(q[108]) );
  EDFQD1 q_reg_11__11_ ( .D(wr_data[11]), .E(n26), .CP(clk_tx), .Q(q[107]) );
  EDFQD1 q_reg_11__10_ ( .D(wr_data[10]), .E(n26), .CP(clk_tx), .Q(q[106]) );
  EDFQD1 q_reg_11__9_ ( .D(wr_data[9]), .E(n26), .CP(clk_tx), .Q(q[105]) );
  EDFQD1 q_reg_11__8_ ( .D(wr_data[8]), .E(n26), .CP(clk_tx), .Q(q[104]) );
  EDFQD1 q_reg_11__7_ ( .D(wr_data[7]), .E(n26), .CP(clk_tx), .Q(q[103]) );
  EDFQD1 q_reg_11__6_ ( .D(wr_data[6]), .E(n26), .CP(clk_tx), .Q(q[102]) );
  EDFQD1 q_reg_11__5_ ( .D(wr_data[5]), .E(n26), .CP(clk_tx), .Q(q[101]) );
  EDFQD1 q_reg_11__4_ ( .D(wr_data[4]), .E(n26), .CP(clk_tx), .Q(q[100]) );
  EDFQD1 q_reg_11__3_ ( .D(wr_data[3]), .E(n26), .CP(clk_tx), .Q(q[99]) );
  EDFQD1 q_reg_11__2_ ( .D(wr_data[2]), .E(n26), .CP(clk_tx), .Q(q[98]) );
  EDFQD1 q_reg_11__1_ ( .D(wr_data[1]), .E(n26), .CP(clk_tx), .Q(q[97]) );
  EDFQD1 q_reg_11__0_ ( .D(wr_data[0]), .E(n26), .CP(clk_tx), .Q(q[96]) );
  EDFQD1 q_reg_9__23_ ( .D(wr_data[23]), .E(n24), .CP(clk_tx), .Q(q[167]) );
  EDFQD1 q_reg_9__22_ ( .D(wr_data[22]), .E(n24), .CP(clk_tx), .Q(q[166]) );
  EDFQD1 q_reg_9__21_ ( .D(wr_data[21]), .E(n24), .CP(clk_tx), .Q(q[165]) );
  EDFQD1 q_reg_9__20_ ( .D(wr_data[20]), .E(n24), .CP(clk_tx), .Q(q[164]) );
  EDFQD1 q_reg_9__19_ ( .D(wr_data[19]), .E(n24), .CP(clk_tx), .Q(q[163]) );
  EDFQD1 q_reg_9__18_ ( .D(wr_data[18]), .E(n24), .CP(clk_tx), .Q(q[162]) );
  EDFQD1 q_reg_9__17_ ( .D(wr_data[17]), .E(n24), .CP(clk_tx), .Q(q[161]) );
  EDFQD1 q_reg_9__16_ ( .D(wr_data[16]), .E(n24), .CP(clk_tx), .Q(q[160]) );
  EDFQD1 q_reg_9__15_ ( .D(wr_data[15]), .E(n24), .CP(clk_tx), .Q(q[159]) );
  EDFQD1 q_reg_9__14_ ( .D(wr_data[14]), .E(n24), .CP(clk_tx), .Q(q[158]) );
  EDFQD1 q_reg_9__13_ ( .D(wr_data[13]), .E(n24), .CP(clk_tx), .Q(q[157]) );
  EDFQD1 q_reg_9__12_ ( .D(wr_data[12]), .E(n24), .CP(clk_tx), .Q(q[156]) );
  EDFQD1 q_reg_9__11_ ( .D(wr_data[11]), .E(n24), .CP(clk_tx), .Q(q[155]) );
  EDFQD1 q_reg_9__10_ ( .D(wr_data[10]), .E(n24), .CP(clk_tx), .Q(q[154]) );
  EDFQD1 q_reg_9__9_ ( .D(wr_data[9]), .E(n24), .CP(clk_tx), .Q(q[153]) );
  EDFQD1 q_reg_9__8_ ( .D(wr_data[8]), .E(n24), .CP(clk_tx), .Q(q[152]) );
  EDFQD1 q_reg_9__7_ ( .D(wr_data[7]), .E(n24), .CP(clk_tx), .Q(q[151]) );
  EDFQD1 q_reg_9__6_ ( .D(wr_data[6]), .E(n24), .CP(clk_tx), .Q(q[150]) );
  EDFQD1 q_reg_9__5_ ( .D(wr_data[5]), .E(n24), .CP(clk_tx), .Q(q[149]) );
  EDFQD1 q_reg_9__4_ ( .D(wr_data[4]), .E(n24), .CP(clk_tx), .Q(q[148]) );
  EDFQD1 q_reg_9__3_ ( .D(wr_data[3]), .E(n24), .CP(clk_tx), .Q(q[147]) );
  EDFQD1 q_reg_9__2_ ( .D(wr_data[2]), .E(n24), .CP(clk_tx), .Q(q[146]) );
  EDFQD1 q_reg_9__1_ ( .D(wr_data[1]), .E(n24), .CP(clk_tx), .Q(q[145]) );
  EDFQD1 q_reg_9__0_ ( .D(wr_data[0]), .E(n24), .CP(clk_tx), .Q(q[144]) );
  EDFQD1 q_reg_14__23_ ( .D(wr_data[23]), .E(n29), .CP(clk_tx), .Q(q[47]) );
  EDFQD1 q_reg_14__22_ ( .D(wr_data[22]), .E(n29), .CP(clk_tx), .Q(q[46]) );
  EDFQD1 q_reg_14__21_ ( .D(wr_data[21]), .E(n29), .CP(clk_tx), .Q(q[45]) );
  EDFQD1 q_reg_14__20_ ( .D(wr_data[20]), .E(n29), .CP(clk_tx), .Q(q[44]) );
  EDFQD1 q_reg_14__19_ ( .D(wr_data[19]), .E(n29), .CP(clk_tx), .Q(q[43]) );
  EDFQD1 q_reg_14__18_ ( .D(wr_data[18]), .E(n29), .CP(clk_tx), .Q(q[42]) );
  EDFQD1 q_reg_14__17_ ( .D(wr_data[17]), .E(n29), .CP(clk_tx), .Q(q[41]) );
  EDFQD1 q_reg_14__16_ ( .D(wr_data[16]), .E(n29), .CP(clk_tx), .Q(q[40]) );
  EDFQD1 q_reg_14__15_ ( .D(wr_data[15]), .E(n29), .CP(clk_tx), .Q(q[39]) );
  EDFQD1 q_reg_14__14_ ( .D(wr_data[14]), .E(n29), .CP(clk_tx), .Q(q[38]) );
  EDFQD1 q_reg_14__13_ ( .D(wr_data[13]), .E(n29), .CP(clk_tx), .Q(q[37]) );
  EDFQD1 q_reg_14__12_ ( .D(wr_data[12]), .E(n29), .CP(clk_tx), .Q(q[36]) );
  EDFQD1 q_reg_14__11_ ( .D(wr_data[11]), .E(n29), .CP(clk_tx), .Q(q[35]) );
  EDFQD1 q_reg_14__10_ ( .D(wr_data[10]), .E(n29), .CP(clk_tx), .Q(q[34]) );
  EDFQD1 q_reg_14__9_ ( .D(wr_data[9]), .E(n29), .CP(clk_tx), .Q(q[33]) );
  EDFQD1 q_reg_14__8_ ( .D(wr_data[8]), .E(n29), .CP(clk_tx), .Q(q[32]) );
  EDFQD1 q_reg_14__7_ ( .D(wr_data[7]), .E(n29), .CP(clk_tx), .Q(q[31]) );
  EDFQD1 q_reg_14__6_ ( .D(wr_data[6]), .E(n29), .CP(clk_tx), .Q(q[30]) );
  EDFQD1 q_reg_14__5_ ( .D(wr_data[5]), .E(n29), .CP(clk_tx), .Q(q[29]) );
  EDFQD1 q_reg_14__4_ ( .D(wr_data[4]), .E(n29), .CP(clk_tx), .Q(q[28]) );
  EDFQD1 q_reg_14__3_ ( .D(wr_data[3]), .E(n29), .CP(clk_tx), .Q(q[27]) );
  EDFQD1 q_reg_14__2_ ( .D(wr_data[2]), .E(n29), .CP(clk_tx), .Q(q[26]) );
  EDFQD1 q_reg_14__1_ ( .D(wr_data[1]), .E(n29), .CP(clk_tx), .Q(q[25]) );
  EDFQD1 q_reg_14__0_ ( .D(wr_data[0]), .E(n29), .CP(clk_tx), .Q(q[24]) );
  EDFQD1 q_reg_12__23_ ( .D(wr_data[23]), .E(n27), .CP(clk_tx), .Q(q[95]) );
  EDFQD1 q_reg_12__22_ ( .D(wr_data[22]), .E(n27), .CP(clk_tx), .Q(q[94]) );
  EDFQD1 q_reg_12__21_ ( .D(wr_data[21]), .E(n27), .CP(clk_tx), .Q(q[93]) );
  EDFQD1 q_reg_12__20_ ( .D(wr_data[20]), .E(n27), .CP(clk_tx), .Q(q[92]) );
  EDFQD1 q_reg_12__19_ ( .D(wr_data[19]), .E(n27), .CP(clk_tx), .Q(q[91]) );
  EDFQD1 q_reg_12__18_ ( .D(wr_data[18]), .E(n27), .CP(clk_tx), .Q(q[90]) );
  EDFQD1 q_reg_12__17_ ( .D(wr_data[17]), .E(n27), .CP(clk_tx), .Q(q[89]) );
  EDFQD1 q_reg_12__16_ ( .D(wr_data[16]), .E(n27), .CP(clk_tx), .Q(q[88]) );
  EDFQD1 q_reg_12__15_ ( .D(wr_data[15]), .E(n27), .CP(clk_tx), .Q(q[87]) );
  EDFQD1 q_reg_12__14_ ( .D(wr_data[14]), .E(n27), .CP(clk_tx), .Q(q[86]) );
  EDFQD1 q_reg_12__13_ ( .D(wr_data[13]), .E(n27), .CP(clk_tx), .Q(q[85]) );
  EDFQD1 q_reg_12__12_ ( .D(wr_data[12]), .E(n27), .CP(clk_tx), .Q(q[84]) );
  EDFQD1 q_reg_12__11_ ( .D(wr_data[11]), .E(n27), .CP(clk_tx), .Q(q[83]) );
  EDFQD1 q_reg_12__10_ ( .D(wr_data[10]), .E(n27), .CP(clk_tx), .Q(q[82]) );
  EDFQD1 q_reg_12__9_ ( .D(wr_data[9]), .E(n27), .CP(clk_tx), .Q(q[81]) );
  EDFQD1 q_reg_12__8_ ( .D(wr_data[8]), .E(n27), .CP(clk_tx), .Q(q[80]) );
  EDFQD1 q_reg_12__7_ ( .D(wr_data[7]), .E(n27), .CP(clk_tx), .Q(q[79]) );
  EDFQD1 q_reg_12__6_ ( .D(wr_data[6]), .E(n27), .CP(clk_tx), .Q(q[78]) );
  EDFQD1 q_reg_12__5_ ( .D(wr_data[5]), .E(n27), .CP(clk_tx), .Q(q[77]) );
  EDFQD1 q_reg_12__4_ ( .D(wr_data[4]), .E(n27), .CP(clk_tx), .Q(q[76]) );
  EDFQD1 q_reg_12__3_ ( .D(wr_data[3]), .E(n27), .CP(clk_tx), .Q(q[75]) );
  EDFQD1 q_reg_12__2_ ( .D(wr_data[2]), .E(n27), .CP(clk_tx), .Q(q[74]) );
  EDFQD1 q_reg_12__1_ ( .D(wr_data[1]), .E(n27), .CP(clk_tx), .Q(q[73]) );
  EDFQD1 q_reg_12__0_ ( .D(wr_data[0]), .E(n27), .CP(clk_tx), .Q(q[72]) );
  EDFQD1 q_reg_10__23_ ( .D(wr_data[23]), .E(n25), .CP(clk_tx), .Q(q[143]) );
  EDFQD1 q_reg_10__22_ ( .D(wr_data[22]), .E(n25), .CP(clk_tx), .Q(q[142]) );
  EDFQD1 q_reg_10__21_ ( .D(wr_data[21]), .E(n25), .CP(clk_tx), .Q(q[141]) );
  EDFQD1 q_reg_10__20_ ( .D(wr_data[20]), .E(n25), .CP(clk_tx), .Q(q[140]) );
  EDFQD1 q_reg_10__19_ ( .D(wr_data[19]), .E(n25), .CP(clk_tx), .Q(q[139]) );
  EDFQD1 q_reg_10__18_ ( .D(wr_data[18]), .E(n25), .CP(clk_tx), .Q(q[138]) );
  EDFQD1 q_reg_10__17_ ( .D(wr_data[17]), .E(n25), .CP(clk_tx), .Q(q[137]) );
  EDFQD1 q_reg_10__16_ ( .D(wr_data[16]), .E(n25), .CP(clk_tx), .Q(q[136]) );
  EDFQD1 q_reg_10__15_ ( .D(wr_data[15]), .E(n25), .CP(clk_tx), .Q(q[135]) );
  EDFQD1 q_reg_10__14_ ( .D(wr_data[14]), .E(n25), .CP(clk_tx), .Q(q[134]) );
  EDFQD1 q_reg_10__13_ ( .D(wr_data[13]), .E(n25), .CP(clk_tx), .Q(q[133]) );
  EDFQD1 q_reg_10__12_ ( .D(wr_data[12]), .E(n25), .CP(clk_tx), .Q(q[132]) );
  EDFQD1 q_reg_10__11_ ( .D(wr_data[11]), .E(n25), .CP(clk_tx), .Q(q[131]) );
  EDFQD1 q_reg_10__10_ ( .D(wr_data[10]), .E(n25), .CP(clk_tx), .Q(q[130]) );
  EDFQD1 q_reg_10__9_ ( .D(wr_data[9]), .E(n25), .CP(clk_tx), .Q(q[129]) );
  EDFQD1 q_reg_10__8_ ( .D(wr_data[8]), .E(n25), .CP(clk_tx), .Q(q[128]) );
  EDFQD1 q_reg_10__7_ ( .D(wr_data[7]), .E(n25), .CP(clk_tx), .Q(q[127]) );
  EDFQD1 q_reg_10__6_ ( .D(wr_data[6]), .E(n25), .CP(clk_tx), .Q(q[126]) );
  EDFQD1 q_reg_10__5_ ( .D(wr_data[5]), .E(n25), .CP(clk_tx), .Q(q[125]) );
  EDFQD1 q_reg_10__4_ ( .D(wr_data[4]), .E(n25), .CP(clk_tx), .Q(q[124]) );
  EDFQD1 q_reg_10__3_ ( .D(wr_data[3]), .E(n25), .CP(clk_tx), .Q(q[123]) );
  EDFQD1 q_reg_10__2_ ( .D(wr_data[2]), .E(n25), .CP(clk_tx), .Q(q[122]) );
  EDFQD1 q_reg_10__1_ ( .D(wr_data[1]), .E(n25), .CP(clk_tx), .Q(q[121]) );
  EDFQD1 q_reg_10__0_ ( .D(wr_data[0]), .E(n25), .CP(clk_tx), .Q(q[120]) );
  EDFQD1 q_reg_8__23_ ( .D(wr_data[23]), .E(n23), .CP(clk_tx), .Q(q[191]) );
  EDFQD1 q_reg_8__22_ ( .D(wr_data[22]), .E(n23), .CP(clk_tx), .Q(q[190]) );
  EDFQD1 q_reg_8__21_ ( .D(wr_data[21]), .E(n23), .CP(clk_tx), .Q(q[189]) );
  EDFQD1 q_reg_8__20_ ( .D(wr_data[20]), .E(n23), .CP(clk_tx), .Q(q[188]) );
  EDFQD1 q_reg_8__19_ ( .D(wr_data[19]), .E(n23), .CP(clk_tx), .Q(q[187]) );
  EDFQD1 q_reg_8__18_ ( .D(wr_data[18]), .E(n23), .CP(clk_tx), .Q(q[186]) );
  EDFQD1 q_reg_8__17_ ( .D(wr_data[17]), .E(n23), .CP(clk_tx), .Q(q[185]) );
  EDFQD1 q_reg_8__16_ ( .D(wr_data[16]), .E(n23), .CP(clk_tx), .Q(q[184]) );
  EDFQD1 q_reg_8__15_ ( .D(wr_data[15]), .E(n23), .CP(clk_tx), .Q(q[183]) );
  EDFQD1 q_reg_8__14_ ( .D(wr_data[14]), .E(n23), .CP(clk_tx), .Q(q[182]) );
  EDFQD1 q_reg_8__13_ ( .D(wr_data[13]), .E(n23), .CP(clk_tx), .Q(q[181]) );
  EDFQD1 q_reg_8__12_ ( .D(wr_data[12]), .E(n23), .CP(clk_tx), .Q(q[180]) );
  EDFQD1 q_reg_8__11_ ( .D(wr_data[11]), .E(n23), .CP(clk_tx), .Q(q[179]) );
  EDFQD1 q_reg_8__10_ ( .D(wr_data[10]), .E(n23), .CP(clk_tx), .Q(q[178]) );
  EDFQD1 q_reg_8__9_ ( .D(wr_data[9]), .E(n23), .CP(clk_tx), .Q(q[177]) );
  EDFQD1 q_reg_8__8_ ( .D(wr_data[8]), .E(n23), .CP(clk_tx), .Q(q[176]) );
  EDFQD1 q_reg_8__7_ ( .D(wr_data[7]), .E(n23), .CP(clk_tx), .Q(q[175]) );
  EDFQD1 q_reg_8__6_ ( .D(wr_data[6]), .E(n23), .CP(clk_tx), .Q(q[174]) );
  EDFQD1 q_reg_8__5_ ( .D(wr_data[5]), .E(n23), .CP(clk_tx), .Q(q[173]) );
  EDFQD1 q_reg_8__4_ ( .D(wr_data[4]), .E(n23), .CP(clk_tx), .Q(q[172]) );
  EDFQD1 q_reg_8__3_ ( .D(wr_data[3]), .E(n23), .CP(clk_tx), .Q(q[171]) );
  EDFQD1 q_reg_8__2_ ( .D(wr_data[2]), .E(n23), .CP(clk_tx), .Q(q[170]) );
  EDFQD1 q_reg_8__1_ ( .D(wr_data[1]), .E(n23), .CP(clk_tx), .Q(q[169]) );
  EDFQD1 q_reg_8__0_ ( .D(wr_data[0]), .E(n23), .CP(clk_tx), .Q(q[168]) );
  NR2XD1 U2 ( .A1(n7), .A2(n4), .ZN(n17) );
  NR2XD1 U3 ( .A1(n4), .A2(n10), .ZN(n21) );
  NR2XD1 U4 ( .A1(n7), .A2(n13), .ZN(n16) );
  NR2XD0 U5 ( .A1(n13), .A2(n12), .ZN(n14) );
  NR2XD1 U6 ( .A1(n13), .A2(n8), .ZN(n18) );
  NR2XD1 U7 ( .A1(n4), .A2(n12), .ZN(n22) );
  NR2XD1 U8 ( .A1(n4), .A2(n8), .ZN(n19) );
  NR2XD1 U9 ( .A1(n8), .A2(n5), .ZN(n26) );
  NR2XD1 U10 ( .A1(n10), .A2(n9), .ZN(n27) );
  NR2XD1 U11 ( .A1(n7), .A2(n9), .ZN(n23) );
  NR2XD1 U12 ( .A1(n8), .A2(n9), .ZN(n25) );
  NR2XD1 U13 ( .A1(n10), .A2(n5), .ZN(n28) );
  NR2XD1 U14 ( .A1(n12), .A2(n9), .ZN(n29) );
  NR2XD1 U15 ( .A1(n12), .A2(n5), .ZN(n30) );
  NR2XD1 U16 ( .A1(n7), .A2(n5), .ZN(n24) );
  INR2XD0 U17 ( .A1(sf_wr_en), .B1(wr_ptr[3]), .ZN(n2) );
  CKND2D0 U18 ( .A1(n3), .A2(n1), .ZN(n7) );
  INVD0 U19 ( .I(n14), .ZN(n15) );
  INVD0 U20 ( .I(n20), .ZN(n11) );
  CKND2D0 U21 ( .A1(n2), .A2(n6), .ZN(n13) );
  CKND2D0 U22 ( .A1(wr_ptr[0]), .A2(n2), .ZN(n4) );
  CKND2D0 U23 ( .A1(wr_ptr[1]), .A2(wr_ptr[2]), .ZN(n12) );
  INVD0 U24 ( .I(wr_ptr[2]), .ZN(n1) );
  CKND2D0 U25 ( .A1(wr_ptr[1]), .A2(n1), .ZN(n8) );
  INVD0 U26 ( .I(wr_ptr[1]), .ZN(n3) );
  INVD0 U27 ( .I(wr_ptr[0]), .ZN(n6) );
  CKND2D0 U28 ( .A1(wr_ptr[2]), .A2(n3), .ZN(n10) );
  NR2D1 U29 ( .A1(n13), .A2(n10), .ZN(n20) );
  ND3D0 U30 ( .A1(sf_wr_en), .A2(wr_ptr[3]), .A3(wr_ptr[0]), .ZN(n5) );
  ND3D0 U31 ( .A1(wr_ptr[3]), .A2(sf_wr_en), .A3(n6), .ZN(n9) );
  OA22D0 U32 ( .A1(n11), .A2(wr_data[23]), .B1(q[287]), .B2(n20), .Z(n332) );
  OA22D0 U33 ( .A1(n11), .A2(wr_data[22]), .B1(q[286]), .B2(n20), .Z(n331) );
  OA22D0 U34 ( .A1(n11), .A2(wr_data[21]), .B1(q[285]), .B2(n20), .Z(n330) );
  OA22D0 U35 ( .A1(n11), .A2(wr_data[20]), .B1(q[284]), .B2(n20), .Z(n329) );
  OA22D0 U36 ( .A1(n11), .A2(wr_data[19]), .B1(q[283]), .B2(n20), .Z(n328) );
  OA22D0 U37 ( .A1(n11), .A2(wr_data[18]), .B1(q[282]), .B2(n20), .Z(n327) );
  OA22D0 U38 ( .A1(n11), .A2(wr_data[17]), .B1(q[281]), .B2(n20), .Z(n326) );
  OA22D0 U39 ( .A1(n11), .A2(wr_data[16]), .B1(q[280]), .B2(n20), .Z(n325) );
  OA22D0 U40 ( .A1(n11), .A2(wr_data[15]), .B1(q[279]), .B2(n20), .Z(n324) );
  OA22D0 U41 ( .A1(n11), .A2(wr_data[14]), .B1(q[278]), .B2(n20), .Z(n323) );
  OA22D0 U42 ( .A1(n11), .A2(wr_data[13]), .B1(q[277]), .B2(n20), .Z(n322) );
  OA22D0 U43 ( .A1(n11), .A2(wr_data[12]), .B1(q[276]), .B2(n20), .Z(n321) );
  OA22D0 U44 ( .A1(n11), .A2(wr_data[11]), .B1(q[275]), .B2(n20), .Z(n320) );
  OA22D0 U45 ( .A1(n11), .A2(wr_data[10]), .B1(q[274]), .B2(n20), .Z(n319) );
  OA22D0 U46 ( .A1(n11), .A2(wr_data[9]), .B1(q[273]), .B2(n20), .Z(n318) );
  OA22D0 U47 ( .A1(n15), .A2(wr_data[23]), .B1(q[239]), .B2(n14), .Z(n284) );
  OA22D0 U48 ( .A1(n15), .A2(wr_data[22]), .B1(q[238]), .B2(n14), .Z(n283) );
  OA22D0 U49 ( .A1(n15), .A2(wr_data[21]), .B1(q[237]), .B2(n14), .Z(n282) );
  OA22D0 U50 ( .A1(n15), .A2(wr_data[20]), .B1(q[236]), .B2(n14), .Z(n281) );
  OA22D0 U51 ( .A1(n15), .A2(wr_data[19]), .B1(q[235]), .B2(n14), .Z(n280) );
  OA22D0 U52 ( .A1(n15), .A2(wr_data[18]), .B1(q[234]), .B2(n14), .Z(n279) );
  OA22D0 U53 ( .A1(n15), .A2(wr_data[17]), .B1(q[233]), .B2(n14), .Z(n278) );
  OA22D0 U54 ( .A1(n15), .A2(wr_data[16]), .B1(q[232]), .B2(n14), .Z(n277) );
  OA22D0 U55 ( .A1(n15), .A2(wr_data[15]), .B1(q[231]), .B2(n14), .Z(n276) );
  OA22D0 U56 ( .A1(n15), .A2(wr_data[14]), .B1(q[230]), .B2(n14), .Z(n275) );
  OA22D0 U57 ( .A1(n15), .A2(wr_data[13]), .B1(q[229]), .B2(n14), .Z(n274) );
  OA22D0 U58 ( .A1(n15), .A2(wr_data[12]), .B1(q[228]), .B2(n14), .Z(n273) );
  OA22D0 U59 ( .A1(n15), .A2(wr_data[11]), .B1(q[227]), .B2(n14), .Z(n272) );
  OA22D0 U60 ( .A1(n15), .A2(wr_data[10]), .B1(q[226]), .B2(n14), .Z(n271) );
  OA22D0 U61 ( .A1(n15), .A2(wr_data[9]), .B1(q[225]), .B2(n14), .Z(n270) );
  OA22D0 U62 ( .A1(n15), .A2(wr_data[8]), .B1(q[224]), .B2(n14), .Z(n269) );
  OA22D0 U63 ( .A1(n15), .A2(wr_data[7]), .B1(q[223]), .B2(n14), .Z(n268) );
  OA22D0 U64 ( .A1(n15), .A2(wr_data[6]), .B1(q[222]), .B2(n14), .Z(n267) );
  OA22D0 U65 ( .A1(n15), .A2(wr_data[5]), .B1(q[221]), .B2(n14), .Z(n266) );
  OA22D0 U66 ( .A1(n15), .A2(wr_data[4]), .B1(q[220]), .B2(n14), .Z(n265) );
  OA22D0 U67 ( .A1(n15), .A2(wr_data[3]), .B1(q[219]), .B2(n14), .Z(n264) );
  OA22D0 U68 ( .A1(n15), .A2(wr_data[2]), .B1(q[218]), .B2(n14), .Z(n263) );
  OA22D0 U69 ( .A1(n15), .A2(wr_data[1]), .B1(q[217]), .B2(n14), .Z(n262) );
  OA22D0 U70 ( .A1(n15), .A2(wr_data[0]), .B1(q[216]), .B2(n14), .Z(n261) );
endmodule


module fifo_mux_2_1_bw24_simd1_0 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
  MUX2D0 U2 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U3 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U4 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U5 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U6 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U7 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U8 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U9 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U10 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U11 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U12 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U13 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U14 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U15 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U16 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U17 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U18 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U19 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U20 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U21 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U22 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U23 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U24 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
endmodule


module fifo_mux_2_1_bw24_simd1_1 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_2 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_3 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_4 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_5 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_6 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_8_1_bw24_simd1_0 ( out, sel, in0, in1, in2, in3, in4, in5, in6, 
        in7 );
  output [23:0] out;
  input [2:0] sel;
  input [23:0] in0;
  input [23:0] in1;
  input [23:0] in2;
  input [23:0] in3;
  input [23:0] in4;
  input [23:0] in5;
  input [23:0] in6;
  input [23:0] in7;

  wire   [23:0] out_sub0_0;
  wire   [23:0] out_sub0_1;
  wire   [23:0] out_sub0_2;
  wire   [23:0] out_sub0_3;
  wire   [23:0] out_sub1_0;
  wire   [23:0] out_sub1_1;

  fifo_mux_2_1_bw24_simd1_6 fifo_mux_2_1a ( .in0(in0), .in1(in1), .sel(sel[0]), 
        .out(out_sub0_0) );
  fifo_mux_2_1_bw24_simd1_5 fifo_mux_2_1b ( .in0(in2), .in1(in3), .sel(sel[0]), 
        .out(out_sub0_1) );
  fifo_mux_2_1_bw24_simd1_4 fifo_mux_2_1c ( .in0(in4), .in1(in5), .sel(sel[0]), 
        .out(out_sub0_2) );
  fifo_mux_2_1_bw24_simd1_3 fifo_mux_2_1d ( .in0(in6), .in1(in7), .sel(sel[0]), 
        .out(out_sub0_3) );
  fifo_mux_2_1_bw24_simd1_2 fifo_mux_2_1e ( .in0(out_sub0_0), .in1(out_sub0_1), 
        .sel(sel[1]), .out(out_sub1_0) );
  fifo_mux_2_1_bw24_simd1_1 fifo_mux_2_1f ( .in0(out_sub0_2), .in1(out_sub0_3), 
        .sel(sel[1]), .out(out_sub1_1) );
  fifo_mux_2_1_bw24_simd1_0 fifo_mux_2_1g ( .in0(out_sub1_0), .in1(out_sub1_1), 
        .sel(sel[2]), .out(out) );
endmodule


module fifo_mux_2_1_bw24_simd1_7 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U2 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U3 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U4 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U5 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U6 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U7 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U8 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U9 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U10 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U11 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U12 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U13 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U14 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U15 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U16 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U17 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U18 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U19 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U20 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U21 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U22 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_8 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_9 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_10 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_11 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_12 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_2_1_bw24_simd1_13 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;


  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_8_1_bw24_simd1_1 ( out, sel, in0, in1, in2, in3, in4, in5, in6, 
        in7 );
  output [23:0] out;
  input [2:0] sel;
  input [23:0] in0;
  input [23:0] in1;
  input [23:0] in2;
  input [23:0] in3;
  input [23:0] in4;
  input [23:0] in5;
  input [23:0] in6;
  input [23:0] in7;

  wire   [23:0] out_sub0_0;
  wire   [23:0] out_sub0_1;
  wire   [23:0] out_sub0_2;
  wire   [23:0] out_sub0_3;
  wire   [23:0] out_sub1_0;
  wire   [23:0] out_sub1_1;

  fifo_mux_2_1_bw24_simd1_13 fifo_mux_2_1a ( .in0(in0), .in1(in1), .sel(sel[0]), .out(out_sub0_0) );
  fifo_mux_2_1_bw24_simd1_12 fifo_mux_2_1b ( .in0(in2), .in1(in3), .sel(sel[0]), .out(out_sub0_1) );
  fifo_mux_2_1_bw24_simd1_11 fifo_mux_2_1c ( .in0(in4), .in1(in5), .sel(sel[0]), .out(out_sub0_2) );
  fifo_mux_2_1_bw24_simd1_10 fifo_mux_2_1d ( .in0(in6), .in1(in7), .sel(sel[0]), .out(out_sub0_3) );
  fifo_mux_2_1_bw24_simd1_9 fifo_mux_2_1e ( .in0(out_sub0_0), .in1(out_sub0_1), 
        .sel(sel[1]), .out(out_sub1_0) );
  fifo_mux_2_1_bw24_simd1_8 fifo_mux_2_1f ( .in0(out_sub0_2), .in1(out_sub0_3), 
        .sel(sel[1]), .out(out_sub1_1) );
  fifo_mux_2_1_bw24_simd1_7 fifo_mux_2_1g ( .in0(out_sub1_0), .in1(out_sub1_1), 
        .sel(sel[2]), .out(out) );
endmodule


module fifo_mux_2_1_bw24_simd1_28 ( in0, in1, sel, out );
  input [23:0] in0;
  input [23:0] in1;
  output [23:0] out;
  input sel;

  tri   [23:0] out;

  MUX2D0 U1 ( .I0(in0[0]), .I1(in1[0]), .S(sel), .Z(out[0]) );
  MUX2D0 U2 ( .I0(in0[1]), .I1(in1[1]), .S(sel), .Z(out[1]) );
  MUX2D0 U3 ( .I0(in0[2]), .I1(in1[2]), .S(sel), .Z(out[2]) );
  MUX2D0 U4 ( .I0(in0[3]), .I1(in1[3]), .S(sel), .Z(out[3]) );
  MUX2D0 U5 ( .I0(in0[4]), .I1(in1[4]), .S(sel), .Z(out[4]) );
  MUX2D0 U6 ( .I0(in0[5]), .I1(in1[5]), .S(sel), .Z(out[5]) );
  MUX2D0 U7 ( .I0(in0[6]), .I1(in1[6]), .S(sel), .Z(out[6]) );
  MUX2D0 U8 ( .I0(in0[7]), .I1(in1[7]), .S(sel), .Z(out[7]) );
  MUX2D0 U9 ( .I0(in0[8]), .I1(in1[8]), .S(sel), .Z(out[8]) );
  MUX2D0 U10 ( .I0(in0[9]), .I1(in1[9]), .S(sel), .Z(out[9]) );
  MUX2D0 U11 ( .I0(in0[10]), .I1(in1[10]), .S(sel), .Z(out[10]) );
  MUX2D0 U12 ( .I0(in0[11]), .I1(in1[11]), .S(sel), .Z(out[11]) );
  MUX2D0 U13 ( .I0(in0[12]), .I1(in1[12]), .S(sel), .Z(out[12]) );
  MUX2D0 U14 ( .I0(in0[13]), .I1(in1[13]), .S(sel), .Z(out[13]) );
  MUX2D0 U15 ( .I0(in0[14]), .I1(in1[14]), .S(sel), .Z(out[14]) );
  MUX2D0 U16 ( .I0(in0[15]), .I1(in1[15]), .S(sel), .Z(out[15]) );
  MUX2D0 U17 ( .I0(in0[16]), .I1(in1[16]), .S(sel), .Z(out[16]) );
  MUX2D0 U18 ( .I0(in0[17]), .I1(in1[17]), .S(sel), .Z(out[17]) );
  MUX2D0 U19 ( .I0(in0[18]), .I1(in1[18]), .S(sel), .Z(out[18]) );
  MUX2D0 U20 ( .I0(in0[19]), .I1(in1[19]), .S(sel), .Z(out[19]) );
  MUX2D0 U21 ( .I0(in0[20]), .I1(in1[20]), .S(sel), .Z(out[20]) );
  MUX2D0 U22 ( .I0(in0[21]), .I1(in1[21]), .S(sel), .Z(out[21]) );
  MUX2D0 U23 ( .I0(in0[22]), .I1(in1[22]), .S(sel), .Z(out[22]) );
  MUX2D0 U24 ( .I0(in0[23]), .I1(in1[23]), .S(sel), .Z(out[23]) );
endmodule


module fifo_mux_16_1_bw24_simd1_0 ( out, sel, in0, in1, in2, in3, in4, in5, 
        in6, in7, in8, in9, in10, in11, in12, in13, in14, in15 );
  output [23:0] out;
  input [3:0] sel;
  input [23:0] in0;
  input [23:0] in1;
  input [23:0] in2;
  input [23:0] in3;
  input [23:0] in4;
  input [23:0] in5;
  input [23:0] in6;
  input [23:0] in7;
  input [23:0] in8;
  input [23:0] in9;
  input [23:0] in10;
  input [23:0] in11;
  input [23:0] in12;
  input [23:0] in13;
  input [23:0] in14;
  input [23:0] in15;

  wire   [23:0] out_sub0;
  wire   [23:0] out_sub1;
  tri   [23:0] out;

  fifo_mux_8_1_bw24_simd1_1 mux_8_1a ( .out(out_sub0), .sel(sel[2:0]), .in0(
        in0), .in1(in1), .in2(in2), .in3(in3), .in4(in4), .in5(in5), .in6(in6), 
        .in7(in7) );
  fifo_mux_8_1_bw24_simd1_0 mux_8_1b ( .out(out_sub1), .sel(sel[2:0]), .in0(
        in8), .in1(in9), .in2(in10), .in3(in11), .in4(in12), .in5(in13), .in6(
        in14), .in7(in15) );
  fifo_mux_2_1_bw24_simd1_28 mux_2_1a ( .in0(out_sub0), .in1(out_sub1), .sel(
        sel[3]), .out(out) );
endmodule


module ctrl_tx_0 ( clk_tx, rd_ptr_tx, wr_ptr_o, wr_ptr_gray_o, wr_en, sf_wr_en, 
        full_o, reset );
  input [4:0] rd_ptr_tx;
  output [4:0] wr_ptr_o;
  output [4:0] wr_ptr_gray_o;
  input clk_tx, wr_en, reset;
  output sf_wr_en, full_o;
  wire   n1, N8, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n46, n47, n48, n49, n50, n51, n52,
         n53, n54;
  tri   clk_tx;
  tri   wr_en;
  tri   full_o;
  tri   reset;

  DFQD1 wr_ptr_reg_4_ ( .D(n49), .CP(clk_tx), .Q(n1) );
  DFQD1 wr_ptr_reg_3_ ( .D(n48), .CP(clk_tx), .Q(wr_ptr_o[3]) );
  DFQD1 wr_ptr_reg_2_ ( .D(n47), .CP(clk_tx), .Q(wr_ptr_o[2]) );
  DFQD1 wr_ptr_reg_1_ ( .D(n46), .CP(clk_tx), .Q(wr_ptr_o[1]) );
  DFQD1 wr_ptr_reg_0_ ( .D(n36), .CP(clk_tx), .Q(wr_ptr_o[0]) );
  DFQD1 wr_ptr_gray_reg_4_ ( .D(n50), .CP(clk_tx), .Q(wr_ptr_gray_o[4]) );
  DFQD1 wr_ptr_gray_reg_3_ ( .D(n51), .CP(clk_tx), .Q(wr_ptr_gray_o[3]) );
  DFQD1 wr_ptr_gray_reg_2_ ( .D(n52), .CP(clk_tx), .Q(wr_ptr_gray_o[2]) );
  DFQD1 wr_ptr_gray_reg_1_ ( .D(n53), .CP(clk_tx), .Q(wr_ptr_gray_o[1]) );
  DFQD1 wr_ptr_gray_reg_0_ ( .D(n54), .CP(clk_tx), .Q(wr_ptr_gray_o[0]) );
  DFQD1 full_reg ( .D(N8), .CP(clk_tx), .Q(full_o) );
  NR2D0 U3 ( .A1(n29), .A2(n32), .ZN(n4) );
  INVD0 U4 ( .I(n27), .ZN(n33) );
  INVD0 U5 ( .I(n25), .ZN(n24) );
  CKND2D0 U6 ( .A1(n2), .A2(n28), .ZN(n27) );
  NR2D0 U7 ( .A1(n21), .A2(n20), .ZN(N8) );
  OAI21D0 U8 ( .A1(n16), .A2(rd_ptr_tx[3]), .B(n15), .ZN(n21) );
  AOI22D0 U9 ( .A1(n19), .A2(rd_ptr_tx[2]), .B1(n18), .B2(rd_ptr_tx[4]), .ZN(
        n17) );
  IOA21D0 U10 ( .A1(n33), .A2(wr_ptr_gray_o[4]), .B(n22), .ZN(n50) );
  OAI22D0 U11 ( .A1(n6), .A2(n5), .B1(n8), .B2(n27), .ZN(n48) );
  OAI21D0 U12 ( .A1(n10), .A2(n27), .B(n22), .ZN(n49) );
  CKND2D0 U13 ( .A1(n35), .A2(n32), .ZN(n26) );
  MOAI22D0 U14 ( .A1(n19), .A2(n31), .B1(wr_ptr_gray_o[2]), .B2(n33), .ZN(n52)
         );
  INR2D0 U15 ( .A1(wr_en), .B1(full_o), .ZN(sf_wr_en) );
  INVD0 U16 ( .I(sf_wr_en), .ZN(n2) );
  INVD0 U17 ( .I(reset), .ZN(n28) );
  NR2D0 U18 ( .A1(reset), .A2(n2), .ZN(n35) );
  INVD0 U19 ( .I(n1), .ZN(n10) );
  INVD0 U20 ( .I(wr_ptr_o[2]), .ZN(n29) );
  CKND2D0 U21 ( .A1(sf_wr_en), .A2(wr_ptr_o[0]), .ZN(n25) );
  CKND2D0 U22 ( .A1(wr_ptr_o[1]), .A2(n24), .ZN(n32) );
  NR2D0 U23 ( .A1(wr_ptr_o[3]), .A2(n4), .ZN(n6) );
  MUX2ND0 U24 ( .I0(n1), .I1(n10), .S(n6), .ZN(n16) );
  AO22D0 U25 ( .A1(wr_ptr_gray_o[3]), .A2(n33), .B1(n35), .B2(n16), .Z(n51) );
  NR2D0 U26 ( .A1(wr_ptr_o[1]), .A2(n24), .ZN(n3) );
  MUX2ND0 U27 ( .I0(n29), .I1(wr_ptr_o[2]), .S(n3), .ZN(n12) );
  INVD0 U28 ( .I(n35), .ZN(n31) );
  MOAI22D0 U29 ( .A1(n12), .A2(n31), .B1(wr_ptr_gray_o[1]), .B2(n33), .ZN(n53)
         );
  CKND2D0 U30 ( .A1(wr_ptr_o[3]), .A2(n4), .ZN(n9) );
  CKND2D0 U31 ( .A1(n35), .A2(n9), .ZN(n5) );
  INVD0 U32 ( .I(wr_ptr_o[3]), .ZN(n8) );
  CKAN2D0 U33 ( .A1(n32), .A2(n29), .Z(n7) );
  MUX2ND0 U34 ( .I0(n8), .I1(wr_ptr_o[3]), .S(n7), .ZN(n19) );
  MUX2ND0 U35 ( .I0(n1), .I1(n10), .S(n9), .ZN(n18) );
  CKND2D0 U36 ( .A1(n18), .A2(n35), .ZN(n22) );
  NR2D0 U37 ( .A1(sf_wr_en), .A2(wr_ptr_o[0]), .ZN(n23) );
  INVD0 U38 ( .I(wr_ptr_o[1]), .ZN(n34) );
  MUX2ND0 U39 ( .I0(n34), .I1(wr_ptr_o[1]), .S(rd_ptr_tx[0]), .ZN(n13) );
  AOI22D0 U40 ( .A1(n23), .A2(n13), .B1(n12), .B2(rd_ptr_tx[1]), .ZN(n11) );
  OAI221D0 U41 ( .A1(n23), .A2(n13), .B1(n12), .B2(rd_ptr_tx[1]), .C(n11), 
        .ZN(n14) );
  AOI211D0 U42 ( .A1(n16), .A2(rd_ptr_tx[3]), .B(reset), .C(n14), .ZN(n15) );
  OAI221D0 U43 ( .A1(n19), .A2(rd_ptr_tx[2]), .B1(n18), .B2(rd_ptr_tx[4]), .C(
        n17), .ZN(n20) );
  NR3D0 U44 ( .A1(n24), .A2(reset), .A3(n23), .ZN(n36) );
  OAI222D0 U45 ( .A1(n34), .A2(n27), .B1(n34), .B2(n26), .C1(n26), .C2(n25), 
        .ZN(n46) );
  CKND2D0 U46 ( .A1(n28), .A2(n32), .ZN(n30) );
  OAI32D0 U47 ( .A1(wr_ptr_o[2]), .A2(n32), .A3(n31), .B1(n30), .B2(n29), .ZN(
        n47) );
  AO22D0 U48 ( .A1(n35), .A2(n34), .B1(wr_ptr_gray_o[0]), .B2(n33), .Z(n54) );
endmodule


module ctrl_rx_0 ( clk_rx, wr_ptr_rx, rd_ptr_o, rd_ptr_gray_o, rd_en, sf_rd_en, 
        empty_o, reset );
  input [4:0] wr_ptr_rx;
  output [4:0] rd_ptr_o;
  output [4:0] rd_ptr_gray_o;
  input clk_rx, rd_en, reset;
  output sf_rd_en, empty_o;
  wire   n1, N5, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n45, n46, n47, n48, n49;
  tri   clk_rx;
  tri   rd_en;
  tri   empty_o;
  tri   reset;

  DFQD1 rd_ptr_reg_4_ ( .D(n39), .CP(clk_rx), .Q(n1) );
  DFQD1 rd_ptr_reg_3_ ( .D(n38), .CP(clk_rx), .Q(rd_ptr_o[3]) );
  DFQD1 rd_ptr_gray_reg_3_ ( .D(n46), .CP(clk_rx), .Q(rd_ptr_gray_o[3]) );
  DFQD1 rd_ptr_gray_reg_2_ ( .D(n47), .CP(clk_rx), .Q(rd_ptr_gray_o[2]) );
  DFQD1 rd_ptr_gray_reg_1_ ( .D(n48), .CP(clk_rx), .Q(rd_ptr_gray_o[1]) );
  DFQD1 rd_ptr_gray_reg_0_ ( .D(n49), .CP(clk_rx), .Q(rd_ptr_gray_o[0]) );
  DFQD1 rd_ptr_gray_reg_4_ ( .D(n45), .CP(clk_rx), .Q(rd_ptr_gray_o[4]) );
  DFQD1 empty_reg ( .D(N5), .CP(clk_rx), .Q(empty_o) );
  DFQD4 rd_ptr_reg_1_ ( .D(n36), .CP(clk_rx), .Q(rd_ptr_o[1]) );
  DFQD4 rd_ptr_reg_0_ ( .D(n35), .CP(clk_rx), .Q(rd_ptr_o[0]) );
  DFQD2 rd_ptr_reg_2_ ( .D(n37), .CP(clk_rx), .Q(rd_ptr_o[2]) );
  AN2D0 U3 ( .A1(n17), .A2(rd_ptr_o[0]), .Z(n29) );
  CKND2D0 U4 ( .A1(rd_ptr_o[1]), .A2(n29), .ZN(n32) );
  INVD0 U5 ( .I(n32), .ZN(n5) );
  AOI22D0 U6 ( .A1(n21), .A2(wr_ptr_rx[1]), .B1(n28), .B2(n20), .ZN(n19) );
  OAI31D0 U7 ( .A1(rd_ptr_o[3]), .A2(n1), .A3(n11), .B(n10), .ZN(n15) );
  NR2D0 U8 ( .A1(n30), .A2(n32), .ZN(n11) );
  NR2D0 U9 ( .A1(n33), .A2(n7), .ZN(n31) );
  NR2D0 U10 ( .A1(n11), .A2(n34), .ZN(n7) );
  CKND2D0 U11 ( .A1(rd_ptr_o[3]), .A2(n11), .ZN(n12) );
  MOAI22D0 U12 ( .A1(n25), .A2(n34), .B1(n33), .B2(rd_ptr_gray_o[4]), .ZN(n45)
         );
  MOAI22D0 U13 ( .A1(n21), .A2(n34), .B1(rd_ptr_gray_o[1]), .B2(n33), .ZN(n48)
         );
  MOAI22D0 U14 ( .A1(n16), .A2(n34), .B1(rd_ptr_gray_o[2]), .B2(n33), .ZN(n47)
         );
  MOAI22D0 U15 ( .A1(n15), .A2(n34), .B1(rd_ptr_gray_o[3]), .B2(n33), .ZN(n46)
         );
  OAI32D0 U16 ( .A1(rd_ptr_o[3]), .A2(n9), .A3(n34), .B1(n31), .B2(n8), .ZN(
        n38) );
  INVD0 U17 ( .I(n11), .ZN(n9) );
  MOAI22D0 U18 ( .A1(n25), .A2(n34), .B1(n1), .B2(n33), .ZN(n39) );
  OAI31D0 U19 ( .A1(n5), .A2(n4), .A3(n34), .B(n3), .ZN(n36) );
  OAI22D0 U20 ( .A1(n16), .A2(wr_ptr_rx[2]), .B1(n15), .B2(wr_ptr_rx[3]), .ZN(
        n14) );
  AOI21D0 U21 ( .A1(wr_ptr_rx[4]), .A2(n25), .B(n22), .ZN(n23) );
  OAI21D0 U22 ( .A1(rd_ptr_o[3]), .A2(n11), .B(n1), .ZN(n10) );
  OAI211D0 U23 ( .A1(wr_ptr_rx[4]), .A2(n25), .B(n24), .C(n23), .ZN(n26) );
  INVD0 U24 ( .I(rd_ptr_o[3]), .ZN(n8) );
  CKND2D0 U25 ( .A1(n27), .A2(n26), .ZN(N5) );
  INR2D0 U26 ( .A1(rd_en), .B1(empty_o), .ZN(n17) );
  NR2D0 U27 ( .A1(rd_ptr_o[1]), .A2(n29), .ZN(n4) );
  INVD0 U28 ( .I(reset), .ZN(n27) );
  CKND2D0 U29 ( .A1(n17), .A2(n27), .ZN(n34) );
  NR2D0 U30 ( .A1(reset), .A2(n17), .ZN(n33) );
  CKND2D0 U31 ( .A1(rd_ptr_o[1]), .A2(n33), .ZN(n3) );
  INVD0 U32 ( .I(rd_ptr_o[2]), .ZN(n30) );
  MUX2ND0 U33 ( .I0(n30), .I1(rd_ptr_o[2]), .S(n4), .ZN(n21) );
  NR2D0 U34 ( .A1(rd_ptr_o[2]), .A2(n5), .ZN(n6) );
  MUX2ND0 U35 ( .I0(n8), .I1(rd_ptr_o[3]), .S(n6), .ZN(n16) );
  INVD0 U36 ( .I(n1), .ZN(n13) );
  MUX2ND0 U37 ( .I0(n13), .I1(n1), .S(n12), .ZN(n25) );
  AOI221D0 U38 ( .A1(n16), .A2(wr_ptr_rx[2]), .B1(wr_ptr_rx[3]), .B2(n15), .C(
        n14), .ZN(n24) );
  NR2D0 U39 ( .A1(n17), .A2(rd_ptr_o[0]), .ZN(n28) );
  INVD0 U40 ( .I(rd_ptr_o[1]), .ZN(n18) );
  MUX2ND0 U41 ( .I0(n18), .I1(rd_ptr_o[1]), .S(wr_ptr_rx[0]), .ZN(n20) );
  OAI221D0 U42 ( .A1(n21), .A2(wr_ptr_rx[1]), .B1(n28), .B2(n20), .C(n19), 
        .ZN(n22) );
  NR3D0 U43 ( .A1(reset), .A2(n29), .A3(n28), .ZN(n35) );
  OAI32D0 U44 ( .A1(rd_ptr_o[2]), .A2(n32), .A3(n34), .B1(n31), .B2(n30), .ZN(
        n37) );
  MOAI22D0 U45 ( .A1(rd_ptr_o[1]), .A2(n34), .B1(rd_ptr_gray_o[0]), .B2(n33), 
        .ZN(n49) );
endmodule


module sync_bw5_0 ( clk, in, out, reset );
  input [4:0] in;
  output [4:0] out;
  input clk, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12;
  wire   [4:0] int1;
  tri   clk;
  tri   reset;

  DFQD1 int2_reg_4_ ( .D(N12), .CP(clk), .Q(out[4]) );
  DFQD1 int2_reg_3_ ( .D(N11), .CP(clk), .Q(out[3]) );
  DFQD1 int2_reg_2_ ( .D(N10), .CP(clk), .Q(out[2]) );
  DFQD1 int2_reg_1_ ( .D(N9), .CP(clk), .Q(out[1]) );
  DFQD1 int2_reg_0_ ( .D(N8), .CP(clk), .Q(out[0]) );
  DFQD1 int1_reg_4_ ( .D(N7), .CP(clk), .Q(int1[4]) );
  DFQD1 int1_reg_3_ ( .D(N6), .CP(clk), .Q(int1[3]) );
  DFQD1 int1_reg_2_ ( .D(N5), .CP(clk), .Q(int1[2]) );
  DFQD1 int1_reg_1_ ( .D(N4), .CP(clk), .Q(int1[1]) );
  DFQD1 int1_reg_0_ ( .D(N3), .CP(clk), .Q(int1[0]) );
  INR2D0 U3 ( .A1(int1[0]), .B1(reset), .ZN(N8) );
  INR2D0 U4 ( .A1(int1[1]), .B1(reset), .ZN(N9) );
  INR2D0 U5 ( .A1(int1[2]), .B1(reset), .ZN(N10) );
  INR2D0 U6 ( .A1(int1[3]), .B1(reset), .ZN(N11) );
  INR2D0 U7 ( .A1(int1[4]), .B1(reset), .ZN(N12) );
  INR2D0 U8 ( .A1(in[0]), .B1(reset), .ZN(N3) );
  INR2D0 U9 ( .A1(in[1]), .B1(reset), .ZN(N4) );
  INR2D0 U10 ( .A1(in[2]), .B1(reset), .ZN(N5) );
  INR2D0 U11 ( .A1(in[3]), .B1(reset), .ZN(N6) );
  INR2D0 U12 ( .A1(in[4]), .B1(reset), .ZN(N7) );
endmodule


module sync_bw5_1 ( clk, in, out, reset );
  input [4:0] in;
  output [4:0] out;
  input clk, reset;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12;
  wire   [4:0] int1;
  tri   clk;
  tri   reset;

  DFQD1 int1_reg_4_ ( .D(N7), .CP(clk), .Q(int1[4]) );
  DFQD1 int1_reg_3_ ( .D(N6), .CP(clk), .Q(int1[3]) );
  DFQD1 int1_reg_2_ ( .D(N5), .CP(clk), .Q(int1[2]) );
  DFQD1 int1_reg_1_ ( .D(N4), .CP(clk), .Q(int1[1]) );
  DFQD1 int1_reg_0_ ( .D(N3), .CP(clk), .Q(int1[0]) );
  DFQD1 int2_reg_4_ ( .D(N12), .CP(clk), .Q(out[4]) );
  DFQD1 int2_reg_3_ ( .D(N11), .CP(clk), .Q(out[3]) );
  DFQD1 int2_reg_2_ ( .D(N10), .CP(clk), .Q(out[2]) );
  DFQD1 int2_reg_1_ ( .D(N9), .CP(clk), .Q(out[1]) );
  DFQD1 int2_reg_0_ ( .D(N8), .CP(clk), .Q(out[0]) );
  INR2D0 U3 ( .A1(int1[0]), .B1(reset), .ZN(N8) );
  INR2D0 U4 ( .A1(int1[1]), .B1(reset), .ZN(N9) );
  INR2D0 U5 ( .A1(int1[2]), .B1(reset), .ZN(N10) );
  INR2D0 U6 ( .A1(int1[3]), .B1(reset), .ZN(N11) );
  INR2D0 U7 ( .A1(int1[4]), .B1(reset), .ZN(N12) );
  INR2D0 U8 ( .A1(in[0]), .B1(reset), .ZN(N3) );
  INR2D0 U9 ( .A1(in[1]), .B1(reset), .ZN(N4) );
  INR2D0 U10 ( .A1(in[2]), .B1(reset), .ZN(N5) );
  INR2D0 U11 ( .A1(in[3]), .B1(reset), .ZN(N6) );
  INR2D0 U12 ( .A1(in[4]), .B1(reset), .ZN(N7) );
endmodule


module async_fifo_depth16_bw24_0 ( clk_rx, clk_tx, wr_data, rd_data, wr_en, 
        rd_en, o_full, o_empty, reset );
  input [23:0] wr_data;
  output [23:0] rd_data;
  input clk_rx, clk_tx, wr_en, rd_en, reset;
  output o_full, o_empty;
  wire   sf_wr_en, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2;
  wire   [383:0] q;
  wire   [3:0] rd_ptr;
  wire   [4:0] rd_ptr_gray;
  wire   [4:0] rd_ptr_tx;
  wire   [4:0] wr_ptr_gray;
  wire   [4:0] wr_ptr_rx;
  wire   [3:0] wr_ptr;
  tri   clk_rx;
  tri   clk_tx;
  tri   [23:0] wr_data;
  tri   [23:0] rd_data;
  tri   wr_en;
  tri   rd_en;
  tri   o_full;
  tri   o_empty;
  tri   reset;

  fifo_mux_16_1_bw24_simd1_0 fifo_mux_16_1a ( .out(rd_data), .sel(rd_ptr), 
        .in0(q[383:360]), .in1(q[359:336]), .in2(q[335:312]), .in3(q[311:288]), 
        .in4(q[287:264]), .in5(q[263:240]), .in6(q[239:216]), .in7(q[215:192]), 
        .in8(q[191:168]), .in9(q[167:144]), .in10(q[143:120]), .in11(q[119:96]), .in12(q[95:72]), .in13(q[71:48]), .in14(q[47:24]), .in15(q[23:0]) );
  sync_bw5_1 r2w_sync ( .clk(clk_tx), .in(rd_ptr_gray), .out(rd_ptr_tx), 
        .reset(reset) );
  sync_bw5_0 w2r_sync ( .clk(clk_rx), .in(wr_ptr_gray), .out(wr_ptr_rx), 
        .reset(reset) );
  ctrl_tx_0 ctrl_tx_instance ( .clk_tx(clk_tx), .rd_ptr_tx(rd_ptr_tx), 
        .wr_ptr_o({SYNOPSYS_UNCONNECTED_1, wr_ptr}), .wr_ptr_gray_o(
        wr_ptr_gray), .wr_en(wr_en), .sf_wr_en(sf_wr_en), .full_o(o_full), 
        .reset(reset) );
  ctrl_rx_0 ctrl_rx_instance ( .clk_rx(clk_rx), .wr_ptr_rx(wr_ptr_rx), 
        .rd_ptr_o({SYNOPSYS_UNCONNECTED_2, rd_ptr}), .rd_ptr_gray_o(
        rd_ptr_gray), .rd_en(rd_en), .empty_o(o_empty), .reset(reset) );
  DFQD1 q_reg_4__23_ ( .D(n332), .CP(clk_tx), .Q(q[287]) );
  DFQD1 q_reg_4__22_ ( .D(n331), .CP(clk_tx), .Q(q[286]) );
  DFQD1 q_reg_4__21_ ( .D(n330), .CP(clk_tx), .Q(q[285]) );
  DFQD1 q_reg_4__20_ ( .D(n329), .CP(clk_tx), .Q(q[284]) );
  DFQD1 q_reg_4__19_ ( .D(n328), .CP(clk_tx), .Q(q[283]) );
  DFQD1 q_reg_4__18_ ( .D(n327), .CP(clk_tx), .Q(q[282]) );
  DFQD1 q_reg_4__17_ ( .D(n326), .CP(clk_tx), .Q(q[281]) );
  DFQD1 q_reg_4__16_ ( .D(n325), .CP(clk_tx), .Q(q[280]) );
  DFQD1 q_reg_4__15_ ( .D(n324), .CP(clk_tx), .Q(q[279]) );
  DFQD1 q_reg_4__14_ ( .D(n323), .CP(clk_tx), .Q(q[278]) );
  DFQD1 q_reg_4__13_ ( .D(n322), .CP(clk_tx), .Q(q[277]) );
  DFQD1 q_reg_4__12_ ( .D(n321), .CP(clk_tx), .Q(q[276]) );
  DFQD1 q_reg_4__11_ ( .D(n320), .CP(clk_tx), .Q(q[275]) );
  DFQD1 q_reg_4__10_ ( .D(n319), .CP(clk_tx), .Q(q[274]) );
  DFQD1 q_reg_4__9_ ( .D(n318), .CP(clk_tx), .Q(q[273]) );
  DFQD1 q_reg_6__23_ ( .D(n284), .CP(clk_tx), .Q(q[239]) );
  DFQD1 q_reg_6__22_ ( .D(n283), .CP(clk_tx), .Q(q[238]) );
  DFQD1 q_reg_6__21_ ( .D(n282), .CP(clk_tx), .Q(q[237]) );
  DFQD1 q_reg_6__20_ ( .D(n281), .CP(clk_tx), .Q(q[236]) );
  DFQD1 q_reg_6__19_ ( .D(n280), .CP(clk_tx), .Q(q[235]) );
  DFQD1 q_reg_6__18_ ( .D(n279), .CP(clk_tx), .Q(q[234]) );
  DFQD1 q_reg_6__17_ ( .D(n278), .CP(clk_tx), .Q(q[233]) );
  DFQD1 q_reg_6__16_ ( .D(n277), .CP(clk_tx), .Q(q[232]) );
  DFQD1 q_reg_6__15_ ( .D(n276), .CP(clk_tx), .Q(q[231]) );
  DFQD1 q_reg_6__14_ ( .D(n275), .CP(clk_tx), .Q(q[230]) );
  DFQD1 q_reg_6__13_ ( .D(n274), .CP(clk_tx), .Q(q[229]) );
  DFQD1 q_reg_6__12_ ( .D(n273), .CP(clk_tx), .Q(q[228]) );
  DFQD1 q_reg_6__11_ ( .D(n272), .CP(clk_tx), .Q(q[227]) );
  DFQD1 q_reg_6__10_ ( .D(n271), .CP(clk_tx), .Q(q[226]) );
  DFQD1 q_reg_6__9_ ( .D(n270), .CP(clk_tx), .Q(q[225]) );
  DFQD1 q_reg_6__8_ ( .D(n269), .CP(clk_tx), .Q(q[224]) );
  DFQD1 q_reg_6__7_ ( .D(n268), .CP(clk_tx), .Q(q[223]) );
  DFQD1 q_reg_6__6_ ( .D(n267), .CP(clk_tx), .Q(q[222]) );
  DFQD1 q_reg_6__5_ ( .D(n266), .CP(clk_tx), .Q(q[221]) );
  DFQD1 q_reg_6__4_ ( .D(n265), .CP(clk_tx), .Q(q[220]) );
  DFQD1 q_reg_6__3_ ( .D(n264), .CP(clk_tx), .Q(q[219]) );
  DFQD1 q_reg_6__2_ ( .D(n263), .CP(clk_tx), .Q(q[218]) );
  DFQD1 q_reg_6__1_ ( .D(n262), .CP(clk_tx), .Q(q[217]) );
  DFQD1 q_reg_6__0_ ( .D(n261), .CP(clk_tx), .Q(q[216]) );
  EDFQD1 q_reg_4__8_ ( .D(wr_data[8]), .E(n20), .CP(clk_tx), .Q(q[272]) );
  EDFQD1 q_reg_4__7_ ( .D(wr_data[7]), .E(n20), .CP(clk_tx), .Q(q[271]) );
  EDFQD1 q_reg_4__6_ ( .D(wr_data[6]), .E(n20), .CP(clk_tx), .Q(q[270]) );
  EDFQD1 q_reg_4__5_ ( .D(wr_data[5]), .E(n20), .CP(clk_tx), .Q(q[269]) );
  EDFQD1 q_reg_4__4_ ( .D(wr_data[4]), .E(n20), .CP(clk_tx), .Q(q[268]) );
  EDFQD1 q_reg_4__3_ ( .D(wr_data[3]), .E(n20), .CP(clk_tx), .Q(q[267]) );
  EDFQD1 q_reg_4__2_ ( .D(wr_data[2]), .E(n20), .CP(clk_tx), .Q(q[266]) );
  EDFQD1 q_reg_4__1_ ( .D(wr_data[1]), .E(n20), .CP(clk_tx), .Q(q[265]) );
  EDFQD1 q_reg_4__0_ ( .D(wr_data[0]), .E(n20), .CP(clk_tx), .Q(q[264]) );
  EDFQD1 q_reg_2__23_ ( .D(wr_data[23]), .E(n18), .CP(clk_tx), .Q(q[335]) );
  EDFQD1 q_reg_2__22_ ( .D(wr_data[22]), .E(n18), .CP(clk_tx), .Q(q[334]) );
  EDFQD1 q_reg_2__21_ ( .D(wr_data[21]), .E(n18), .CP(clk_tx), .Q(q[333]) );
  EDFQD1 q_reg_2__20_ ( .D(wr_data[20]), .E(n18), .CP(clk_tx), .Q(q[332]) );
  EDFQD1 q_reg_2__19_ ( .D(wr_data[19]), .E(n18), .CP(clk_tx), .Q(q[331]) );
  EDFQD1 q_reg_2__18_ ( .D(wr_data[18]), .E(n18), .CP(clk_tx), .Q(q[330]) );
  EDFQD1 q_reg_2__17_ ( .D(wr_data[17]), .E(n18), .CP(clk_tx), .Q(q[329]) );
  EDFQD1 q_reg_2__16_ ( .D(wr_data[16]), .E(n18), .CP(clk_tx), .Q(q[328]) );
  EDFQD1 q_reg_2__15_ ( .D(wr_data[15]), .E(n18), .CP(clk_tx), .Q(q[327]) );
  EDFQD1 q_reg_2__14_ ( .D(wr_data[14]), .E(n18), .CP(clk_tx), .Q(q[326]) );
  EDFQD1 q_reg_2__13_ ( .D(wr_data[13]), .E(n18), .CP(clk_tx), .Q(q[325]) );
  EDFQD1 q_reg_2__12_ ( .D(wr_data[12]), .E(n18), .CP(clk_tx), .Q(q[324]) );
  EDFQD1 q_reg_2__11_ ( .D(wr_data[11]), .E(n18), .CP(clk_tx), .Q(q[323]) );
  EDFQD1 q_reg_2__10_ ( .D(wr_data[10]), .E(n18), .CP(clk_tx), .Q(q[322]) );
  EDFQD1 q_reg_2__9_ ( .D(wr_data[9]), .E(n18), .CP(clk_tx), .Q(q[321]) );
  EDFQD1 q_reg_2__8_ ( .D(wr_data[8]), .E(n18), .CP(clk_tx), .Q(q[320]) );
  EDFQD1 q_reg_2__7_ ( .D(wr_data[7]), .E(n18), .CP(clk_tx), .Q(q[319]) );
  EDFQD1 q_reg_2__6_ ( .D(wr_data[6]), .E(n18), .CP(clk_tx), .Q(q[318]) );
  EDFQD1 q_reg_2__5_ ( .D(wr_data[5]), .E(n18), .CP(clk_tx), .Q(q[317]) );
  EDFQD1 q_reg_2__4_ ( .D(wr_data[4]), .E(n18), .CP(clk_tx), .Q(q[316]) );
  EDFQD1 q_reg_2__3_ ( .D(wr_data[3]), .E(n18), .CP(clk_tx), .Q(q[315]) );
  EDFQD1 q_reg_2__2_ ( .D(wr_data[2]), .E(n18), .CP(clk_tx), .Q(q[314]) );
  EDFQD1 q_reg_2__1_ ( .D(wr_data[1]), .E(n18), .CP(clk_tx), .Q(q[313]) );
  EDFQD1 q_reg_2__0_ ( .D(wr_data[0]), .E(n18), .CP(clk_tx), .Q(q[312]) );
  EDFQD1 q_reg_7__23_ ( .D(wr_data[23]), .E(n22), .CP(clk_tx), .Q(q[215]) );
  EDFQD1 q_reg_7__22_ ( .D(wr_data[22]), .E(n22), .CP(clk_tx), .Q(q[214]) );
  EDFQD1 q_reg_7__21_ ( .D(wr_data[21]), .E(n22), .CP(clk_tx), .Q(q[213]) );
  EDFQD1 q_reg_7__20_ ( .D(wr_data[20]), .E(n22), .CP(clk_tx), .Q(q[212]) );
  EDFQD1 q_reg_7__19_ ( .D(wr_data[19]), .E(n22), .CP(clk_tx), .Q(q[211]) );
  EDFQD1 q_reg_7__18_ ( .D(wr_data[18]), .E(n22), .CP(clk_tx), .Q(q[210]) );
  EDFQD1 q_reg_7__17_ ( .D(wr_data[17]), .E(n22), .CP(clk_tx), .Q(q[209]) );
  EDFQD1 q_reg_7__16_ ( .D(wr_data[16]), .E(n22), .CP(clk_tx), .Q(q[208]) );
  EDFQD1 q_reg_7__15_ ( .D(wr_data[15]), .E(n22), .CP(clk_tx), .Q(q[207]) );
  EDFQD1 q_reg_7__14_ ( .D(wr_data[14]), .E(n22), .CP(clk_tx), .Q(q[206]) );
  EDFQD1 q_reg_7__13_ ( .D(wr_data[13]), .E(n22), .CP(clk_tx), .Q(q[205]) );
  EDFQD1 q_reg_7__12_ ( .D(wr_data[12]), .E(n22), .CP(clk_tx), .Q(q[204]) );
  EDFQD1 q_reg_7__11_ ( .D(wr_data[11]), .E(n22), .CP(clk_tx), .Q(q[203]) );
  EDFQD1 q_reg_7__10_ ( .D(wr_data[10]), .E(n22), .CP(clk_tx), .Q(q[202]) );
  EDFQD1 q_reg_7__9_ ( .D(wr_data[9]), .E(n22), .CP(clk_tx), .Q(q[201]) );
  EDFQD1 q_reg_7__8_ ( .D(wr_data[8]), .E(n22), .CP(clk_tx), .Q(q[200]) );
  EDFQD1 q_reg_7__7_ ( .D(wr_data[7]), .E(n22), .CP(clk_tx), .Q(q[199]) );
  EDFQD1 q_reg_7__6_ ( .D(wr_data[6]), .E(n22), .CP(clk_tx), .Q(q[198]) );
  EDFQD1 q_reg_7__5_ ( .D(wr_data[5]), .E(n22), .CP(clk_tx), .Q(q[197]) );
  EDFQD1 q_reg_7__4_ ( .D(wr_data[4]), .E(n22), .CP(clk_tx), .Q(q[196]) );
  EDFQD1 q_reg_7__3_ ( .D(wr_data[3]), .E(n22), .CP(clk_tx), .Q(q[195]) );
  EDFQD1 q_reg_7__2_ ( .D(wr_data[2]), .E(n22), .CP(clk_tx), .Q(q[194]) );
  EDFQD1 q_reg_7__1_ ( .D(wr_data[1]), .E(n22), .CP(clk_tx), .Q(q[193]) );
  EDFQD1 q_reg_7__0_ ( .D(wr_data[0]), .E(n22), .CP(clk_tx), .Q(q[192]) );
  EDFQD1 q_reg_5__23_ ( .D(wr_data[23]), .E(n21), .CP(clk_tx), .Q(q[263]) );
  EDFQD1 q_reg_5__22_ ( .D(wr_data[22]), .E(n21), .CP(clk_tx), .Q(q[262]) );
  EDFQD1 q_reg_5__21_ ( .D(wr_data[21]), .E(n21), .CP(clk_tx), .Q(q[261]) );
  EDFQD1 q_reg_5__20_ ( .D(wr_data[20]), .E(n21), .CP(clk_tx), .Q(q[260]) );
  EDFQD1 q_reg_5__19_ ( .D(wr_data[19]), .E(n21), .CP(clk_tx), .Q(q[259]) );
  EDFQD1 q_reg_5__18_ ( .D(wr_data[18]), .E(n21), .CP(clk_tx), .Q(q[258]) );
  EDFQD1 q_reg_5__17_ ( .D(wr_data[17]), .E(n21), .CP(clk_tx), .Q(q[257]) );
  EDFQD1 q_reg_5__16_ ( .D(wr_data[16]), .E(n21), .CP(clk_tx), .Q(q[256]) );
  EDFQD1 q_reg_5__15_ ( .D(wr_data[15]), .E(n21), .CP(clk_tx), .Q(q[255]) );
  EDFQD1 q_reg_5__14_ ( .D(wr_data[14]), .E(n21), .CP(clk_tx), .Q(q[254]) );
  EDFQD1 q_reg_5__13_ ( .D(wr_data[13]), .E(n21), .CP(clk_tx), .Q(q[253]) );
  EDFQD1 q_reg_5__12_ ( .D(wr_data[12]), .E(n21), .CP(clk_tx), .Q(q[252]) );
  EDFQD1 q_reg_5__11_ ( .D(wr_data[11]), .E(n21), .CP(clk_tx), .Q(q[251]) );
  EDFQD1 q_reg_5__10_ ( .D(wr_data[10]), .E(n21), .CP(clk_tx), .Q(q[250]) );
  EDFQD1 q_reg_5__9_ ( .D(wr_data[9]), .E(n21), .CP(clk_tx), .Q(q[249]) );
  EDFQD1 q_reg_5__8_ ( .D(wr_data[8]), .E(n21), .CP(clk_tx), .Q(q[248]) );
  EDFQD1 q_reg_5__7_ ( .D(wr_data[7]), .E(n21), .CP(clk_tx), .Q(q[247]) );
  EDFQD1 q_reg_5__6_ ( .D(wr_data[6]), .E(n21), .CP(clk_tx), .Q(q[246]) );
  EDFQD1 q_reg_5__5_ ( .D(wr_data[5]), .E(n21), .CP(clk_tx), .Q(q[245]) );
  EDFQD1 q_reg_5__4_ ( .D(wr_data[4]), .E(n21), .CP(clk_tx), .Q(q[244]) );
  EDFQD1 q_reg_5__3_ ( .D(wr_data[3]), .E(n21), .CP(clk_tx), .Q(q[243]) );
  EDFQD1 q_reg_5__2_ ( .D(wr_data[2]), .E(n21), .CP(clk_tx), .Q(q[242]) );
  EDFQD1 q_reg_5__1_ ( .D(wr_data[1]), .E(n21), .CP(clk_tx), .Q(q[241]) );
  EDFQD1 q_reg_5__0_ ( .D(wr_data[0]), .E(n21), .CP(clk_tx), .Q(q[240]) );
  EDFQD1 q_reg_3__23_ ( .D(wr_data[23]), .E(n19), .CP(clk_tx), .Q(q[311]) );
  EDFQD1 q_reg_3__22_ ( .D(wr_data[22]), .E(n19), .CP(clk_tx), .Q(q[310]) );
  EDFQD1 q_reg_3__21_ ( .D(wr_data[21]), .E(n19), .CP(clk_tx), .Q(q[309]) );
  EDFQD1 q_reg_3__20_ ( .D(wr_data[20]), .E(n19), .CP(clk_tx), .Q(q[308]) );
  EDFQD1 q_reg_3__19_ ( .D(wr_data[19]), .E(n19), .CP(clk_tx), .Q(q[307]) );
  EDFQD1 q_reg_3__18_ ( .D(wr_data[18]), .E(n19), .CP(clk_tx), .Q(q[306]) );
  EDFQD1 q_reg_3__17_ ( .D(wr_data[17]), .E(n19), .CP(clk_tx), .Q(q[305]) );
  EDFQD1 q_reg_3__16_ ( .D(wr_data[16]), .E(n19), .CP(clk_tx), .Q(q[304]) );
  EDFQD1 q_reg_3__15_ ( .D(wr_data[15]), .E(n19), .CP(clk_tx), .Q(q[303]) );
  EDFQD1 q_reg_3__14_ ( .D(wr_data[14]), .E(n19), .CP(clk_tx), .Q(q[302]) );
  EDFQD1 q_reg_3__13_ ( .D(wr_data[13]), .E(n19), .CP(clk_tx), .Q(q[301]) );
  EDFQD1 q_reg_3__12_ ( .D(wr_data[12]), .E(n19), .CP(clk_tx), .Q(q[300]) );
  EDFQD1 q_reg_3__11_ ( .D(wr_data[11]), .E(n19), .CP(clk_tx), .Q(q[299]) );
  EDFQD1 q_reg_3__10_ ( .D(wr_data[10]), .E(n19), .CP(clk_tx), .Q(q[298]) );
  EDFQD1 q_reg_3__9_ ( .D(wr_data[9]), .E(n19), .CP(clk_tx), .Q(q[297]) );
  EDFQD1 q_reg_3__8_ ( .D(wr_data[8]), .E(n19), .CP(clk_tx), .Q(q[296]) );
  EDFQD1 q_reg_3__7_ ( .D(wr_data[7]), .E(n19), .CP(clk_tx), .Q(q[295]) );
  EDFQD1 q_reg_3__6_ ( .D(wr_data[6]), .E(n19), .CP(clk_tx), .Q(q[294]) );
  EDFQD1 q_reg_3__5_ ( .D(wr_data[5]), .E(n19), .CP(clk_tx), .Q(q[293]) );
  EDFQD1 q_reg_3__4_ ( .D(wr_data[4]), .E(n19), .CP(clk_tx), .Q(q[292]) );
  EDFQD1 q_reg_3__3_ ( .D(wr_data[3]), .E(n19), .CP(clk_tx), .Q(q[291]) );
  EDFQD1 q_reg_3__2_ ( .D(wr_data[2]), .E(n19), .CP(clk_tx), .Q(q[290]) );
  EDFQD1 q_reg_3__1_ ( .D(wr_data[1]), .E(n19), .CP(clk_tx), .Q(q[289]) );
  EDFQD1 q_reg_3__0_ ( .D(wr_data[0]), .E(n19), .CP(clk_tx), .Q(q[288]) );
  EDFQD1 q_reg_0__23_ ( .D(wr_data[23]), .E(n16), .CP(clk_tx), .Q(q[383]) );
  EDFQD1 q_reg_0__22_ ( .D(wr_data[22]), .E(n16), .CP(clk_tx), .Q(q[382]) );
  EDFQD1 q_reg_0__21_ ( .D(wr_data[21]), .E(n16), .CP(clk_tx), .Q(q[381]) );
  EDFQD1 q_reg_0__20_ ( .D(wr_data[20]), .E(n16), .CP(clk_tx), .Q(q[380]) );
  EDFQD1 q_reg_0__19_ ( .D(wr_data[19]), .E(n16), .CP(clk_tx), .Q(q[379]) );
  EDFQD1 q_reg_0__18_ ( .D(wr_data[18]), .E(n16), .CP(clk_tx), .Q(q[378]) );
  EDFQD1 q_reg_0__17_ ( .D(wr_data[17]), .E(n16), .CP(clk_tx), .Q(q[377]) );
  EDFQD1 q_reg_0__16_ ( .D(wr_data[16]), .E(n16), .CP(clk_tx), .Q(q[376]) );
  EDFQD1 q_reg_0__15_ ( .D(wr_data[15]), .E(n16), .CP(clk_tx), .Q(q[375]) );
  EDFQD1 q_reg_0__14_ ( .D(wr_data[14]), .E(n16), .CP(clk_tx), .Q(q[374]) );
  EDFQD1 q_reg_0__13_ ( .D(wr_data[13]), .E(n16), .CP(clk_tx), .Q(q[373]) );
  EDFQD1 q_reg_0__12_ ( .D(wr_data[12]), .E(n16), .CP(clk_tx), .Q(q[372]) );
  EDFQD1 q_reg_0__11_ ( .D(wr_data[11]), .E(n16), .CP(clk_tx), .Q(q[371]) );
  EDFQD1 q_reg_0__10_ ( .D(wr_data[10]), .E(n16), .CP(clk_tx), .Q(q[370]) );
  EDFQD1 q_reg_0__9_ ( .D(wr_data[9]), .E(n16), .CP(clk_tx), .Q(q[369]) );
  EDFQD1 q_reg_0__8_ ( .D(wr_data[8]), .E(n16), .CP(clk_tx), .Q(q[368]) );
  EDFQD1 q_reg_0__7_ ( .D(wr_data[7]), .E(n16), .CP(clk_tx), .Q(q[367]) );
  EDFQD1 q_reg_0__6_ ( .D(wr_data[6]), .E(n16), .CP(clk_tx), .Q(q[366]) );
  EDFQD1 q_reg_0__5_ ( .D(wr_data[5]), .E(n16), .CP(clk_tx), .Q(q[365]) );
  EDFQD1 q_reg_0__4_ ( .D(wr_data[4]), .E(n16), .CP(clk_tx), .Q(q[364]) );
  EDFQD1 q_reg_0__3_ ( .D(wr_data[3]), .E(n16), .CP(clk_tx), .Q(q[363]) );
  EDFQD1 q_reg_0__2_ ( .D(wr_data[2]), .E(n16), .CP(clk_tx), .Q(q[362]) );
  EDFQD1 q_reg_0__1_ ( .D(wr_data[1]), .E(n16), .CP(clk_tx), .Q(q[361]) );
  EDFQD1 q_reg_0__0_ ( .D(wr_data[0]), .E(n16), .CP(clk_tx), .Q(q[360]) );
  EDFQD1 q_reg_1__23_ ( .D(wr_data[23]), .E(n17), .CP(clk_tx), .Q(q[359]) );
  EDFQD1 q_reg_1__22_ ( .D(wr_data[22]), .E(n17), .CP(clk_tx), .Q(q[358]) );
  EDFQD1 q_reg_1__21_ ( .D(wr_data[21]), .E(n17), .CP(clk_tx), .Q(q[357]) );
  EDFQD1 q_reg_1__20_ ( .D(wr_data[20]), .E(n17), .CP(clk_tx), .Q(q[356]) );
  EDFQD1 q_reg_1__19_ ( .D(wr_data[19]), .E(n17), .CP(clk_tx), .Q(q[355]) );
  EDFQD1 q_reg_1__18_ ( .D(wr_data[18]), .E(n17), .CP(clk_tx), .Q(q[354]) );
  EDFQD1 q_reg_1__17_ ( .D(wr_data[17]), .E(n17), .CP(clk_tx), .Q(q[353]) );
  EDFQD1 q_reg_1__16_ ( .D(wr_data[16]), .E(n17), .CP(clk_tx), .Q(q[352]) );
  EDFQD1 q_reg_1__15_ ( .D(wr_data[15]), .E(n17), .CP(clk_tx), .Q(q[351]) );
  EDFQD1 q_reg_1__14_ ( .D(wr_data[14]), .E(n17), .CP(clk_tx), .Q(q[350]) );
  EDFQD1 q_reg_1__13_ ( .D(wr_data[13]), .E(n17), .CP(clk_tx), .Q(q[349]) );
  EDFQD1 q_reg_1__12_ ( .D(wr_data[12]), .E(n17), .CP(clk_tx), .Q(q[348]) );
  EDFQD1 q_reg_1__11_ ( .D(wr_data[11]), .E(n17), .CP(clk_tx), .Q(q[347]) );
  EDFQD1 q_reg_1__10_ ( .D(wr_data[10]), .E(n17), .CP(clk_tx), .Q(q[346]) );
  EDFQD1 q_reg_1__9_ ( .D(wr_data[9]), .E(n17), .CP(clk_tx), .Q(q[345]) );
  EDFQD1 q_reg_1__8_ ( .D(wr_data[8]), .E(n17), .CP(clk_tx), .Q(q[344]) );
  EDFQD1 q_reg_1__7_ ( .D(wr_data[7]), .E(n17), .CP(clk_tx), .Q(q[343]) );
  EDFQD1 q_reg_1__6_ ( .D(wr_data[6]), .E(n17), .CP(clk_tx), .Q(q[342]) );
  EDFQD1 q_reg_1__5_ ( .D(wr_data[5]), .E(n17), .CP(clk_tx), .Q(q[341]) );
  EDFQD1 q_reg_1__4_ ( .D(wr_data[4]), .E(n17), .CP(clk_tx), .Q(q[340]) );
  EDFQD1 q_reg_1__3_ ( .D(wr_data[3]), .E(n17), .CP(clk_tx), .Q(q[339]) );
  EDFQD1 q_reg_1__2_ ( .D(wr_data[2]), .E(n17), .CP(clk_tx), .Q(q[338]) );
  EDFQD1 q_reg_1__1_ ( .D(wr_data[1]), .E(n17), .CP(clk_tx), .Q(q[337]) );
  EDFQD1 q_reg_1__0_ ( .D(wr_data[0]), .E(n17), .CP(clk_tx), .Q(q[336]) );
  EDFQD1 q_reg_15__23_ ( .D(wr_data[23]), .E(n30), .CP(clk_tx), .Q(q[23]) );
  EDFQD1 q_reg_15__22_ ( .D(wr_data[22]), .E(n30), .CP(clk_tx), .Q(q[22]) );
  EDFQD1 q_reg_15__21_ ( .D(wr_data[21]), .E(n30), .CP(clk_tx), .Q(q[21]) );
  EDFQD1 q_reg_15__20_ ( .D(wr_data[20]), .E(n30), .CP(clk_tx), .Q(q[20]) );
  EDFQD1 q_reg_15__19_ ( .D(wr_data[19]), .E(n30), .CP(clk_tx), .Q(q[19]) );
  EDFQD1 q_reg_15__18_ ( .D(wr_data[18]), .E(n30), .CP(clk_tx), .Q(q[18]) );
  EDFQD1 q_reg_15__17_ ( .D(wr_data[17]), .E(n30), .CP(clk_tx), .Q(q[17]) );
  EDFQD1 q_reg_15__16_ ( .D(wr_data[16]), .E(n30), .CP(clk_tx), .Q(q[16]) );
  EDFQD1 q_reg_15__15_ ( .D(wr_data[15]), .E(n30), .CP(clk_tx), .Q(q[15]) );
  EDFQD1 q_reg_15__14_ ( .D(wr_data[14]), .E(n30), .CP(clk_tx), .Q(q[14]) );
  EDFQD1 q_reg_15__13_ ( .D(wr_data[13]), .E(n30), .CP(clk_tx), .Q(q[13]) );
  EDFQD1 q_reg_15__12_ ( .D(wr_data[12]), .E(n30), .CP(clk_tx), .Q(q[12]) );
  EDFQD1 q_reg_15__11_ ( .D(wr_data[11]), .E(n30), .CP(clk_tx), .Q(q[11]) );
  EDFQD1 q_reg_15__10_ ( .D(wr_data[10]), .E(n30), .CP(clk_tx), .Q(q[10]) );
  EDFQD1 q_reg_15__9_ ( .D(wr_data[9]), .E(n30), .CP(clk_tx), .Q(q[9]) );
  EDFQD1 q_reg_15__8_ ( .D(wr_data[8]), .E(n30), .CP(clk_tx), .Q(q[8]) );
  EDFQD1 q_reg_15__7_ ( .D(wr_data[7]), .E(n30), .CP(clk_tx), .Q(q[7]) );
  EDFQD1 q_reg_15__6_ ( .D(wr_data[6]), .E(n30), .CP(clk_tx), .Q(q[6]) );
  EDFQD1 q_reg_15__5_ ( .D(wr_data[5]), .E(n30), .CP(clk_tx), .Q(q[5]) );
  EDFQD1 q_reg_15__4_ ( .D(wr_data[4]), .E(n30), .CP(clk_tx), .Q(q[4]) );
  EDFQD1 q_reg_15__3_ ( .D(wr_data[3]), .E(n30), .CP(clk_tx), .Q(q[3]) );
  EDFQD1 q_reg_15__2_ ( .D(wr_data[2]), .E(n30), .CP(clk_tx), .Q(q[2]) );
  EDFQD1 q_reg_15__1_ ( .D(wr_data[1]), .E(n30), .CP(clk_tx), .Q(q[1]) );
  EDFQD1 q_reg_15__0_ ( .D(wr_data[0]), .E(n30), .CP(clk_tx), .Q(q[0]) );
  EDFQD1 q_reg_13__23_ ( .D(wr_data[23]), .E(n28), .CP(clk_tx), .Q(q[71]) );
  EDFQD1 q_reg_13__22_ ( .D(wr_data[22]), .E(n28), .CP(clk_tx), .Q(q[70]) );
  EDFQD1 q_reg_13__21_ ( .D(wr_data[21]), .E(n28), .CP(clk_tx), .Q(q[69]) );
  EDFQD1 q_reg_13__20_ ( .D(wr_data[20]), .E(n28), .CP(clk_tx), .Q(q[68]) );
  EDFQD1 q_reg_13__19_ ( .D(wr_data[19]), .E(n28), .CP(clk_tx), .Q(q[67]) );
  EDFQD1 q_reg_13__18_ ( .D(wr_data[18]), .E(n28), .CP(clk_tx), .Q(q[66]) );
  EDFQD1 q_reg_13__17_ ( .D(wr_data[17]), .E(n28), .CP(clk_tx), .Q(q[65]) );
  EDFQD1 q_reg_13__16_ ( .D(wr_data[16]), .E(n28), .CP(clk_tx), .Q(q[64]) );
  EDFQD1 q_reg_13__15_ ( .D(wr_data[15]), .E(n28), .CP(clk_tx), .Q(q[63]) );
  EDFQD1 q_reg_13__14_ ( .D(wr_data[14]), .E(n28), .CP(clk_tx), .Q(q[62]) );
  EDFQD1 q_reg_13__13_ ( .D(wr_data[13]), .E(n28), .CP(clk_tx), .Q(q[61]) );
  EDFQD1 q_reg_13__12_ ( .D(wr_data[12]), .E(n28), .CP(clk_tx), .Q(q[60]) );
  EDFQD1 q_reg_13__11_ ( .D(wr_data[11]), .E(n28), .CP(clk_tx), .Q(q[59]) );
  EDFQD1 q_reg_13__10_ ( .D(wr_data[10]), .E(n28), .CP(clk_tx), .Q(q[58]) );
  EDFQD1 q_reg_13__9_ ( .D(wr_data[9]), .E(n28), .CP(clk_tx), .Q(q[57]) );
  EDFQD1 q_reg_13__8_ ( .D(wr_data[8]), .E(n28), .CP(clk_tx), .Q(q[56]) );
  EDFQD1 q_reg_13__7_ ( .D(wr_data[7]), .E(n28), .CP(clk_tx), .Q(q[55]) );
  EDFQD1 q_reg_13__6_ ( .D(wr_data[6]), .E(n28), .CP(clk_tx), .Q(q[54]) );
  EDFQD1 q_reg_13__5_ ( .D(wr_data[5]), .E(n28), .CP(clk_tx), .Q(q[53]) );
  EDFQD1 q_reg_13__4_ ( .D(wr_data[4]), .E(n28), .CP(clk_tx), .Q(q[52]) );
  EDFQD1 q_reg_13__3_ ( .D(wr_data[3]), .E(n28), .CP(clk_tx), .Q(q[51]) );
  EDFQD1 q_reg_13__2_ ( .D(wr_data[2]), .E(n28), .CP(clk_tx), .Q(q[50]) );
  EDFQD1 q_reg_13__1_ ( .D(wr_data[1]), .E(n28), .CP(clk_tx), .Q(q[49]) );
  EDFQD1 q_reg_13__0_ ( .D(wr_data[0]), .E(n28), .CP(clk_tx), .Q(q[48]) );
  EDFQD1 q_reg_11__23_ ( .D(wr_data[23]), .E(n26), .CP(clk_tx), .Q(q[119]) );
  EDFQD1 q_reg_11__22_ ( .D(wr_data[22]), .E(n26), .CP(clk_tx), .Q(q[118]) );
  EDFQD1 q_reg_11__21_ ( .D(wr_data[21]), .E(n26), .CP(clk_tx), .Q(q[117]) );
  EDFQD1 q_reg_11__20_ ( .D(wr_data[20]), .E(n26), .CP(clk_tx), .Q(q[116]) );
  EDFQD1 q_reg_11__19_ ( .D(wr_data[19]), .E(n26), .CP(clk_tx), .Q(q[115]) );
  EDFQD1 q_reg_11__18_ ( .D(wr_data[18]), .E(n26), .CP(clk_tx), .Q(q[114]) );
  EDFQD1 q_reg_11__17_ ( .D(wr_data[17]), .E(n26), .CP(clk_tx), .Q(q[113]) );
  EDFQD1 q_reg_11__16_ ( .D(wr_data[16]), .E(n26), .CP(clk_tx), .Q(q[112]) );
  EDFQD1 q_reg_11__15_ ( .D(wr_data[15]), .E(n26), .CP(clk_tx), .Q(q[111]) );
  EDFQD1 q_reg_11__14_ ( .D(wr_data[14]), .E(n26), .CP(clk_tx), .Q(q[110]) );
  EDFQD1 q_reg_11__13_ ( .D(wr_data[13]), .E(n26), .CP(clk_tx), .Q(q[109]) );
  EDFQD1 q_reg_11__12_ ( .D(wr_data[12]), .E(n26), .CP(clk_tx), .Q(q[108]) );
  EDFQD1 q_reg_11__11_ ( .D(wr_data[11]), .E(n26), .CP(clk_tx), .Q(q[107]) );
  EDFQD1 q_reg_11__10_ ( .D(wr_data[10]), .E(n26), .CP(clk_tx), .Q(q[106]) );
  EDFQD1 q_reg_11__9_ ( .D(wr_data[9]), .E(n26), .CP(clk_tx), .Q(q[105]) );
  EDFQD1 q_reg_11__8_ ( .D(wr_data[8]), .E(n26), .CP(clk_tx), .Q(q[104]) );
  EDFQD1 q_reg_11__7_ ( .D(wr_data[7]), .E(n26), .CP(clk_tx), .Q(q[103]) );
  EDFQD1 q_reg_11__6_ ( .D(wr_data[6]), .E(n26), .CP(clk_tx), .Q(q[102]) );
  EDFQD1 q_reg_11__5_ ( .D(wr_data[5]), .E(n26), .CP(clk_tx), .Q(q[101]) );
  EDFQD1 q_reg_11__4_ ( .D(wr_data[4]), .E(n26), .CP(clk_tx), .Q(q[100]) );
  EDFQD1 q_reg_11__3_ ( .D(wr_data[3]), .E(n26), .CP(clk_tx), .Q(q[99]) );
  EDFQD1 q_reg_11__2_ ( .D(wr_data[2]), .E(n26), .CP(clk_tx), .Q(q[98]) );
  EDFQD1 q_reg_11__1_ ( .D(wr_data[1]), .E(n26), .CP(clk_tx), .Q(q[97]) );
  EDFQD1 q_reg_11__0_ ( .D(wr_data[0]), .E(n26), .CP(clk_tx), .Q(q[96]) );
  EDFQD1 q_reg_9__23_ ( .D(wr_data[23]), .E(n24), .CP(clk_tx), .Q(q[167]) );
  EDFQD1 q_reg_9__22_ ( .D(wr_data[22]), .E(n24), .CP(clk_tx), .Q(q[166]) );
  EDFQD1 q_reg_9__21_ ( .D(wr_data[21]), .E(n24), .CP(clk_tx), .Q(q[165]) );
  EDFQD1 q_reg_9__20_ ( .D(wr_data[20]), .E(n24), .CP(clk_tx), .Q(q[164]) );
  EDFQD1 q_reg_9__19_ ( .D(wr_data[19]), .E(n24), .CP(clk_tx), .Q(q[163]) );
  EDFQD1 q_reg_9__18_ ( .D(wr_data[18]), .E(n24), .CP(clk_tx), .Q(q[162]) );
  EDFQD1 q_reg_9__17_ ( .D(wr_data[17]), .E(n24), .CP(clk_tx), .Q(q[161]) );
  EDFQD1 q_reg_9__16_ ( .D(wr_data[16]), .E(n24), .CP(clk_tx), .Q(q[160]) );
  EDFQD1 q_reg_9__15_ ( .D(wr_data[15]), .E(n24), .CP(clk_tx), .Q(q[159]) );
  EDFQD1 q_reg_9__14_ ( .D(wr_data[14]), .E(n24), .CP(clk_tx), .Q(q[158]) );
  EDFQD1 q_reg_9__13_ ( .D(wr_data[13]), .E(n24), .CP(clk_tx), .Q(q[157]) );
  EDFQD1 q_reg_9__12_ ( .D(wr_data[12]), .E(n24), .CP(clk_tx), .Q(q[156]) );
  EDFQD1 q_reg_9__11_ ( .D(wr_data[11]), .E(n24), .CP(clk_tx), .Q(q[155]) );
  EDFQD1 q_reg_9__10_ ( .D(wr_data[10]), .E(n24), .CP(clk_tx), .Q(q[154]) );
  EDFQD1 q_reg_9__9_ ( .D(wr_data[9]), .E(n24), .CP(clk_tx), .Q(q[153]) );
  EDFQD1 q_reg_9__8_ ( .D(wr_data[8]), .E(n24), .CP(clk_tx), .Q(q[152]) );
  EDFQD1 q_reg_9__7_ ( .D(wr_data[7]), .E(n24), .CP(clk_tx), .Q(q[151]) );
  EDFQD1 q_reg_9__6_ ( .D(wr_data[6]), .E(n24), .CP(clk_tx), .Q(q[150]) );
  EDFQD1 q_reg_9__5_ ( .D(wr_data[5]), .E(n24), .CP(clk_tx), .Q(q[149]) );
  EDFQD1 q_reg_9__4_ ( .D(wr_data[4]), .E(n24), .CP(clk_tx), .Q(q[148]) );
  EDFQD1 q_reg_9__3_ ( .D(wr_data[3]), .E(n24), .CP(clk_tx), .Q(q[147]) );
  EDFQD1 q_reg_9__2_ ( .D(wr_data[2]), .E(n24), .CP(clk_tx), .Q(q[146]) );
  EDFQD1 q_reg_9__1_ ( .D(wr_data[1]), .E(n24), .CP(clk_tx), .Q(q[145]) );
  EDFQD1 q_reg_9__0_ ( .D(wr_data[0]), .E(n24), .CP(clk_tx), .Q(q[144]) );
  EDFQD1 q_reg_14__23_ ( .D(wr_data[23]), .E(n29), .CP(clk_tx), .Q(q[47]) );
  EDFQD1 q_reg_14__22_ ( .D(wr_data[22]), .E(n29), .CP(clk_tx), .Q(q[46]) );
  EDFQD1 q_reg_14__21_ ( .D(wr_data[21]), .E(n29), .CP(clk_tx), .Q(q[45]) );
  EDFQD1 q_reg_14__20_ ( .D(wr_data[20]), .E(n29), .CP(clk_tx), .Q(q[44]) );
  EDFQD1 q_reg_14__19_ ( .D(wr_data[19]), .E(n29), .CP(clk_tx), .Q(q[43]) );
  EDFQD1 q_reg_14__18_ ( .D(wr_data[18]), .E(n29), .CP(clk_tx), .Q(q[42]) );
  EDFQD1 q_reg_14__17_ ( .D(wr_data[17]), .E(n29), .CP(clk_tx), .Q(q[41]) );
  EDFQD1 q_reg_14__16_ ( .D(wr_data[16]), .E(n29), .CP(clk_tx), .Q(q[40]) );
  EDFQD1 q_reg_14__15_ ( .D(wr_data[15]), .E(n29), .CP(clk_tx), .Q(q[39]) );
  EDFQD1 q_reg_14__14_ ( .D(wr_data[14]), .E(n29), .CP(clk_tx), .Q(q[38]) );
  EDFQD1 q_reg_14__13_ ( .D(wr_data[13]), .E(n29), .CP(clk_tx), .Q(q[37]) );
  EDFQD1 q_reg_14__12_ ( .D(wr_data[12]), .E(n29), .CP(clk_tx), .Q(q[36]) );
  EDFQD1 q_reg_14__11_ ( .D(wr_data[11]), .E(n29), .CP(clk_tx), .Q(q[35]) );
  EDFQD1 q_reg_14__10_ ( .D(wr_data[10]), .E(n29), .CP(clk_tx), .Q(q[34]) );
  EDFQD1 q_reg_14__9_ ( .D(wr_data[9]), .E(n29), .CP(clk_tx), .Q(q[33]) );
  EDFQD1 q_reg_14__8_ ( .D(wr_data[8]), .E(n29), .CP(clk_tx), .Q(q[32]) );
  EDFQD1 q_reg_14__7_ ( .D(wr_data[7]), .E(n29), .CP(clk_tx), .Q(q[31]) );
  EDFQD1 q_reg_14__6_ ( .D(wr_data[6]), .E(n29), .CP(clk_tx), .Q(q[30]) );
  EDFQD1 q_reg_14__5_ ( .D(wr_data[5]), .E(n29), .CP(clk_tx), .Q(q[29]) );
  EDFQD1 q_reg_14__4_ ( .D(wr_data[4]), .E(n29), .CP(clk_tx), .Q(q[28]) );
  EDFQD1 q_reg_14__3_ ( .D(wr_data[3]), .E(n29), .CP(clk_tx), .Q(q[27]) );
  EDFQD1 q_reg_14__2_ ( .D(wr_data[2]), .E(n29), .CP(clk_tx), .Q(q[26]) );
  EDFQD1 q_reg_14__1_ ( .D(wr_data[1]), .E(n29), .CP(clk_tx), .Q(q[25]) );
  EDFQD1 q_reg_14__0_ ( .D(wr_data[0]), .E(n29), .CP(clk_tx), .Q(q[24]) );
  EDFQD1 q_reg_12__23_ ( .D(wr_data[23]), .E(n27), .CP(clk_tx), .Q(q[95]) );
  EDFQD1 q_reg_12__22_ ( .D(wr_data[22]), .E(n27), .CP(clk_tx), .Q(q[94]) );
  EDFQD1 q_reg_12__21_ ( .D(wr_data[21]), .E(n27), .CP(clk_tx), .Q(q[93]) );
  EDFQD1 q_reg_12__20_ ( .D(wr_data[20]), .E(n27), .CP(clk_tx), .Q(q[92]) );
  EDFQD1 q_reg_12__19_ ( .D(wr_data[19]), .E(n27), .CP(clk_tx), .Q(q[91]) );
  EDFQD1 q_reg_12__18_ ( .D(wr_data[18]), .E(n27), .CP(clk_tx), .Q(q[90]) );
  EDFQD1 q_reg_12__17_ ( .D(wr_data[17]), .E(n27), .CP(clk_tx), .Q(q[89]) );
  EDFQD1 q_reg_12__16_ ( .D(wr_data[16]), .E(n27), .CP(clk_tx), .Q(q[88]) );
  EDFQD1 q_reg_12__15_ ( .D(wr_data[15]), .E(n27), .CP(clk_tx), .Q(q[87]) );
  EDFQD1 q_reg_12__14_ ( .D(wr_data[14]), .E(n27), .CP(clk_tx), .Q(q[86]) );
  EDFQD1 q_reg_12__13_ ( .D(wr_data[13]), .E(n27), .CP(clk_tx), .Q(q[85]) );
  EDFQD1 q_reg_12__12_ ( .D(wr_data[12]), .E(n27), .CP(clk_tx), .Q(q[84]) );
  EDFQD1 q_reg_12__11_ ( .D(wr_data[11]), .E(n27), .CP(clk_tx), .Q(q[83]) );
  EDFQD1 q_reg_12__10_ ( .D(wr_data[10]), .E(n27), .CP(clk_tx), .Q(q[82]) );
  EDFQD1 q_reg_12__9_ ( .D(wr_data[9]), .E(n27), .CP(clk_tx), .Q(q[81]) );
  EDFQD1 q_reg_12__8_ ( .D(wr_data[8]), .E(n27), .CP(clk_tx), .Q(q[80]) );
  EDFQD1 q_reg_12__7_ ( .D(wr_data[7]), .E(n27), .CP(clk_tx), .Q(q[79]) );
  EDFQD1 q_reg_12__6_ ( .D(wr_data[6]), .E(n27), .CP(clk_tx), .Q(q[78]) );
  EDFQD1 q_reg_12__5_ ( .D(wr_data[5]), .E(n27), .CP(clk_tx), .Q(q[77]) );
  EDFQD1 q_reg_12__4_ ( .D(wr_data[4]), .E(n27), .CP(clk_tx), .Q(q[76]) );
  EDFQD1 q_reg_12__3_ ( .D(wr_data[3]), .E(n27), .CP(clk_tx), .Q(q[75]) );
  EDFQD1 q_reg_12__2_ ( .D(wr_data[2]), .E(n27), .CP(clk_tx), .Q(q[74]) );
  EDFQD1 q_reg_12__1_ ( .D(wr_data[1]), .E(n27), .CP(clk_tx), .Q(q[73]) );
  EDFQD1 q_reg_12__0_ ( .D(wr_data[0]), .E(n27), .CP(clk_tx), .Q(q[72]) );
  EDFQD1 q_reg_10__23_ ( .D(wr_data[23]), .E(n25), .CP(clk_tx), .Q(q[143]) );
  EDFQD1 q_reg_10__22_ ( .D(wr_data[22]), .E(n25), .CP(clk_tx), .Q(q[142]) );
  EDFQD1 q_reg_10__21_ ( .D(wr_data[21]), .E(n25), .CP(clk_tx), .Q(q[141]) );
  EDFQD1 q_reg_10__20_ ( .D(wr_data[20]), .E(n25), .CP(clk_tx), .Q(q[140]) );
  EDFQD1 q_reg_10__19_ ( .D(wr_data[19]), .E(n25), .CP(clk_tx), .Q(q[139]) );
  EDFQD1 q_reg_10__18_ ( .D(wr_data[18]), .E(n25), .CP(clk_tx), .Q(q[138]) );
  EDFQD1 q_reg_10__17_ ( .D(wr_data[17]), .E(n25), .CP(clk_tx), .Q(q[137]) );
  EDFQD1 q_reg_10__16_ ( .D(wr_data[16]), .E(n25), .CP(clk_tx), .Q(q[136]) );
  EDFQD1 q_reg_10__15_ ( .D(wr_data[15]), .E(n25), .CP(clk_tx), .Q(q[135]) );
  EDFQD1 q_reg_10__14_ ( .D(wr_data[14]), .E(n25), .CP(clk_tx), .Q(q[134]) );
  EDFQD1 q_reg_10__13_ ( .D(wr_data[13]), .E(n25), .CP(clk_tx), .Q(q[133]) );
  EDFQD1 q_reg_10__12_ ( .D(wr_data[12]), .E(n25), .CP(clk_tx), .Q(q[132]) );
  EDFQD1 q_reg_10__11_ ( .D(wr_data[11]), .E(n25), .CP(clk_tx), .Q(q[131]) );
  EDFQD1 q_reg_10__10_ ( .D(wr_data[10]), .E(n25), .CP(clk_tx), .Q(q[130]) );
  EDFQD1 q_reg_10__9_ ( .D(wr_data[9]), .E(n25), .CP(clk_tx), .Q(q[129]) );
  EDFQD1 q_reg_10__8_ ( .D(wr_data[8]), .E(n25), .CP(clk_tx), .Q(q[128]) );
  EDFQD1 q_reg_10__7_ ( .D(wr_data[7]), .E(n25), .CP(clk_tx), .Q(q[127]) );
  EDFQD1 q_reg_10__6_ ( .D(wr_data[6]), .E(n25), .CP(clk_tx), .Q(q[126]) );
  EDFQD1 q_reg_10__5_ ( .D(wr_data[5]), .E(n25), .CP(clk_tx), .Q(q[125]) );
  EDFQD1 q_reg_10__4_ ( .D(wr_data[4]), .E(n25), .CP(clk_tx), .Q(q[124]) );
  EDFQD1 q_reg_10__3_ ( .D(wr_data[3]), .E(n25), .CP(clk_tx), .Q(q[123]) );
  EDFQD1 q_reg_10__2_ ( .D(wr_data[2]), .E(n25), .CP(clk_tx), .Q(q[122]) );
  EDFQD1 q_reg_10__1_ ( .D(wr_data[1]), .E(n25), .CP(clk_tx), .Q(q[121]) );
  EDFQD1 q_reg_10__0_ ( .D(wr_data[0]), .E(n25), .CP(clk_tx), .Q(q[120]) );
  EDFQD1 q_reg_8__23_ ( .D(wr_data[23]), .E(n23), .CP(clk_tx), .Q(q[191]) );
  EDFQD1 q_reg_8__22_ ( .D(wr_data[22]), .E(n23), .CP(clk_tx), .Q(q[190]) );
  EDFQD1 q_reg_8__21_ ( .D(wr_data[21]), .E(n23), .CP(clk_tx), .Q(q[189]) );
  EDFQD1 q_reg_8__20_ ( .D(wr_data[20]), .E(n23), .CP(clk_tx), .Q(q[188]) );
  EDFQD1 q_reg_8__19_ ( .D(wr_data[19]), .E(n23), .CP(clk_tx), .Q(q[187]) );
  EDFQD1 q_reg_8__18_ ( .D(wr_data[18]), .E(n23), .CP(clk_tx), .Q(q[186]) );
  EDFQD1 q_reg_8__17_ ( .D(wr_data[17]), .E(n23), .CP(clk_tx), .Q(q[185]) );
  EDFQD1 q_reg_8__16_ ( .D(wr_data[16]), .E(n23), .CP(clk_tx), .Q(q[184]) );
  EDFQD1 q_reg_8__15_ ( .D(wr_data[15]), .E(n23), .CP(clk_tx), .Q(q[183]) );
  EDFQD1 q_reg_8__14_ ( .D(wr_data[14]), .E(n23), .CP(clk_tx), .Q(q[182]) );
  EDFQD1 q_reg_8__13_ ( .D(wr_data[13]), .E(n23), .CP(clk_tx), .Q(q[181]) );
  EDFQD1 q_reg_8__12_ ( .D(wr_data[12]), .E(n23), .CP(clk_tx), .Q(q[180]) );
  EDFQD1 q_reg_8__11_ ( .D(wr_data[11]), .E(n23), .CP(clk_tx), .Q(q[179]) );
  EDFQD1 q_reg_8__10_ ( .D(wr_data[10]), .E(n23), .CP(clk_tx), .Q(q[178]) );
  EDFQD1 q_reg_8__9_ ( .D(wr_data[9]), .E(n23), .CP(clk_tx), .Q(q[177]) );
  EDFQD1 q_reg_8__8_ ( .D(wr_data[8]), .E(n23), .CP(clk_tx), .Q(q[176]) );
  EDFQD1 q_reg_8__7_ ( .D(wr_data[7]), .E(n23), .CP(clk_tx), .Q(q[175]) );
  EDFQD1 q_reg_8__6_ ( .D(wr_data[6]), .E(n23), .CP(clk_tx), .Q(q[174]) );
  EDFQD1 q_reg_8__5_ ( .D(wr_data[5]), .E(n23), .CP(clk_tx), .Q(q[173]) );
  EDFQD1 q_reg_8__4_ ( .D(wr_data[4]), .E(n23), .CP(clk_tx), .Q(q[172]) );
  EDFQD1 q_reg_8__3_ ( .D(wr_data[3]), .E(n23), .CP(clk_tx), .Q(q[171]) );
  EDFQD1 q_reg_8__2_ ( .D(wr_data[2]), .E(n23), .CP(clk_tx), .Q(q[170]) );
  EDFQD1 q_reg_8__1_ ( .D(wr_data[1]), .E(n23), .CP(clk_tx), .Q(q[169]) );
  EDFQD1 q_reg_8__0_ ( .D(wr_data[0]), .E(n23), .CP(clk_tx), .Q(q[168]) );
  NR2XD1 U2 ( .A1(n4), .A2(n8), .ZN(n19) );
  NR2XD1 U3 ( .A1(n7), .A2(n4), .ZN(n17) );
  NR2XD1 U4 ( .A1(n13), .A2(n8), .ZN(n18) );
  NR2XD1 U5 ( .A1(n4), .A2(n12), .ZN(n22) );
  NR2XD1 U6 ( .A1(n4), .A2(n10), .ZN(n21) );
  NR2XD0 U7 ( .A1(n13), .A2(n12), .ZN(n14) );
  NR2XD1 U8 ( .A1(n7), .A2(n13), .ZN(n16) );
  NR2XD1 U9 ( .A1(n8), .A2(n9), .ZN(n25) );
  NR2XD1 U10 ( .A1(n7), .A2(n9), .ZN(n23) );
  NR2XD1 U11 ( .A1(n10), .A2(n5), .ZN(n28) );
  NR2XD1 U12 ( .A1(n12), .A2(n5), .ZN(n30) );
  NR2XD1 U13 ( .A1(n12), .A2(n9), .ZN(n29) );
  NR2XD1 U14 ( .A1(n10), .A2(n9), .ZN(n27) );
  NR2XD1 U15 ( .A1(n7), .A2(n5), .ZN(n24) );
  NR2XD1 U16 ( .A1(n8), .A2(n5), .ZN(n26) );
  INR2XD0 U17 ( .A1(sf_wr_en), .B1(wr_ptr[3]), .ZN(n2) );
  CKND2D0 U18 ( .A1(n3), .A2(n1), .ZN(n7) );
  INVD0 U19 ( .I(n14), .ZN(n15) );
  INVD0 U20 ( .I(n20), .ZN(n11) );
  CKND2D0 U21 ( .A1(n2), .A2(n6), .ZN(n13) );
  CKND2D0 U22 ( .A1(wr_ptr[0]), .A2(n2), .ZN(n4) );
  CKND2D0 U23 ( .A1(wr_ptr[1]), .A2(wr_ptr[2]), .ZN(n12) );
  INVD0 U24 ( .I(wr_ptr[2]), .ZN(n1) );
  CKND2D0 U25 ( .A1(wr_ptr[1]), .A2(n1), .ZN(n8) );
  INVD0 U26 ( .I(wr_ptr[1]), .ZN(n3) );
  INVD0 U27 ( .I(wr_ptr[0]), .ZN(n6) );
  CKND2D0 U28 ( .A1(wr_ptr[2]), .A2(n3), .ZN(n10) );
  NR2D1 U29 ( .A1(n13), .A2(n10), .ZN(n20) );
  ND3D0 U30 ( .A1(sf_wr_en), .A2(wr_ptr[3]), .A3(wr_ptr[0]), .ZN(n5) );
  ND3D0 U31 ( .A1(wr_ptr[3]), .A2(sf_wr_en), .A3(n6), .ZN(n9) );
  OA22D0 U32 ( .A1(n11), .A2(wr_data[23]), .B1(q[287]), .B2(n20), .Z(n332) );
  OA22D0 U33 ( .A1(n11), .A2(wr_data[22]), .B1(q[286]), .B2(n20), .Z(n331) );
  OA22D0 U34 ( .A1(n11), .A2(wr_data[21]), .B1(q[285]), .B2(n20), .Z(n330) );
  OA22D0 U35 ( .A1(n11), .A2(wr_data[20]), .B1(q[284]), .B2(n20), .Z(n329) );
  OA22D0 U36 ( .A1(n11), .A2(wr_data[19]), .B1(q[283]), .B2(n20), .Z(n328) );
  OA22D0 U37 ( .A1(n11), .A2(wr_data[18]), .B1(q[282]), .B2(n20), .Z(n327) );
  OA22D0 U38 ( .A1(n11), .A2(wr_data[17]), .B1(q[281]), .B2(n20), .Z(n326) );
  OA22D0 U39 ( .A1(n11), .A2(wr_data[16]), .B1(q[280]), .B2(n20), .Z(n325) );
  OA22D0 U40 ( .A1(n11), .A2(wr_data[15]), .B1(q[279]), .B2(n20), .Z(n324) );
  OA22D0 U41 ( .A1(n11), .A2(wr_data[14]), .B1(q[278]), .B2(n20), .Z(n323) );
  OA22D0 U42 ( .A1(n11), .A2(wr_data[13]), .B1(q[277]), .B2(n20), .Z(n322) );
  OA22D0 U43 ( .A1(n11), .A2(wr_data[12]), .B1(q[276]), .B2(n20), .Z(n321) );
  OA22D0 U44 ( .A1(n11), .A2(wr_data[11]), .B1(q[275]), .B2(n20), .Z(n320) );
  OA22D0 U45 ( .A1(n11), .A2(wr_data[10]), .B1(q[274]), .B2(n20), .Z(n319) );
  OA22D0 U46 ( .A1(n11), .A2(wr_data[9]), .B1(q[273]), .B2(n20), .Z(n318) );
  OA22D0 U47 ( .A1(n15), .A2(wr_data[23]), .B1(q[239]), .B2(n14), .Z(n284) );
  OA22D0 U48 ( .A1(n15), .A2(wr_data[22]), .B1(q[238]), .B2(n14), .Z(n283) );
  OA22D0 U49 ( .A1(n15), .A2(wr_data[21]), .B1(q[237]), .B2(n14), .Z(n282) );
  OA22D0 U50 ( .A1(n15), .A2(wr_data[20]), .B1(q[236]), .B2(n14), .Z(n281) );
  OA22D0 U51 ( .A1(n15), .A2(wr_data[19]), .B1(q[235]), .B2(n14), .Z(n280) );
  OA22D0 U52 ( .A1(n15), .A2(wr_data[18]), .B1(q[234]), .B2(n14), .Z(n279) );
  OA22D0 U53 ( .A1(n15), .A2(wr_data[17]), .B1(q[233]), .B2(n14), .Z(n278) );
  OA22D0 U54 ( .A1(n15), .A2(wr_data[16]), .B1(q[232]), .B2(n14), .Z(n277) );
  OA22D0 U55 ( .A1(n15), .A2(wr_data[15]), .B1(q[231]), .B2(n14), .Z(n276) );
  OA22D0 U56 ( .A1(n15), .A2(wr_data[14]), .B1(q[230]), .B2(n14), .Z(n275) );
  OA22D0 U57 ( .A1(n15), .A2(wr_data[13]), .B1(q[229]), .B2(n14), .Z(n274) );
  OA22D0 U58 ( .A1(n15), .A2(wr_data[12]), .B1(q[228]), .B2(n14), .Z(n273) );
  OA22D0 U59 ( .A1(n15), .A2(wr_data[11]), .B1(q[227]), .B2(n14), .Z(n272) );
  OA22D0 U60 ( .A1(n15), .A2(wr_data[10]), .B1(q[226]), .B2(n14), .Z(n271) );
  OA22D0 U61 ( .A1(n15), .A2(wr_data[9]), .B1(q[225]), .B2(n14), .Z(n270) );
  OA22D0 U62 ( .A1(n15), .A2(wr_data[8]), .B1(q[224]), .B2(n14), .Z(n269) );
  OA22D0 U63 ( .A1(n15), .A2(wr_data[7]), .B1(q[223]), .B2(n14), .Z(n268) );
  OA22D0 U64 ( .A1(n15), .A2(wr_data[6]), .B1(q[222]), .B2(n14), .Z(n267) );
  OA22D0 U65 ( .A1(n15), .A2(wr_data[5]), .B1(q[221]), .B2(n14), .Z(n266) );
  OA22D0 U66 ( .A1(n15), .A2(wr_data[4]), .B1(q[220]), .B2(n14), .Z(n265) );
  OA22D0 U67 ( .A1(n15), .A2(wr_data[3]), .B1(q[219]), .B2(n14), .Z(n264) );
  OA22D0 U68 ( .A1(n15), .A2(wr_data[2]), .B1(q[218]), .B2(n14), .Z(n263) );
  OA22D0 U69 ( .A1(n15), .A2(wr_data[1]), .B1(q[217]), .B2(n14), .Z(n262) );
  OA22D0 U70 ( .A1(n15), .A2(wr_data[0]), .B1(q[216]), .B2(n14), .Z(n261) );
endmodule


module transceiver ( clk_a, clk_b, wr_data_a, wr_data_b, rd_data_a, rd_data_b, 
        wr_en_a, wr_en_b, rd_en_a, rd_en_b, full_a, full_b, empty_a, empty_b, 
        reset_a, reset_b );
  input [23:0] wr_data_a;
  input [23:0] wr_data_b;
  output [23:0] rd_data_a;
  output [23:0] rd_data_b;
  input clk_a, clk_b, wr_en_a, wr_en_b, rd_en_a, rd_en_b, reset_a, reset_b;
  output full_a, full_b, empty_a, empty_b;

  tri   clk_a;
  tri   clk_b;
  tri   [23:0] wr_data_a;
  tri   [23:0] wr_data_b;
  tri   [23:0] rd_data_a;
  tri   [23:0] rd_data_b;
  tri   wr_en_a;
  tri   wr_en_b;
  tri   rd_en_a;
  tri   rd_en_b;
  tri   full_a;
  tri   full_b;
  tri   empty_a;
  tri   empty_b;
  tri   reset_a;
  tri   reset_b;

  async_fifo_depth16_bw24_1 a_b_fifo ( .clk_rx(clk_b), .clk_tx(clk_a), 
        .wr_data(wr_data_a), .rd_data(rd_data_b), .wr_en(wr_en_a), .rd_en(
        rd_en_b), .o_full(full_a), .o_empty(empty_b), .reset(reset_a) );
  async_fifo_depth16_bw24_0 b_a_fifo ( .clk_rx(clk_a), .clk_tx(clk_b), 
        .wr_data(wr_data_b), .rd_data(rd_data_a), .wr_en(wr_en_b), .rd_en(
        rd_en_a), .o_full(full_b), .o_empty(empty_a), .reset(reset_b) );
endmodule


module fullchip ( clk0, clk1, mem_in0, mem_in1, inst0, inst1, reset0, reset1, 
        out0, out1 );
  input [127:0] mem_in0;
  input [127:0] mem_in1;
  input [16:0] inst0;
  input [16:0] inst1;
  output [159:0] out0;
  output [159:0] out1;
  input clk0, clk1, reset0, reset1;

  tri   clk0;
  tri   clk1;
  tri   [127:0] mem_in0;
  tri   [127:0] mem_in1;
  tri   [16:0] inst0;
  tri   [16:0] inst1;
  tri   reset0;
  tri   reset1;
  tri   [159:0] out0;
  tri   [159:0] out1;
  tri   [23:0] rd_data0;
  tri   [23:0] wr_data0;
  tri   rd_en0;
  tri   wr_en0;
  tri   empty0;
  tri   full0;
  tri   [23:0] wr_data1;
  tri   [23:0] rd_data1;
  tri   wr_en1;
  tri   rd_en1;
  tri   full1;
  tri   empty1;

  core core_instance0 ( .reset(reset0), .clk(clk0), .mem_in(mem_in0), .inst(
        inst0), .sum_in(rd_data0), .sum_out(wr_data0), .rd_en(rd_en0), .wr_en(
        wr_en0), .empty(empty0), .full(full0), .out(out0) );
  transceiver transceiver_instance0 ( .clk_a(clk0), .clk_b(clk1), .wr_data_a(
        wr_data0), .wr_data_b(wr_data1), .rd_data_a(rd_data0), .rd_data_b(
        rd_data1), .wr_en_a(wr_en0), .wr_en_b(wr_en1), .rd_en_a(rd_en0), 
        .rd_en_b(rd_en1), .full_a(full0), .full_b(full1), .empty_a(empty0), 
        .empty_b(empty1), .reset_a(reset0), .reset_b(reset1) );
  core core_instance1 ( .reset(reset1), .clk(clk1), .mem_in(mem_in1), .inst(
        inst1), .sum_in(rd_data1), .sum_out(wr_data1), .rd_en(rd_en1), .wr_en(
        wr_en1), .empty(empty1), .full(full1), .out(out1) );
endmodule

