//por mineyrose

`timescale 1ns/1ps

module async_fifo_tb1;

reg clk_tx, clk_rx, reset, wr_en, rd_en, rd_en1, wr_en1;
reg [3:0] wr_data;
reg [3:0] data_rd;
reg [32][3:0] writes;
reg [32][3:0] reads;
wire [3:0] rd_data;
wire full, empty;

reg [15:0] sum;

initial clk_tx = 0; always #2 clk_tx = ~clk_tx;
initial clk_rx = 0; always #10 clk_rx = ~clk_rx;
initial sum = 0;
initial wr_data = 4'b0000;
initial data_rd = 4'b0000;
initial rd_en = 1;
initial wr_en = 1;

integer i,j,k,expected_sum;

async_fifo_depth16 fifo (.clk_rx(clk_rx), .clk_tx(clk_tx),
                         .wr_data(wr_data), .rd_data(rd_data),
			 .wr_en(wr_en), .rd_en(rd_en),
			 .o_full(full), .o_empty(empty),
			 .reset(reset)
		        );
			
    initial begin

	$dumpfile("async_fifo_tb1.vcd");
	$dumpvars(0,async_fifo_tb1);

	reset = 0;
       	#20 reset = 1;
       	#10 reset = 0;
        i = 0;
	j = 0;
	expected_sum = 0;
	#100000

	for(k = 0; k < 32; k=k+1) begin
	    expected_sum = expected_sum + writes[k];
	    sum = sum + reads[k];
	end

        $display("expected sum: %h", expected_sum);
	$display("sum: %h", sum);
        $finish;
    end
        assign wr_data_n = 4;
	always @ (posedge clk_tx) begin
	    if(!full && i < 32) begin
	        wr_en <= 1;
		wr_data <= 12;
		if(wr_en) begin
	            writes[i] <= wr_data;
		    i = i + 1;
	        end
            end else begin
	        wr_en <= 0;
            end
	end

	always @ (posedge clk_rx) begin
		if(!empty) begin
		   rd_en <= 1;
		   if(rd_en) begin
	            reads[j] <= rd_data;
		    j = j+1;
	           end
	        end else begin
		   rd_en <=0;
	        end
	end

endmodule
