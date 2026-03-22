// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission
module mac_col (clk, reset, out, q_in, q_out, i_inst, fifo_wr, o_inst);

parameter bw = 8;
parameter bw_psum = 2*bw+6;
parameter pr = 8;
parameter col_id = 0;

output signed [bw_psum-1:0] out;
input  signed [pr*bw-1:0] q_in;
output signed [pr*bw-1:0] q_out;
input  clk, reset;
input  [1:0] i_inst; 
output [1:0] o_inst; 
output fifo_wr;
reg    load_ready_q;
reg    [3:0] cnt_q;
reg    [1:0] inst_q;
reg    [1:0] inst_2q;
reg    [1:0] inst_3q;
reg    [1:0] inst_4q;
reg    [1:0] inst_5q;
reg    [1:0] inst_6q;
reg    [1:0] inst_7q;
reg    [1:0] inst_8q;
reg    [1:0] inst_9q;
reg    [1:0] inst_10q;
reg   signed [pr*bw-1:0] query_q;
reg   signed [pr*bw-1:0] key_q;
reg   signed [bw_psum-1:0] psum_q;
wire  signed [bw_psum-1:0] psum;

assign o_inst = inst_q; 
// Align ofifo write strobe with valid psum_q at mac_col output.
assign fifo_wr = inst_7q[1]; 
assign q_out  = query_q;
assign out = psum_q; 

mac_16in #(.bw(bw), .bw_psum(bw_psum), .pr(pr)) mac_16in_instance (
        .a(query_q), 
        .b(key_q),
        .clk(clk),
        .reset(reset),
	      .out(psum)
); 


always @ (posedge clk) begin
  if (reset) begin
    cnt_q <= 0;
    load_ready_q <= 1;
    inst_q <= 0;
    inst_2q <= 0;
    inst_3q <= 0;
    inst_4q <= 0;
    inst_5q <= 0;
    inst_6q <= 0;
    inst_7q <= 0;
    inst_8q <= 0;
    inst_9q <= 0;
    inst_10q <= 0;
    query_q <= 0;
    key_q <= 0;
    psum_q  <= 0;
  end
  else begin
    inst_q <= i_inst;
    inst_2q <= inst_q;
    inst_3q <= inst_2q;
    inst_4q <= inst_3q;
    inst_5q <= inst_4q;
    inst_6q <= inst_5q;
    inst_7q <= inst_6q;
    inst_8q <= inst_7q;
    inst_9q <= inst_8q;
    inst_10q <= inst_9q;
    if (i_inst[0]) begin
      query_q <= q_in;
      
      if (load_ready_q) begin
        if (cnt_q == 8-col_id)begin
          cnt_q <= 0;
          key_q <= q_in;
          load_ready_q <= 0;
        end
        else begin
          cnt_q <= cnt_q + 1;
        end
      end
    end

    if(i_inst[1]) begin
      query_q <= q_in;
    end
    if(inst_5q[1]) begin
      psum_q  <= psum;
    end
  end
end

endmodule
