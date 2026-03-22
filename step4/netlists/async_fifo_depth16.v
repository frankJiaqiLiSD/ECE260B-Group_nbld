//por mineyrose
module async_fifo_depth16 (clk_rx, clk_tx, wr_data, rd_data, wr_en, rd_en, o_full, o_empty, reset);

  parameter bw = 4;
  parameter simd = 1;

  //ctrls
  input clk_tx;
  input clk_rx;
  input wr_en;
  input rd_en;
  input reset;
  output o_full;
  output o_empty;
  //data

  input [simd*bw-1:0] wr_data;
  output [simd*bw-1:0] rd_data;

  wire full, empty;

  wire [4:0] rd_ptr;
  wire [4:0] wr_ptr;
  wire [4:0] rd_ptr_gray;
  wire [4:0] wr_ptr_gray;
  wire [4:0] rd_ptr_tx;
  wire [4:0] wr_ptr_rx;
  wire sf_wr_en;
  wire sf_rd_en;


  // reg [simd*bw-1:0] q0;
  // reg [simd*bw-1:0] q1;
  // reg [simd*bw-1:0] q2;
  // reg [simd*bw-1:0] q3;
  // reg [simd*bw-1:0] q4;
  // reg [simd*bw-1:0] q5;
  // reg [simd*bw-1:0] q6;
  // reg [simd*bw-1:0] q7;
  // reg [simd*bw-1:0] q8;
  // reg [simd*bw-1:0] q9;
  // reg [simd*bw-1:0] q10;
  // reg [simd*bw-1:0] q11;
  // reg [simd*bw-1:0] q12;
  // reg [simd*bw-1:0] q13;
  // reg [simd*bw-1:0] q14;
  // reg [simd*bw-1:0] q15;
  reg [simd*bw-1:0] q [0:15];


  assign o_full = full;
  assign o_empty = empty;

  fifo_mux_16_1  #(.bw(bw), .simd(simd)) fifo_mux_16_1a (
         .in0(q[0]),   .in1(q[1]),   .in2(q[2]),   .in3(q[3]),
         .in4(q[4]),   .in5(q[5]),   .in6(q[6]),   .in7(q[7]),
         .in8(q[8]),   .in9(q[9]),   .in10(q[10]), .in11(q[11]),
         .in12(q[12]), .in13(q[13]), .in14(q[14]), .in15(q[15]),
         .sel(rd_ptr[3:0]), .out(rd_data));

 sync #(.bw(5)) r2w_sync (.clk(clk_tx), .in(rd_ptr_gray), .out(rd_ptr_tx), .reset(reset)); //sync for read(rx) to write (tx)
 sync #(.bw(5)) w2r_sync (.clk(clk_rx), .in(wr_ptr_gray), .out(wr_ptr_rx), .reset(reset)); //sync for write(tx) to read(rx)
 
 //Transmit Control Logic
 
  ctrl_tx ctrl_tx_instance (.clk_tx(clk_tx), .rd_ptr_tx( rd_ptr_tx ),
	                    .wr_ptr_o( wr_ptr ),
	                    .wr_ptr_gray_o( wr_ptr_gray ), .wr_en(wr_en), 
			    .sf_wr_en( sf_wr_en ), .full_o( full ), 
			    .reset(reset) );
 
 //Receive Control Logic

  ctrl_rx ctrl_rx_instance (.clk_rx(clk_rx), .wr_ptr_rx( wr_ptr_rx ),
	                    .rd_ptr_o( rd_ptr ), 
	                    .rd_ptr_gray_o( rd_ptr_gray ), .rd_en(rd_en),
			    .sf_rd_en( sf_rd_en ), .empty_o( empty ),
			    .reset(reset) );

 always @ (posedge clk_tx) begin
     if (sf_wr_en == 1) begin
        //      case (wr_ptr[3:0])
        //        4'b0000 : q0 <= wr_data;
        //        4'b0001 : q1 <= wr_data;
        //        4'b0010 : q2 <= wr_data;
        //        4'b0011 : q3 <= wr_data;
        //        4'b0100 : q4 <= wr_data;
        //        4'b0101 : q5 <= wr_data;
        //        4'b0110 : q6 <= wr_data;
        //        4'b0111 : q7 <= wr_data;
        //        4'b1000 : q8 <= wr_data;
        //        4'b1001 : q9 <= wr_data;
        //        4'b1010 : q10 <= wr_data;
	      //  4'b1011 : q11 <= wr_data;
        //        4'b1100 : q12 <= wr_data;
        //        4'b1101 : q13 <= wr_data;
        //        4'b1110 : q14 <= wr_data;
        //        4'b1111 : q15 <= wr_data;
        //      endcase
        q[wr_ptr[3:0]] <= wr_data;
     end
 end
endmodule
