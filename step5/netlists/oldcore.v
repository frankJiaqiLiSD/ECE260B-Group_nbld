// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module core (clk, sum_out, mem_in, out, inst, reset);

parameter col = 8;
parameter bw = 8;
parameter bw_psum = 2*bw+4;
parameter pr = 16;

output [bw_psum+3:0] sum_out;
output [bw_psum*col-1:0] out;
wire   [bw_psum*col-1:0] pmem_out;
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
wire fifo_ext_rd;
wire sfp_wr;
wire [3:0] sfp_wr_add;
reg [3:0] pmem_add_q1, pmem_add_q2;
reg pmem_rd_q1,  pmem_rd_q2;
assign acc = ofifo_rd;
assign div = pmem_rd;
assign fifo_ext_rd = 1'b0;
assign sfp_wr = pmem_rd_q2;
assign sfp_wr_add = pmem_add_q2;

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

ofifo #(.bw(bw_psum), .col(col))  ofifo_inst (
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
        .CEN_A(!(1'b0 || pmem_wr)), 
        .WEN_A(!pmem_wr), 
        .A_A(pmem_add),

        .D_B(sfp_out),
        .Q_B(pmem_out),
        .CEN_B(!(pmem_rd || sfp_wr)),
        .WEN_B(!sfp_wr), 
        .A_B((sfp_wr) ? sfp_wr_add : pmem_add)
);

sfp_row #(.col(col), .bw(bw), .bw_psum(bw_psum)) sfp_core0 (
        .clk(clk),
        .reset(reset),
        .acc(acc),
        .div(div),
        .fifo_ext_rd(fifo_ext_rd),
        .sum_in(24'b0),
        .sum_out(sum_out),
        .sfp_in_add(fifo_out),
        .sfp_in_div(pmem_out),
        .sfp_out(sfp_out)
);

always @(posedge clk) begin
        if (reset) begin
                pmem_add_q1 <= 4'b0;
                pmem_add_q2 <= 4'b0;
                pmem_rd_q1  <= 1'b0;
                pmem_rd_q2  <= 1'b0;
        end 
        else begin
                pmem_add_q1 <= pmem_add;
                pmem_add_q2 <= pmem_add_q1;
                pmem_rd_q1  <= pmem_rd;
                pmem_rd_q2  <= pmem_rd_q1;
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
assign sum_out = pmem_out[bw_psum+3:0];



endmodule
