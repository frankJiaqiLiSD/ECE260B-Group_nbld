// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission
module core (clk, sum_in, sum_out, mem_in, out, inst, rd_en, wr_en, empty, full, reset);

parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 16;

output rd_en, wr_en;
output [bw_psum+3:0] sum_out;
output [bw_psum*col-1:0] out;
wire   [bw_psum*col-1:0] pmem_out;
input empty, full;
input  [bw_psum+3:0] sum_in;
input  [pr*bw-1:0] mem_in;
input  clk;
input  [16:0] inst; 
input  reset;

wire  [pr*bw-1:0] mac_in;
wire  [pr*bw-1:0] kmem_out;
wire  [pr*bw-1:0] qmem_out;
wire  [bw_psum*col-1:0] pmem_in;
wire  [bw_psum*col-1:0] fifo_out;
wire  [bw_psum*col-1:0] sfp_out;
wire  [bw_psum*col-1:0] array_out;
wire  [col-1:0] fifo_wr;
wire  ofifo_rd;
wire  fifo_valid;
wire [3:0] qkmem_add;
wire [3:0] pmem_add;

wire  qmem_rd;
wire  qmem_wr; 
wire  kmem_rd;
wire  kmem_wr; 
wire  pmem_rd;
wire  pmem_wr; 

//Setup for sfp
wire acc;
wire div;
wire sfp_wr;
reg [3:0] sfp_wr_add;
assign acc = pmem_rd;
assign div = pmem_rd;

assign ofifo_rd = inst[16];
assign qkmem_add = inst[15:12];
assign pmem_add = inst[11:8];

assign qmem_rd = inst[5];
assign qmem_wr = inst[4];
assign kmem_rd = inst[3];
assign kmem_wr = inst[2];
assign pmem_rd = inst[1];
assign pmem_wr = inst[0];

assign mac_in  = inst[6] ? kmem_out : qmem_out;
assign pmem_in = fifo_out;

mac_array #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) mac_array_instance (
        .in(mac_in), 
        .clk(clk), 
        .reset(reset), 
        .inst(inst[7:6]),     
        .fifo_wr(fifo_wr),     
	.out(array_out)
);

ofifo #(.bw(bw_psum), .col(col)) ofifo_inst (
        .reset(reset),
        .clk(clk),
        .in(array_out),
        .wr(fifo_wr),
        .rd(ofifo_rd),
        .o_valid(fifo_valid),
        .out(fifo_out)
);


sram_w16 #(.sram_bit(pr*bw)) qmem_instance (
        .CLK(clk),
        .D(mem_in),
        .Q(qmem_out),
        .CEN(!(qmem_rd||qmem_wr)),
        .WEN(!qmem_wr), 
        .A(qkmem_add)
);

sram_w16 #(.sram_bit(pr*bw)) kmem_instance (
        .CLK(clk),
        .D(mem_in),
        .Q(kmem_out),
        .CEN(!(kmem_rd||kmem_wr)),
        .WEN(!kmem_wr), 
        .A(qkmem_add)
);

//Two ports pmem, A for ofifo writing only, B for sfp reading and writing 
sram_2ports #(.sram_bit(col*bw_psum)) psum_mem_instance (
        .CLK(clk),
        .D_A(pmem_in),
        .CEN_A(!(pmem_rd || pmem_wr)), 
        .WEN_A(!pmem_wr), 
        .A_A(pmem_add),

        .D_B(sfp_out),
        .Q_B(pmem_out),
        .CEN_B(!(sfp_wr)),
        .WEN_B(!sfp_wr), 
        .A_B( sfp_wr ? sfp_wr_add : pmem_add)
);

sfp_row #(.col(col), .bw(bw), .bw_psum(bw_psum)) sfp_core (
        .clk(clk),
        .reset(reset),
	.txrx_rd_en(rd_en),
	.txrx_wr_en(wr_en),
	.txrx_full(full),
	.txrx_empty(empty),
        .acc(acc),
        .div(div),
        .sum_in(sum_in),
        .sum_out(sum_out),
        .sfp_in(pmem_out),
        .sfp_out(sfp_out),
	.sfp_wr(sfp_wr)
);

always @(posedge clk) begin
        if (reset) begin
		sfp_wr_add <= 0;
        end 
        else begin
		if(sfp_wr) sfp_wr_add <= sfp_wr_add+1;
        end
end

//   //////////// For printing purpose ////////////
//   always @(posedge clk) begin
//       if(pmem_wr)
//          $display("Memory write to PSUM mem add %x %x ", pmem_add, pmem_in); 
//   end

// Only for verilog verification and Part I. 
// "out" should be normalized later
// "sum_out" should be used in later dual-core 
assign out = pmem_out;
//assign sum_out = pmem_out[bw_psum+3:0];



endmodule
