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
reg [bw_psum*col-1:0] out_q;
// reg [bw_psum*col-1:0] out_q_1;
reg rd_en_q_1;
reg rd_en_q;
// reg wr_en_q_1;
reg wr_en_q;

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
wire [bw_psum+3:0] sum_out_w;
reg [bw_psum+3:0] sum_out_q;
// reg [bw_psum+3:0] sum_out_q_1;

wire  qmem_rd;
wire  qmem_wr; 
wire  kmem_rd;
wire  kmem_wr; 
wire  pmem_rd;
wire  pmem_wr; 
reg [2:0] rd_pending;
wire empty_w;
assign empty_w = empty | (|rd_pending);

wire  rd_en_w;
wire  wr_en_w;
reg [bw_psum*col-1:0] sfp_out_q;
wire [bw_psum*col-1:0] sfp_out_w;

//Setup for sfp
wire acc;
wire div;
wire sfp_wr_w;
wire sfp_wr;
reg sfp_wr_q;
reg [3:0] sfp_wr_add;

reg pmem_rd_d; // 1-cycle delay to match SRAM read pipeline
reg [3:0] inst_q; // pipeline register for pmem address
reg pmem_rd_q;    // pipeline register for pmem read control
reg pmem_wr_q;    // pipeline register for pmem write control
reg [bw_psum*col-1:0] pmem_in_q; // pipeline register for pmem write data
assign acc = pmem_rd_d;
assign div = pmem_rd_d;

assign ofifo_rd = inst[16];
assign qkmem_add = inst[15:12];
assign pmem_add = inst_q;

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
        .D_A(pmem_in_q),
        .CEN_A(!(pmem_rd_q || pmem_wr_q)),
        .WEN_A(!pmem_wr_q),
        .A_A(pmem_add),

        .D_B(sfp_out_q),
        .Q_B(pmem_out),
        .CEN_B(!(sfp_wr)),
        .WEN_B(!sfp_wr), 
        .A_B( sfp_wr ? sfp_wr_add : pmem_add)
);

sfp_row #(.col(col), .bw(bw), .bw_psum(bw_psum)) sfp_core (
        .clk(clk),
        .reset(reset),
	.txrx_rd_en(rd_en_w),
	.txrx_wr_en(wr_en_w),
	.txrx_full(full),
	.txrx_empty(empty_w),
        .acc(acc),
        .div(div),
        .sum_in(sum_in),
        .sum_out(sum_out_w),
        .sfp_in(pmem_out),
        .sfp_out(sfp_out_w),
	.sfp_wr(sfp_wr_w)
);

always @(posedge clk) begin
        if (reset) begin
		sfp_wr_add <= 0;
                out_q <= 0;
                rd_en_q <= 0;
                wr_en_q <= 0;
                sum_out_q <= 0;
                rd_en_q_1 <= 0;
                rd_pending <= 0;
                sfp_wr_q <= 0;
                sfp_out_q <= 0;
                pmem_rd_d <= 0;
                inst_q <= 0;
                pmem_rd_q <= 0;
                pmem_wr_q <= 0;
                pmem_in_q <= 0;
        end
        else begin
                inst_q <= inst[11:8];
                pmem_rd_q <= pmem_rd;
                pmem_wr_q <= pmem_wr;
                pmem_in_q <= pmem_in;
                pmem_rd_d <= pmem_rd_q;
		if(sfp_wr) sfp_wr_add <= sfp_wr_add+1;
                        out_q <= pmem_out;
                        rd_en_q_1 <= rd_en_w;
                        rd_en_q <= rd_en_q_1;
                        rd_pending <= {rd_pending[1:0], rd_en_w};
                        wr_en_q <= wr_en_w;
                        sum_out_q <= sum_out_w;
                        sfp_wr_q <= sfp_wr_w;
                        sfp_out_q <= sfp_out_w;
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
// assign out = pmem_out;
assign rd_en = rd_en_q;
assign wr_en = wr_en_q;
assign out = out_q;
assign sum_out = sum_out_q;
assign sfp_wr = sfp_wr_q;
// assign inst_w = inst_q;

//assign sum_out = pmem_out[bw_psum+3:0];



endmodule
