// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module mac_16in (clk, out, a, b);

parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 16; // parallel factor: number of inputs = 64

output [bw_psum-1:0] out;
reg [bw_psum-1:0] out1_q, out2_q, out3_q, out4_q, out_q;
input  [pr*bw-1:0] a;
input  [pr*bw-1:0] b;
input clk;

wire [bw_psum-1:0] out1, out2, out3, out4, out0;
wire [pr*(2*bw)-1:0] product;
reg [pr*(2*bw)-1:0] product_q;

genvar i;
for (i=0; i<pr; i=i+1) begin : prod_k
	assign product[2*bw*(i+1)-1:2*bw*i] = 
		{{(bw){a[bw* (i+1) -1]}},	a[bw*(i+1) -1:bw*i]} *	
		{{(bw){b[bw* (i+1) -1]}},	b[bw*(i+1) -1:bw*i]};
end

always @(posedge clk) begin
	product_q <= product;
        out1_q <= out1;
        out2_q <= out2;
        out3_q <= out3;
        out4_q <= out4;
        out_q <= out0;
end


assign out1 =
        {{(4){product_q[2*bw*( 0+1)-1]}},product_q[2*bw*( 0+1)-1:2*bw* 0]} +
        {{(4){product_q[2*bw*( 1+1)-1]}},product_q[2*bw*( 1+1)-1:2*bw* 1]} +
        {{(4){product_q[2*bw*( 2+1)-1]}},product_q[2*bw*( 2+1)-1:2*bw* 2]} +
        {{(4){product_q[2*bw*( 3+1)-1]}},product_q[2*bw*( 3+1)-1:2*bw* 3]};
assign out2 =
        {{(4){product_q[2*bw*( 4+1)-1]}},product_q[2*bw*( 4+1)-1:2*bw* 4]} +
        {{(4){product_q[2*bw*( 5+1)-1]}},product_q[2*bw*( 5+1)-1:2*bw* 5]} +
        {{(4){product_q[2*bw*( 6+1)-1]}},product_q[2*bw*( 6+1)-1:2*bw* 6]} +
        {{(4){product_q[2*bw*( 7+1)-1]}},product_q[2*bw*( 7+1)-1:2*bw* 7]};
assign out3 =
        {{(4){product_q[2*bw*( 8+1)-1]}},product_q[2*bw*( 8+1)-1:2*bw* 8]} +
        {{(4){product_q[2*bw*( 9+1)-1]}},product_q[2*bw*( 9+1)-1:2*bw* 9]} +
        {{(4){product_q[2*bw*(10+1)-1]}},product_q[2*bw*(10+1)-1:2*bw*10]} +
        {{(4){product_q[2*bw*(11+1)-1]}},product_q[2*bw*(11+1)-1:2*bw*11]};
assign out4 =
        {{(4){product_q[2*bw*(12+1)-1]}},product_q[2*bw*(12+1)-1:2*bw*12]} +
        {{(4){product_q[2*bw*(13+1)-1]}},product_q[2*bw*(13+1)-1:2*bw*13]} +
        {{(4){product_q[2*bw*(14+1)-1]}},product_q[2*bw*(14+1)-1:2*bw*14]} +
        {{(4){product_q[2*bw*(15+1)-1]}},product_q[2*bw*(15+1)-1:2*bw*15]};

assign out0 = out1_q + out2_q + out3_q + out4_q;

assign out = out_q;

endmodule
