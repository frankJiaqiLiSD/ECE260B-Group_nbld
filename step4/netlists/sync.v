// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission
// por mineyrose
module sync(clk, in, out, reset);

parameter bw = 1; //default param

input[bw-1:0]  in; 
input  clk;
input reset;
output[bw-1:0] out;

reg[bw-1:0]    int1; 
reg[bw-1:0]    int2; 

assign out = int2;

always @ (posedge clk) begin
   if(reset == 1) begin
       int1<=0;
       int2<=0;
   end else begin
       int1 <= in;
       int2 <= int1;
   end
end

endmodule
