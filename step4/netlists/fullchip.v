// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission
module fullchip (clk0, clk1, mem_in0, mem_in1, inst0, inst1, reset0, reset1, out0, out1);

parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 16;

input  clk0, clk1; 
input  [pr*bw-1:0] mem_in0, mem_in1; 
input  [16:0] inst0, inst1; 
input  reset0, reset1;

output [bw_psum*col-1:0] out0;
output [bw_psum*col-1:0] out1;

wire [bw_psum+3:0] rd_data0, rd_data1;
wire [bw_psum+3:0] wr_data0, wr_data1;
wire rd_en0, rd_en1;
wire wr_en0, wr_en1;
wire full0, full1;
wire empty0, empty1;


core core_instance0 (
      .reset(reset0), 
      .clk(clk0), 
      .mem_in(mem_in0), 
      .inst(inst0),
      .sum_in(rd_data0),
      .sum_out(wr_data0),
      .rd_en(rd_en0),
      .wr_en(wr_en0),
      .empty(empty0),
      .full(full0),
      .out(out0)
);

//a is core0, b is core1
transceiver transceiver_instance0 (
	.clk_a( clk0 ), .clk_b( clk1 ),
	.wr_data_a(wr_data0), .wr_data_b(wr_data1),
        .rd_data_a(rd_data0), .rd_data_b(rd_data1),
        .wr_en_a(wr_en0), .wr_en_b(wr_en1),
	.rd_en_a(rd_en0), .rd_en_b(rd_en1),
	.full_a(full0), .full_b(full1),
	.empty_a(empty0), .empty_b(empty1),
	.reset_a(reset0), .reset_b(reset1)
);

core core_instance1 (
      .reset(reset1), 
      .clk(clk1),
      .mem_in(mem_in1), 
      .inst(inst1),
      .sum_in(rd_data1),
      .sum_out(wr_data1),
      .rd_en(rd_en1),
      .wr_en(wr_en1),
      .empty(empty1),
      .full(full1),
      .out(out1)
);


endmodule
