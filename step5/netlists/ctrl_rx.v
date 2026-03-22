//por mineyrose
module ctrl_rx(clk_rx, wr_ptr_rx, rd_ptr_o, rd_ptr_gray_o, rd_en, sf_rd_en, empty_o, reset);
    input clk_rx;
    input reset;
    input [4:0] wr_ptr_rx;//write ptr from receiver in gray
    input rd_en;

    output [4:0] rd_ptr_o; //rd_ptr in bin
    output [4:0] rd_ptr_gray_o; //rd_ptr in gray code for receiver and fifo
    output empty_o;
    output sf_rd_en;

    reg empty; //init to empty

    reg [4:0] rd_ptr; //local rd_ptr in binary
    reg [4:0] rd_ptr_gray; //local rd_ptr in gray
    
    wire empty_n;
    wire [4:0] rd_ptr_n;
    wire [4:0] rd_ptr_gray_n;

    assign sf_rd_en = (!empty && rd_en) ? 1'b1 : 1'b0; // enable read only if fifo is not empty

    assign rd_ptr_n = rd_ptr + sf_rd_en; //increment rd_ptr only if safe
    assign rd_ptr_gray_n = (rd_ptr_n >> 1)^rd_ptr_n; //convert that ptr to gray
    assign rd_ptr_o = rd_ptr;
    assign rd_ptr_gray_o = rd_ptr_gray;

    assign empty_n = (rd_ptr_gray_n == wr_ptr_rx) ? 1'b1 : 1'b0; //check if fifo is empty 
   
    assign empty_o = empty;

    always @ (posedge clk_rx) begin
        if(reset == 1) begin
	    empty  <= 1'b1;
	    rd_ptr <= 5'b00000;
	    rd_ptr_gray <= 5'b00000;
        end else begin
	    empty <= empty_n;
	    if(sf_rd_en) begin //update ptr only for safe read.
                rd_ptr <= rd_ptr_n; 
                rd_ptr_gray <= rd_ptr_gray_n;
            end    
        end	
    end

endmodule
