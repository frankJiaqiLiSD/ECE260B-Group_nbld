//por mineyrose
//a can ask to read from b or write to b
//b can ask to read from a or write to a
module transceiver(clk_a,clk_b,
                   wr_data_a, wr_data_b,
	           rd_data_a, rd_data_b,
	           wr_en_a, wr_en_b,
	           rd_en_a, rd_en_b,
	           full_a, full_b,
	           empty_a, empty_b,
	           reset_a, reset_b);

           parameter bw = 24;
	   parameter simd = 1;

	   input clk_a, clk_b;
	   input reset_a, reset_b;
	   input [simd*bw-1:0] wr_data_a, wr_data_b;
	   input wr_en_a, wr_en_b;
	   input rd_en_a, rd_en_b;
	   output full_a, full_b;
           output empty_a, empty_b;
           output [simd*bw-1:0] rd_data_a, rd_data_b;

	   async_fifo_depth16 #(.bw(bw)) a_b_fifo (
		                   .clk_rx(clk_b), .clk_tx(clk_a),
	                           .wr_data(wr_data_a), .rd_data(rd_data_b),
				   .wr_en(wr_en_a), .rd_en(rd_en_b),
			           .o_full(full_a), .o_empty(empty_b),
			           .reset(reset_a)
				   );

           async_fifo_depth16 #(.bw(bw)) b_a_fifo (
		                   .clk_rx(clk_a), .clk_tx(clk_b),
	                           .wr_data(wr_data_b), .rd_data(rd_data_a),
				   .wr_en(wr_en_b), .rd_en(rd_en_a),
			           .o_full(full_b), .o_empty(empty_a),
			           .reset(reset_b)
				   );

endmodule
