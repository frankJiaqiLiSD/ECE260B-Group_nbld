module sfp(clk, sfp_in, sfp_out, sum_out);
    parameter col = 8;
    parameter bw = 8;
    parameter bw_psum = 2*bw+4;

    input clk;
    input [col*bw_psum-1:0] sfp_in;
    output [col*bw_psum-1:0] sfp_out;
    output [bw_psum+3:0] sum_out;

    reg [col*bw_psum-1:0] data;

    assign sfp_out = data;

always @(posedge clk) begin
    data <= sfp_in;
end

endmodule