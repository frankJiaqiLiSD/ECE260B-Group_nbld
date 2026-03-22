//por mineyrose

`timescale 1ns/1ps

module async_fifo_tb0;

reg clk_tx, clk_rx, reset, wr_en, rd_en;
reg [3:0] wr_data;
wire [3:0] rd_data;
wire full, empty;

initial clk_tx = 0; always #1 clk_tx = ~clk_tx;
initial clk_rx = 0; always #1 clk_rx = ~clk_rx;

integer i;

async_fifo_depth16 fifo (.clk_rx(clk_rx), .clk_tx(clk_tx),
                         .wr_data(wr_data), .rd_data(rd_data),
			 .wr_en(wr_en), .rd_en(rd_en),
			 .o_full(full), .o_empty(empty),
			 .reset(reset)
		        );
			
    initial begin

	$dumpfile("async_fifo_tb0.vcd");
	$dumpvars(0,async_fifo_tb0);

	reset = 0;
       	#20 reset = 1;
       	#10 reset = 0;

	wr_en = 0; rd_en = 0;
	#20
	$display("filling up stage! 1");
	for(i = 0; i < 4; i = i+1) begin
	@(posedge clk_tx);
	    if (!full) begin
	       wr_en = 1;
	       wr_data =i;
	       @(posedge clk_tx);
	       $display("writing: %h", wr_data);
	    end else begin
		$display("full!");
	        wr_en = 0;
	    end
	    wr_en = 0;
	end
	wr_en = 0;
       #50
       $display( "reading out stage! 1" );

       rd_en = 1;
       while(!empty) begin
       @(posedge clk_rx);
       if(!empty)
       $display("read %d", rd_data);
       end
	#100
        $finish;
    end
endmodule
