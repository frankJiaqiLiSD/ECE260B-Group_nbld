/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : K-2015.06-SP2
// Date      : Fri Mar  6 21:06:10 2026
/////////////////////////////////////////////////////////////


module core ( clk, sum_out, mem_in, out, inst, reset );
  output [23:0] sum_out;
  input [127:0] mem_in;
  output [159:0] out;
  input [16:0] inst;
  input clk, reset;
  wire   N2, N3, N4, N5, n1;
  tri   clk;
  tri   [127:0] mem_in;
  tri   [159:0] out;
  tri   reset;
  tri   [127:0] mac_in;
  tri   [127:0] kmem_out;
  tri   [127:0] qmem_out;
  tri   [159:0] pmem_in;
  tri   [7:0] fifo_wr;
  tri   [159:0] array_out;
  tri   n_0_net_;
  tri   n_1_net_;
  tri   n_2_net_;
  tri   n_3_net_;
  tri   n_4_net_;
  tri   n_5_net_;

  mac_array mac_array_instance ( .in(mac_in), .clk(clk), .reset(reset), .inst(
        inst[7:6]), .fifo_wr(fifo_wr), .out(array_out) );
  ofifo ofifo_inst ( .reset(reset), .clk(clk), .in(array_out), .wr(fifo_wr), 
        .rd(inst[16]), .out(pmem_in) );
  sram_w16 qmem_instance ( .CLK(clk), .D(mem_in), .Q(qmem_out), .CEN(n_0_net_), 
        .WEN(n_1_net_), .A(inst[15:12]) );
  sram_w16 kmem_instance ( .CLK(clk), .D(mem_in), .Q(kmem_out), .CEN(n_2_net_), 
        .WEN(n_3_net_), .A(inst[15:12]) );
  sram_w16 psum_mem_instance ( .CLK(clk), .D(pmem_in), .Q(out), .CEN(n_4_net_), 
        .WEN(n_5_net_), .A(inst[11:8]) );
  INVD0 U5 ( .I(inst[4]), .ZN(n_1_net_) );
  INVD0 U6 ( .I(N3), .ZN(n_0_net_) );
  INVD0 U7 ( .I(inst[2]), .ZN(n_3_net_) );
  INVD0 U8 ( .I(N4), .ZN(n_2_net_) );
  INVD0 U9 ( .I(inst[0]), .ZN(n_5_net_) );
  INVD0 U10 ( .I(N5), .ZN(n_4_net_) );
  AO22D0 U11 ( .A1(inst[6]), .A2(kmem_out[127]), .B1(n1), .B2(qmem_out[127]), 
        .Z(mac_in[127]) );
  AO22D0 U12 ( .A1(inst[6]), .A2(kmem_out[126]), .B1(n1), .B2(qmem_out[126]), 
        .Z(mac_in[126]) );
  AO22D0 U13 ( .A1(inst[6]), .A2(kmem_out[125]), .B1(N2), .B2(qmem_out[125]), 
        .Z(mac_in[125]) );
  AO22D0 U14 ( .A1(inst[6]), .A2(kmem_out[124]), .B1(N2), .B2(qmem_out[124]), 
        .Z(mac_in[124]) );
  AO22D0 U15 ( .A1(inst[6]), .A2(kmem_out[123]), .B1(N2), .B2(qmem_out[123]), 
        .Z(mac_in[123]) );
  AO22D0 U16 ( .A1(inst[6]), .A2(kmem_out[122]), .B1(n1), .B2(qmem_out[122]), 
        .Z(mac_in[122]) );
  AO22D0 U17 ( .A1(inst[6]), .A2(kmem_out[121]), .B1(N2), .B2(qmem_out[121]), 
        .Z(mac_in[121]) );
  AO22D0 U18 ( .A1(inst[6]), .A2(kmem_out[120]), .B1(n1), .B2(qmem_out[120]), 
        .Z(mac_in[120]) );
  AO22D0 U19 ( .A1(inst[6]), .A2(kmem_out[119]), .B1(N2), .B2(qmem_out[119]), 
        .Z(mac_in[119]) );
  AO22D0 U20 ( .A1(inst[6]), .A2(kmem_out[118]), .B1(n1), .B2(qmem_out[118]), 
        .Z(mac_in[118]) );
  AO22D0 U21 ( .A1(inst[6]), .A2(kmem_out[117]), .B1(N2), .B2(qmem_out[117]), 
        .Z(mac_in[117]) );
  AO22D0 U22 ( .A1(inst[6]), .A2(kmem_out[116]), .B1(n1), .B2(qmem_out[116]), 
        .Z(mac_in[116]) );
  AO22D0 U23 ( .A1(inst[6]), .A2(kmem_out[115]), .B1(N2), .B2(qmem_out[115]), 
        .Z(mac_in[115]) );
  AO22D0 U24 ( .A1(inst[6]), .A2(kmem_out[114]), .B1(n1), .B2(qmem_out[114]), 
        .Z(mac_in[114]) );
  AO22D0 U25 ( .A1(inst[6]), .A2(kmem_out[113]), .B1(N2), .B2(qmem_out[113]), 
        .Z(mac_in[113]) );
  AO22D0 U26 ( .A1(inst[6]), .A2(kmem_out[112]), .B1(n1), .B2(qmem_out[112]), 
        .Z(mac_in[112]) );
  AO22D0 U27 ( .A1(inst[6]), .A2(kmem_out[111]), .B1(N2), .B2(qmem_out[111]), 
        .Z(mac_in[111]) );
  AO22D0 U28 ( .A1(inst[6]), .A2(kmem_out[110]), .B1(n1), .B2(qmem_out[110]), 
        .Z(mac_in[110]) );
  AO22D0 U29 ( .A1(inst[6]), .A2(kmem_out[109]), .B1(N2), .B2(qmem_out[109]), 
        .Z(mac_in[109]) );
  AO22D0 U30 ( .A1(inst[6]), .A2(kmem_out[108]), .B1(n1), .B2(qmem_out[108]), 
        .Z(mac_in[108]) );
  AO22D0 U31 ( .A1(inst[6]), .A2(kmem_out[107]), .B1(N2), .B2(qmem_out[107]), 
        .Z(mac_in[107]) );
  AO22D0 U32 ( .A1(inst[6]), .A2(kmem_out[106]), .B1(n1), .B2(qmem_out[106]), 
        .Z(mac_in[106]) );
  AO22D0 U33 ( .A1(inst[6]), .A2(kmem_out[105]), .B1(N2), .B2(qmem_out[105]), 
        .Z(mac_in[105]) );
  AO22D0 U34 ( .A1(inst[6]), .A2(kmem_out[104]), .B1(n1), .B2(qmem_out[104]), 
        .Z(mac_in[104]) );
  AO22D0 U35 ( .A1(inst[6]), .A2(kmem_out[103]), .B1(N2), .B2(qmem_out[103]), 
        .Z(mac_in[103]) );
  AO22D0 U36 ( .A1(inst[6]), .A2(kmem_out[102]), .B1(n1), .B2(qmem_out[102]), 
        .Z(mac_in[102]) );
  AO22D0 U37 ( .A1(inst[6]), .A2(kmem_out[101]), .B1(n1), .B2(qmem_out[101]), 
        .Z(mac_in[101]) );
  AO22D0 U38 ( .A1(inst[6]), .A2(kmem_out[100]), .B1(N2), .B2(qmem_out[100]), 
        .Z(mac_in[100]) );
  AO22D0 U39 ( .A1(inst[6]), .A2(kmem_out[99]), .B1(N2), .B2(qmem_out[99]), 
        .Z(mac_in[99]) );
  AO22D0 U40 ( .A1(inst[6]), .A2(kmem_out[98]), .B1(n1), .B2(qmem_out[98]), 
        .Z(mac_in[98]) );
  AO22D0 U41 ( .A1(inst[6]), .A2(kmem_out[97]), .B1(N2), .B2(qmem_out[97]), 
        .Z(mac_in[97]) );
  AO22D0 U42 ( .A1(inst[6]), .A2(kmem_out[96]), .B1(n1), .B2(qmem_out[96]), 
        .Z(mac_in[96]) );
  AO22D0 U43 ( .A1(inst[6]), .A2(kmem_out[95]), .B1(n1), .B2(qmem_out[95]), 
        .Z(mac_in[95]) );
  AO22D0 U44 ( .A1(inst[6]), .A2(kmem_out[94]), .B1(N2), .B2(qmem_out[94]), 
        .Z(mac_in[94]) );
  AO22D0 U45 ( .A1(inst[6]), .A2(kmem_out[93]), .B1(N2), .B2(qmem_out[93]), 
        .Z(mac_in[93]) );
  AO22D0 U46 ( .A1(inst[6]), .A2(kmem_out[92]), .B1(n1), .B2(qmem_out[92]), 
        .Z(mac_in[92]) );
  AO22D0 U47 ( .A1(inst[6]), .A2(kmem_out[91]), .B1(N2), .B2(qmem_out[91]), 
        .Z(mac_in[91]) );
  AO22D0 U48 ( .A1(inst[6]), .A2(kmem_out[90]), .B1(N2), .B2(qmem_out[90]), 
        .Z(mac_in[90]) );
  AO22D0 U49 ( .A1(inst[6]), .A2(kmem_out[89]), .B1(n1), .B2(qmem_out[89]), 
        .Z(mac_in[89]) );
  AO22D0 U50 ( .A1(inst[6]), .A2(kmem_out[88]), .B1(N2), .B2(qmem_out[88]), 
        .Z(mac_in[88]) );
  AO22D0 U51 ( .A1(inst[6]), .A2(kmem_out[87]), .B1(n1), .B2(qmem_out[87]), 
        .Z(mac_in[87]) );
  AO22D0 U52 ( .A1(inst[6]), .A2(kmem_out[86]), .B1(n1), .B2(qmem_out[86]), 
        .Z(mac_in[86]) );
  AO22D0 U53 ( .A1(inst[6]), .A2(kmem_out[85]), .B1(N2), .B2(qmem_out[85]), 
        .Z(mac_in[85]) );
  AO22D0 U54 ( .A1(inst[6]), .A2(kmem_out[84]), .B1(N2), .B2(qmem_out[84]), 
        .Z(mac_in[84]) );
  AO22D0 U55 ( .A1(inst[6]), .A2(kmem_out[83]), .B1(n1), .B2(qmem_out[83]), 
        .Z(mac_in[83]) );
  AO22D0 U56 ( .A1(inst[6]), .A2(kmem_out[82]), .B1(n1), .B2(qmem_out[82]), 
        .Z(mac_in[82]) );
  AO22D0 U57 ( .A1(inst[6]), .A2(kmem_out[81]), .B1(N2), .B2(qmem_out[81]), 
        .Z(mac_in[81]) );
  AO22D0 U58 ( .A1(inst[6]), .A2(kmem_out[80]), .B1(n1), .B2(qmem_out[80]), 
        .Z(mac_in[80]) );
  AO22D0 U59 ( .A1(inst[6]), .A2(kmem_out[79]), .B1(n1), .B2(qmem_out[79]), 
        .Z(mac_in[79]) );
  AO22D0 U60 ( .A1(inst[6]), .A2(kmem_out[78]), .B1(N2), .B2(qmem_out[78]), 
        .Z(mac_in[78]) );
  AO22D0 U61 ( .A1(inst[6]), .A2(kmem_out[77]), .B1(n1), .B2(qmem_out[77]), 
        .Z(mac_in[77]) );
  AO22D0 U62 ( .A1(inst[6]), .A2(kmem_out[76]), .B1(N2), .B2(qmem_out[76]), 
        .Z(mac_in[76]) );
  AO22D0 U63 ( .A1(inst[6]), .A2(kmem_out[75]), .B1(N2), .B2(qmem_out[75]), 
        .Z(mac_in[75]) );
  AO22D0 U64 ( .A1(inst[6]), .A2(kmem_out[74]), .B1(n1), .B2(qmem_out[74]), 
        .Z(mac_in[74]) );
  AO22D0 U65 ( .A1(inst[6]), .A2(kmem_out[73]), .B1(N2), .B2(qmem_out[73]), 
        .Z(mac_in[73]) );
  AO22D0 U66 ( .A1(inst[6]), .A2(kmem_out[72]), .B1(n1), .B2(qmem_out[72]), 
        .Z(mac_in[72]) );
  AO22D0 U67 ( .A1(inst[6]), .A2(kmem_out[71]), .B1(n1), .B2(qmem_out[71]), 
        .Z(mac_in[71]) );
  AO22D0 U68 ( .A1(inst[6]), .A2(kmem_out[70]), .B1(N2), .B2(qmem_out[70]), 
        .Z(mac_in[70]) );
  AO22D0 U69 ( .A1(inst[6]), .A2(kmem_out[69]), .B1(n1), .B2(qmem_out[69]), 
        .Z(mac_in[69]) );
  AO22D0 U70 ( .A1(inst[6]), .A2(kmem_out[68]), .B1(N2), .B2(qmem_out[68]), 
        .Z(mac_in[68]) );
  AO22D0 U71 ( .A1(inst[6]), .A2(kmem_out[67]), .B1(N2), .B2(qmem_out[67]), 
        .Z(mac_in[67]) );
  AO22D0 U72 ( .A1(inst[6]), .A2(kmem_out[66]), .B1(N2), .B2(qmem_out[66]), 
        .Z(mac_in[66]) );
  AO22D0 U73 ( .A1(inst[6]), .A2(kmem_out[65]), .B1(n1), .B2(qmem_out[65]), 
        .Z(mac_in[65]) );
  AO22D0 U74 ( .A1(inst[6]), .A2(kmem_out[64]), .B1(n1), .B2(qmem_out[64]), 
        .Z(mac_in[64]) );
  AO22D0 U75 ( .A1(inst[6]), .A2(kmem_out[63]), .B1(N2), .B2(qmem_out[63]), 
        .Z(mac_in[63]) );
  AO22D0 U76 ( .A1(inst[6]), .A2(kmem_out[62]), .B1(N2), .B2(qmem_out[62]), 
        .Z(mac_in[62]) );
  AO22D0 U77 ( .A1(inst[6]), .A2(kmem_out[61]), .B1(n1), .B2(qmem_out[61]), 
        .Z(mac_in[61]) );
  AO22D0 U78 ( .A1(inst[6]), .A2(kmem_out[60]), .B1(N2), .B2(qmem_out[60]), 
        .Z(mac_in[60]) );
  AO22D0 U79 ( .A1(inst[6]), .A2(kmem_out[59]), .B1(n1), .B2(qmem_out[59]), 
        .Z(mac_in[59]) );
  AO22D0 U80 ( .A1(inst[6]), .A2(kmem_out[58]), .B1(N2), .B2(qmem_out[58]), 
        .Z(mac_in[58]) );
  AO22D0 U81 ( .A1(inst[6]), .A2(kmem_out[57]), .B1(N2), .B2(qmem_out[57]), 
        .Z(mac_in[57]) );
  AO22D0 U82 ( .A1(inst[6]), .A2(kmem_out[56]), .B1(n1), .B2(qmem_out[56]), 
        .Z(mac_in[56]) );
  AO22D0 U83 ( .A1(inst[6]), .A2(kmem_out[55]), .B1(n1), .B2(qmem_out[55]), 
        .Z(mac_in[55]) );
  AO22D0 U84 ( .A1(inst[6]), .A2(kmem_out[54]), .B1(N2), .B2(qmem_out[54]), 
        .Z(mac_in[54]) );
  AO22D0 U85 ( .A1(inst[6]), .A2(kmem_out[53]), .B1(n1), .B2(qmem_out[53]), 
        .Z(mac_in[53]) );
  AO22D0 U86 ( .A1(inst[6]), .A2(kmem_out[52]), .B1(N2), .B2(qmem_out[52]), 
        .Z(mac_in[52]) );
  AO22D0 U87 ( .A1(inst[6]), .A2(kmem_out[51]), .B1(n1), .B2(qmem_out[51]), 
        .Z(mac_in[51]) );
  AO22D0 U88 ( .A1(inst[6]), .A2(kmem_out[50]), .B1(n1), .B2(qmem_out[50]), 
        .Z(mac_in[50]) );
  AO22D0 U89 ( .A1(inst[6]), .A2(kmem_out[49]), .B1(N2), .B2(qmem_out[49]), 
        .Z(mac_in[49]) );
  AO22D0 U90 ( .A1(inst[6]), .A2(kmem_out[48]), .B1(N2), .B2(qmem_out[48]), 
        .Z(mac_in[48]) );
  AO22D0 U91 ( .A1(inst[6]), .A2(kmem_out[47]), .B1(n1), .B2(qmem_out[47]), 
        .Z(mac_in[47]) );
  AO22D0 U92 ( .A1(inst[6]), .A2(kmem_out[46]), .B1(n1), .B2(qmem_out[46]), 
        .Z(mac_in[46]) );
  AO22D0 U93 ( .A1(inst[6]), .A2(kmem_out[45]), .B1(N2), .B2(qmem_out[45]), 
        .Z(mac_in[45]) );
  AO22D0 U94 ( .A1(inst[6]), .A2(kmem_out[44]), .B1(N2), .B2(qmem_out[44]), 
        .Z(mac_in[44]) );
  AO22D0 U95 ( .A1(inst[6]), .A2(kmem_out[43]), .B1(N2), .B2(qmem_out[43]), 
        .Z(mac_in[43]) );
  AO22D0 U96 ( .A1(inst[6]), .A2(kmem_out[42]), .B1(N2), .B2(qmem_out[42]), 
        .Z(mac_in[42]) );
  AO22D0 U97 ( .A1(inst[6]), .A2(kmem_out[41]), .B1(n1), .B2(qmem_out[41]), 
        .Z(mac_in[41]) );
  AO22D0 U98 ( .A1(inst[6]), .A2(kmem_out[40]), .B1(n1), .B2(qmem_out[40]), 
        .Z(mac_in[40]) );
  AO22D0 U99 ( .A1(inst[6]), .A2(kmem_out[39]), .B1(N2), .B2(qmem_out[39]), 
        .Z(mac_in[39]) );
  AO22D0 U100 ( .A1(inst[6]), .A2(kmem_out[38]), .B1(n1), .B2(qmem_out[38]), 
        .Z(mac_in[38]) );
  AO22D0 U101 ( .A1(inst[6]), .A2(kmem_out[37]), .B1(n1), .B2(qmem_out[37]), 
        .Z(mac_in[37]) );
  AO22D0 U102 ( .A1(inst[6]), .A2(kmem_out[36]), .B1(N2), .B2(qmem_out[36]), 
        .Z(mac_in[36]) );
  AO22D0 U103 ( .A1(inst[6]), .A2(kmem_out[35]), .B1(n1), .B2(qmem_out[35]), 
        .Z(mac_in[35]) );
  AO22D0 U104 ( .A1(inst[6]), .A2(kmem_out[34]), .B1(N2), .B2(qmem_out[34]), 
        .Z(mac_in[34]) );
  AO22D0 U105 ( .A1(inst[6]), .A2(kmem_out[33]), .B1(n1), .B2(qmem_out[33]), 
        .Z(mac_in[33]) );
  AO22D0 U106 ( .A1(inst[6]), .A2(kmem_out[32]), .B1(N2), .B2(qmem_out[32]), 
        .Z(mac_in[32]) );
  AO22D0 U107 ( .A1(inst[6]), .A2(kmem_out[31]), .B1(n1), .B2(qmem_out[31]), 
        .Z(mac_in[31]) );
  AO22D0 U108 ( .A1(inst[6]), .A2(kmem_out[30]), .B1(n1), .B2(qmem_out[30]), 
        .Z(mac_in[30]) );
  AO22D0 U109 ( .A1(inst[6]), .A2(kmem_out[29]), .B1(n1), .B2(qmem_out[29]), 
        .Z(mac_in[29]) );
  AO22D0 U110 ( .A1(inst[6]), .A2(kmem_out[28]), .B1(N2), .B2(qmem_out[28]), 
        .Z(mac_in[28]) );
  AO22D0 U111 ( .A1(inst[6]), .A2(kmem_out[27]), .B1(N2), .B2(qmem_out[27]), 
        .Z(mac_in[27]) );
  AO22D0 U112 ( .A1(inst[6]), .A2(kmem_out[26]), .B1(n1), .B2(qmem_out[26]), 
        .Z(mac_in[26]) );
  AO22D0 U113 ( .A1(inst[6]), .A2(kmem_out[25]), .B1(N2), .B2(qmem_out[25]), 
        .Z(mac_in[25]) );
  AO22D0 U114 ( .A1(inst[6]), .A2(kmem_out[24]), .B1(N2), .B2(qmem_out[24]), 
        .Z(mac_in[24]) );
  AO22D0 U115 ( .A1(inst[6]), .A2(kmem_out[23]), .B1(N2), .B2(qmem_out[23]), 
        .Z(mac_in[23]) );
  AO22D0 U116 ( .A1(inst[6]), .A2(kmem_out[22]), .B1(N2), .B2(qmem_out[22]), 
        .Z(mac_in[22]) );
  AO22D0 U117 ( .A1(inst[6]), .A2(kmem_out[21]), .B1(N2), .B2(qmem_out[21]), 
        .Z(mac_in[21]) );
  AO22D0 U118 ( .A1(inst[6]), .A2(kmem_out[20]), .B1(N2), .B2(qmem_out[20]), 
        .Z(mac_in[20]) );
  AO22D0 U119 ( .A1(inst[6]), .A2(kmem_out[19]), .B1(N2), .B2(qmem_out[19]), 
        .Z(mac_in[19]) );
  AO22D0 U120 ( .A1(inst[6]), .A2(kmem_out[18]), .B1(N2), .B2(qmem_out[18]), 
        .Z(mac_in[18]) );
  AO22D0 U121 ( .A1(inst[6]), .A2(kmem_out[17]), .B1(n1), .B2(qmem_out[17]), 
        .Z(mac_in[17]) );
  AO22D0 U122 ( .A1(inst[6]), .A2(kmem_out[16]), .B1(n1), .B2(qmem_out[16]), 
        .Z(mac_in[16]) );
  AO22D0 U123 ( .A1(inst[6]), .A2(kmem_out[15]), .B1(N2), .B2(qmem_out[15]), 
        .Z(mac_in[15]) );
  AO22D0 U124 ( .A1(inst[6]), .A2(kmem_out[14]), .B1(n1), .B2(qmem_out[14]), 
        .Z(mac_in[14]) );
  AO22D0 U125 ( .A1(inst[6]), .A2(kmem_out[13]), .B1(N2), .B2(qmem_out[13]), 
        .Z(mac_in[13]) );
  AO22D0 U126 ( .A1(inst[6]), .A2(kmem_out[12]), .B1(n1), .B2(qmem_out[12]), 
        .Z(mac_in[12]) );
  AO22D0 U127 ( .A1(inst[6]), .A2(kmem_out[11]), .B1(N2), .B2(qmem_out[11]), 
        .Z(mac_in[11]) );
  AO22D0 U128 ( .A1(inst[6]), .A2(kmem_out[10]), .B1(n1), .B2(qmem_out[10]), 
        .Z(mac_in[10]) );
  AO22D0 U129 ( .A1(inst[6]), .A2(kmem_out[9]), .B1(N2), .B2(qmem_out[9]), .Z(
        mac_in[9]) );
  AO22D0 U130 ( .A1(inst[6]), .A2(kmem_out[8]), .B1(n1), .B2(qmem_out[8]), .Z(
        mac_in[8]) );
  AO22D0 U131 ( .A1(inst[6]), .A2(kmem_out[7]), .B1(n1), .B2(qmem_out[7]), .Z(
        mac_in[7]) );
  AO22D0 U132 ( .A1(inst[6]), .A2(kmem_out[6]), .B1(n1), .B2(qmem_out[6]), .Z(
        mac_in[6]) );
  AO22D0 U133 ( .A1(inst[6]), .A2(kmem_out[5]), .B1(n1), .B2(qmem_out[5]), .Z(
        mac_in[5]) );
  AO22D0 U134 ( .A1(inst[6]), .A2(kmem_out[4]), .B1(n1), .B2(qmem_out[4]), .Z(
        mac_in[4]) );
  AO22D0 U135 ( .A1(inst[6]), .A2(kmem_out[3]), .B1(n1), .B2(qmem_out[3]), .Z(
        mac_in[3]) );
  AO22D0 U136 ( .A1(inst[6]), .A2(kmem_out[2]), .B1(n1), .B2(qmem_out[2]), .Z(
        mac_in[2]) );
  AO22D0 U137 ( .A1(inst[6]), .A2(kmem_out[1]), .B1(n1), .B2(qmem_out[1]), .Z(
        mac_in[1]) );
  AO22D0 U138 ( .A1(inst[6]), .A2(kmem_out[0]), .B1(n1), .B2(qmem_out[0]), .Z(
        mac_in[0]) );
  BUFFD1 U139 ( .I(N2), .Z(n1) );
  OR2D0 U140 ( .A1(inst[1]), .A2(inst[0]), .Z(N5) );
  OR2D0 U141 ( .A1(inst[3]), .A2(inst[2]), .Z(N4) );
  OR2D0 U142 ( .A1(inst[5]), .A2(inst[4]), .Z(N3) );
  INVD1 U143 ( .I(inst[6]), .ZN(N2) );
endmodule

