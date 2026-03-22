//por mineyrose
module ctrl_tx(clk_tx, rd_ptr_tx, wr_ptr_o, wr_ptr_gray_o, wr_en, sf_wr_en, full_o, reset);
    input clk_tx;
    input reset;
    input [4:0] rd_ptr_tx;//read ptr from the transmitter in gray
    input wr_en;

    output [4:0] wr_ptr_o; //wr_ptr in bin code pra receiver n fifo
    output [4:0] wr_ptr_gray_o; //wr_ptr in gray code for receiver and fifo
    output full_o;
    output sf_wr_en;

    reg full; //init to full

    reg [4:0] wr_ptr; //local wr_ptr in binary
    reg [4:0] wr_ptr_gray; //local wr_ptr in gray

    wire full_n;
    wire [4:0] wr_ptr_n; //next ptr states
    wire [4:0] wr_ptr_gray_n;
   
    assign wr_ptr_gray_o = wr_ptr_gray; //output registered gray wr_ptr
    assign wr_ptr_o = wr_ptr; //output registered bin wr_ptr
    
    assign sf_wr_en = (!full && wr_en) ? 1'b1 : 1'b0; // enable write only if fifo is not full

    assign wr_ptr_n = wr_ptr + sf_wr_en; // update ptr only if safe
    assign wr_ptr_gray_n = (wr_ptr_n >> 1)^wr_ptr_n; //convert that ptr to gray


    assign full_n = (wr_ptr_gray_n[2:0] == rd_ptr_tx[2:0]) &&
	            (wr_ptr_gray_n[4] != rd_ptr_tx[4]) &&
		    (wr_ptr_gray_n[3] != rd_ptr_tx[3])
	            ? 1'b1 : 1'b0; //check if fifo is full in gray
  
    assign full_o = full;

    always @ (posedge clk_tx) begin
	if(reset == 1) begin
	    full <= 1'b0; 
	    wr_ptr <= 5'b00000;
	    wr_ptr_gray <= 5'b00000;
        end else begin
	    full <= full_n;
	    if(sf_wr_en) begin //only update ptrs on safe write
		wr_ptr <= wr_ptr_n; 
                wr_ptr_gray <= wr_ptr_gray_n;
            end
        end
    end

endmodule
