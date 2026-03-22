// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission
module sfp_row (clk, reset, acc, div, txrx_full, txrx_empty, txrx_rd_en, txrx_wr_en, sum_in, sum_out, sfp_in, sfp_out, sfp_wr);

  parameter col = 8;
  parameter bw = 8;
  parameter bw_psum = 2*bw+4;


  input  clk, reset, acc, div, txrx_full, txrx_empty;
  input  [bw_psum+3:0] sum_in;
  input  [col*bw_psum-1:0] sfp_in;
  wire   [col*bw_psum-1:0] sfp_in_abs,sfp_in_abs_o;
  wire  [col*bw_psum-1:0] denominator_abs;
  reg    div_q,div_q2,div_q3,div_q4,div_q5,div_q6,div_q7,div_q8;
  reg    acc_q, acc_q2, acc_q3;
  output [col*bw_psum-1:0] sfp_out;
  output [bw_psum+3:0] sum_out;
  output reg txrx_rd_en, txrx_wr_en;
  reg  [bw_psum+3:0] sum_this_core_q;
  reg  [bw_psum+3:0] sum_rx_q;
  wire [bw_psum+3:0] sum_this_core;
  wire [bw_psum+3:0] sum_rx;
  wire [bw_psum-1:0] sum_2core;
  reg [bw_psum-1:0] sum_2core_q;

  reg  [col*bw_psum-1 : 0] sfp_in_q;

  wire [bw_psum-1:0] sfp_in_abs0;
  wire [bw_psum-1:0] sfp_in_abs1;
  wire [bw_psum-1:0] sfp_in_abs2;
  wire [bw_psum-1:0] sfp_in_abs3;
  wire [bw_psum-1:0] sfp_in_abs4;
  wire [bw_psum-1:0] sfp_in_abs5;
  wire [bw_psum-1:0] sfp_in_abs6;
  wire [bw_psum-1:0] sfp_in_abs7;

  wire [bw_psum-1:0] sfp_in_abs0_o;
  wire [bw_psum-1:0] sfp_in_abs1_o;
  wire [bw_psum-1:0] sfp_in_abs2_o;
  wire [bw_psum-1:0] sfp_in_abs3_o;
  wire [bw_psum-1:0] sfp_in_abs4_o;
  wire [bw_psum-1:0] sfp_in_abs5_o;
  wire [bw_psum-1:0] sfp_in_abs6_o;
  wire [bw_psum-1:0] sfp_in_abs7_o;

  reg [bw_psum-1:0] sfp_in_abs0_q;
  reg [bw_psum-1:0] sfp_in_abs1_q;
  reg [bw_psum-1:0] sfp_in_abs2_q;
  reg [bw_psum-1:0] sfp_in_abs3_q;
  reg [bw_psum-1:0] sfp_in_abs4_q;
  reg [bw_psum-1:0] sfp_in_abs5_q;
  reg [bw_psum-1:0] sfp_in_abs6_q;
  reg [bw_psum-1:0] sfp_in_abs7_q;


  wire [bw_psum-1:0] sfp_out_abs0;
  wire [bw_psum-1:0] sfp_out_abs1;
  wire [bw_psum-1:0] sfp_out_abs2;
  wire [bw_psum-1:0] sfp_out_abs3;
  wire [bw_psum-1:0] sfp_out_abs4;
  wire [bw_psum-1:0] sfp_out_abs5;
  wire [bw_psum-1:0] sfp_out_abs6;
  wire [bw_psum-1:0] sfp_out_abs7;

  reg [bw_psum-1:0] sfp_out_abs0_q;
  reg [bw_psum-1:0] sfp_out_abs1_q;
  reg [bw_psum-1:0] sfp_out_abs2_q;
  reg [bw_psum-1:0] sfp_out_abs3_q;
  reg [bw_psum-1:0] sfp_out_abs4_q;
  reg [bw_psum-1:0] sfp_out_abs5_q;
  reg [bw_psum-1:0] sfp_out_abs6_q;
  reg [bw_psum-1:0] sfp_out_abs7_q;


  reg [bw_psum+3:0] sum_q;

  reg fifo_wr;
  reg rx_rd_en, rx_wr_en;
  reg tx_rd_en, txrx_rd_en_q, txrx_rd_en_q2;
 
  reg rd_state, wr_state, div_state;
  output reg sfp_wr;

  wire int_fifo_full;
  wire tx_fifo_full;
  wire rx_fifo_full;
  wire int_fifo_empty;
  wire tx_fifo_empty;
  wire rx_fifo_empty;
  wire fifo_valid;

  assign sfp_in_abs0 = (sfp_in_q[bw_psum*1-1]) ?  (~sfp_in_q[bw_psum*1-1 : bw_psum*0] + 1)  :  sfp_in_q[bw_psum*1-1 : bw_psum*0];
  assign sfp_in_abs1 = (sfp_in_q[bw_psum*2-1]) ?  (~sfp_in_q[bw_psum*2-1 : bw_psum*1] + 1)  :  sfp_in_q[bw_psum*2-1 : bw_psum*1];
  assign sfp_in_abs2 = (sfp_in_q[bw_psum*3-1]) ?  (~sfp_in_q[bw_psum*3-1 : bw_psum*2] + 1)  :  sfp_in_q[bw_psum*3-1 : bw_psum*2];
  assign sfp_in_abs3 = (sfp_in_q[bw_psum*4-1]) ?  (~sfp_in_q[bw_psum*4-1 : bw_psum*3] + 1)  :  sfp_in_q[bw_psum*4-1 : bw_psum*3];
  assign sfp_in_abs4 = (sfp_in_q[bw_psum*5-1]) ?  (~sfp_in_q[bw_psum*5-1 : bw_psum*4] + 1)  :  sfp_in_q[bw_psum*5-1 : bw_psum*4];
  assign sfp_in_abs5 = (sfp_in_q[bw_psum*6-1]) ?  (~sfp_in_q[bw_psum*6-1 : bw_psum*5] + 1)  :  sfp_in_q[bw_psum*6-1 : bw_psum*5];
  assign sfp_in_abs6 = (sfp_in_q[bw_psum*7-1]) ?  (~sfp_in_q[bw_psum*7-1 : bw_psum*6] + 1)  :  sfp_in_q[bw_psum*7-1 : bw_psum*6];
  assign sfp_in_abs7 = (sfp_in_q[bw_psum*8-1]) ?  (~sfp_in_q[bw_psum*8-1 : bw_psum*7] + 1)  :  sfp_in_q[bw_psum*8-1 : bw_psum*7];

  assign sfp_in_abs[bw_psum*1-1 : bw_psum*0] = sfp_in_abs0;
  assign sfp_in_abs[bw_psum*2-1 : bw_psum*1] = sfp_in_abs1;
  assign sfp_in_abs[bw_psum*3-1 : bw_psum*2] = sfp_in_abs2;
  assign sfp_in_abs[bw_psum*4-1 : bw_psum*3] = sfp_in_abs3;
  assign sfp_in_abs[bw_psum*5-1 : bw_psum*4] = sfp_in_abs4;
  assign sfp_in_abs[bw_psum*6-1 : bw_psum*5] = sfp_in_abs5;
  assign sfp_in_abs[bw_psum*7-1 : bw_psum*6] = sfp_in_abs6;
  assign sfp_in_abs[bw_psum*8-1 : bw_psum*7] = sfp_in_abs7;


  assign sfp_in_abs0_o =  sfp_in_abs_o[bw_psum*1-1 : bw_psum*0]; 
  assign sfp_in_abs1_o =  sfp_in_abs_o[bw_psum*2-1 : bw_psum*1];
  assign sfp_in_abs2_o =  sfp_in_abs_o[bw_psum*3-1 : bw_psum*2];
  assign sfp_in_abs3_o =  sfp_in_abs_o[bw_psum*4-1 : bw_psum*3];
  assign sfp_in_abs4_o =  sfp_in_abs_o[bw_psum*5-1 : bw_psum*4];
  assign sfp_in_abs5_o =  sfp_in_abs_o[bw_psum*6-1 : bw_psum*5];
  assign sfp_in_abs6_o =  sfp_in_abs_o[bw_psum*7-1 : bw_psum*6];
  assign sfp_in_abs7_o =  sfp_in_abs_o[bw_psum*8-1 : bw_psum*7];
  
  
  assign sfp_out[bw_psum*1-1 : bw_psum*0] = sfp_out_abs0_q;
  assign sfp_out[bw_psum*2-1 : bw_psum*1] = sfp_out_abs1_q;
  assign sfp_out[bw_psum*3-1 : bw_psum*2] = sfp_out_abs2_q;
  assign sfp_out[bw_psum*4-1 : bw_psum*3] = sfp_out_abs3_q;
  assign sfp_out[bw_psum*5-1 : bw_psum*4] = sfp_out_abs4_q;
  assign sfp_out[bw_psum*6-1 : bw_psum*5] = sfp_out_abs5_q;
  assign sfp_out[bw_psum*7-1 : bw_psum*6] = sfp_out_abs6_q;
  assign sfp_out[bw_psum*8-1 : bw_psum*7] = sfp_out_abs7_q;


  assign sum_2core = sum_this_core_q[bw_psum+3:7] + sum_rx_q[bw_psum+3:7];

  assign denominator_abs[bw_psum*1-1 : bw_psum*0] = (sfp_in_q[bw_psum*1-1]) ?  (~sfp_in_q[bw_psum*1-1 : bw_psum*0] + 1)  :  sfp_in_q[bw_psum*1-1 : bw_psum*0];
  assign denominator_abs[bw_psum*2-1 : bw_psum*1] = (sfp_in_q[bw_psum*2-1]) ?  (~sfp_in_q[bw_psum*2-1 : bw_psum*1] + 1)  :  sfp_in_q[bw_psum*2-1 : bw_psum*1];
  assign denominator_abs[bw_psum*3-1 : bw_psum*2] = (sfp_in_q[bw_psum*3-1]) ?  (~sfp_in_q[bw_psum*3-1 : bw_psum*2] + 1)  :  sfp_in_q[bw_psum*3-1 : bw_psum*2];
  assign denominator_abs[bw_psum*4-1 : bw_psum*3] = (sfp_in_q[bw_psum*4-1]) ?  (~sfp_in_q[bw_psum*4-1 : bw_psum*3] + 1)  :  sfp_in_q[bw_psum*4-1 : bw_psum*3];
  assign denominator_abs[bw_psum*5-1 : bw_psum*4] = (sfp_in_q[bw_psum*5-1]) ?  (~sfp_in_q[bw_psum*5-1 : bw_psum*4] + 1)  :  sfp_in_q[bw_psum*5-1 : bw_psum*4];
  assign denominator_abs[bw_psum*6-1 : bw_psum*5] = (sfp_in_q[bw_psum*6-1]) ?  (~sfp_in_q[bw_psum*6-1 : bw_psum*5] + 1)  :  sfp_in_q[bw_psum*6-1 : bw_psum*5];
  assign denominator_abs[bw_psum*7-1 : bw_psum*6] = (sfp_in_q[bw_psum*7-1]) ?  (~sfp_in_q[bw_psum*7-1 : bw_psum*6] + 1)  :  sfp_in_q[bw_psum*7-1 : bw_psum*6];
  assign denominator_abs[bw_psum*8-1 : bw_psum*7] = (sfp_in_q[bw_psum*8-1]) ?  (~sfp_in_q[bw_psum*8-1 : bw_psum*7] + 1)  :  sfp_in_q[bw_psum*8-1 : bw_psum*7];

  assign  sfp_out_abs0 = sfp_in_abs0_q / sum_2core_q;
  assign  sfp_out_abs1 = sfp_in_abs1_q / sum_2core_q;
  assign  sfp_out_abs2 = sfp_in_abs2_q / sum_2core_q;
  assign  sfp_out_abs3 = sfp_in_abs3_q / sum_2core_q;
  assign  sfp_out_abs4 = sfp_in_abs4_q / sum_2core_q;
  assign  sfp_out_abs5 = sfp_in_abs5_q / sum_2core_q;
  assign  sfp_out_abs6 = sfp_in_abs6_q / sum_2core_q;
  assign  sfp_out_abs7 = sfp_in_abs7_q / sum_2core_q;
  wire div_busy = div_q|div_q2|div_q3|div_q4|div_q5|div_q6|div_q7|div_q8;

  ofifo #(.bw(bw_psum), .col(col)) abs_fifo ( //core's fifo for magnitudes
          .reset(reset),
	  .clk(clk),
	  .in(sfp_in_abs),
	  .wr({fifo_wr,fifo_wr,
	       fifo_wr,fifo_wr,
	       fifo_wr,fifo_wr,
	       fifo_wr,fifo_wr}),
	  .rd(div_q),
	  .o_valid(fifo_valid),
	  .out(sfp_in_abs_o)
  );

  fifo_depth16 #(.bw(bw_psum+4)) fifo_inst_int ( //core's fifo sum storage
     .rd_clk(clk), 
     .wr_clk(clk), 
     .in(sum_q),
     .out(sum_this_core), 
     .rd(div_q), 
     .wr(fifo_wr),
     .o_full(int_fifo_full),
     .o_empty(int_fifo_empty), 
     .reset(reset)
  );

  fifo_depth16 #(.bw(bw_psum+4)) fifo_inst_ext ( //core's fifo for transmit
     .rd_clk(clk), 
     .wr_clk(clk), 
     .in(sum_q),
     .out(sum_out), 
     .rd(tx_rd_en), 
     .wr(fifo_wr),
     .o_full(tx_fifo_full),
     .o_empty(tx_fifo_empty),
     .reset(reset)
  );

  fifo_depth16 #(.bw(bw_psum+4)) fifo_inst_rx ( //core's fifo for receive
     .rd_clk(clk),
     .wr_clk(clk),
     .in(sum_in),
     .out(sum_rx),
     .rd(rx_rd_en),
     .wr(rx_wr_en),
     .o_full(rx_fifo_full),
     .o_empty(rx_fifo_empty),
     .reset(reset)
  );

  always @ (posedge clk) begin
    if (reset) begin
      fifo_wr <= 0;
      sfp_wr <= 0;
      div_q <= 0;

      div_q2 <= 0;
      div_q3 <= 0;
      div_q4 <= 0;
      div_q5 <= 0;
      div_q6 <= 0;
      div_q7 <= 0;
      div_q8 <= 0;

      txrx_rd_en <= 0;
      txrx_wr_en <= 0;
      rx_rd_en <= 0;
      rx_wr_en <= 0;
      tx_rd_en <= 0;
      rd_state <= 0;
      wr_state <= 0;
      div_state <= 0;
      sfp_in_q <= 0;
      acc_q <= 0;

      acc_q2 <= 0;
      acc_q3 <= 0;
      sum_q <= 0; 
      sum_this_core_q <= 0;
      sum_rx_q <= 0;
      sum_2core_q <= 0;
      sfp_in_abs0_q <= 0;
      sfp_in_abs1_q <= 0;
      sfp_in_abs2_q <= 0;
      sfp_in_abs3_q <= 0;
      sfp_in_abs4_q <= 0;
      sfp_in_abs5_q <= 0;
      sfp_in_abs6_q <= 0;
      sfp_in_abs7_q <= 0;
      sfp_out_abs0_q <= 0;
      sfp_out_abs1_q <= 0;
      sfp_out_abs2_q <= 0;
      sfp_out_abs3_q <= 0;
      sfp_out_abs4_q <= 0;
      sfp_out_abs5_q <= 0;
      sfp_out_abs6_q <= 0;
      sfp_out_abs7_q <= 0;
      txrx_rd_en_q <= 0; 
      txrx_rd_en_q2 <= 0;

    end
    else begin
      //div_q <= div;
      div_q2 <= div_q;
      div_q3 <= div_q2; 
      div_q4 <= div_q3;
      div_q5 <= div_q4;
      div_q6 <= div_q5;
      div_q7 <= div_q6;
      div_q8 <= div_q7;
      acc_q <= acc;
      acc_q2 <= acc_q;
      acc_q3 <= acc_q2;
      if(acc_q) begin //takes a cycle for sfp_in to be valid
         sfp_in_q <= sfp_in;
      end
      if (acc_q3) begin
        sum_q <= 
          {4'b0, sfp_in_abs[bw_psum*1-1 : bw_psum*0]} +
          {4'b0, sfp_in_abs[bw_psum*2-1 : bw_psum*1]} +
          {4'b0, sfp_in_abs[bw_psum*3-1 : bw_psum*2]} +
          {4'b0, sfp_in_abs[bw_psum*4-1 : bw_psum*3]} +
          {4'b0, sfp_in_abs[bw_psum*5-1 : bw_psum*4]} +
          {4'b0, sfp_in_abs[bw_psum*6-1 : bw_psum*5]} +
          {4'b0, sfp_in_abs[bw_psum*7-1 : bw_psum*6]} +
          {4'b0, sfp_in_abs[bw_psum*8-1 : bw_psum*7]} ;
        fifo_wr <= 1; //sum is ready
      end

      else begin
        fifo_wr <= 0; //sum is not ready
      end
   
      if (div_q) begin
        sum_this_core_q <= sum_this_core;
        sum_rx_q <= sum_rx;
	sfp_in_abs0_q <= sfp_in_abs0_o;
        sfp_in_abs1_q <= sfp_in_abs1_o;
 	sfp_in_abs2_q <= sfp_in_abs2_o;
        sfp_in_abs3_q <= sfp_in_abs3_o;     
     	sfp_in_abs4_q <= sfp_in_abs4_o;
        sfp_in_abs5_q <= sfp_in_abs5_o;
	sfp_in_abs6_q <= sfp_in_abs6_o;
        sfp_in_abs7_q <= sfp_in_abs7_o;
      end
      if (div_q2) begin
          sum_2core_q <= sum_2core;
      end
      if (div_q8) begin
          sfp_out_abs0_q <= sfp_out_abs0;
	  sfp_out_abs1_q <= sfp_out_abs1;
          sfp_out_abs2_q <= sfp_out_abs2;
	  sfp_out_abs3_q <= sfp_out_abs3;
	  sfp_out_abs4_q <= sfp_out_abs4;
	  sfp_out_abs5_q <= sfp_out_abs5;
	  sfp_out_abs6_q <= sfp_out_abs6;
	  sfp_out_abs7_q <= sfp_out_abs7;
          sfp_wr <= 1;
       end else begin
          sfp_wr <= 0;
       end

    
    //fifo business
    //if there is a sum ready, put it in internal fifo and external fifo
    //if the transceiver is empty, write external fifo data to transceiver
    //if receiver fifo is not full, read from transceiver and store in rx fifo
    //if reciever fifo and internal fifo are not empty, rd from rx and int
    //combine sum
    //use combined sum for normalizacao

    case (rd_state)
	    1'b0: begin
		    if(!rx_fifo_full && !txrx_empty)begin
	              txrx_rd_en<=1;
		      rx_wr_en<=1;
		      rd_state<=1;
		    end else
	            rd_state<=0;
	    end
	    1'b1: begin
		    txrx_rd_en<=0;
		    rx_wr_en<=0;
		    rd_state<=0;
	    end
    endcase


    case (wr_state)
	    1'b0: begin
		    if(!tx_fifo_empty && !txrx_full)begin
	              txrx_wr_en<=1;
		      tx_rd_en<=1;
		      wr_state<=1;
	            end else
	            wr_state<=0;
	    end
	    1'b1: begin
		    txrx_wr_en<=0;
		    tx_rd_en<=0;
		    wr_state<=0;
	    end
    endcase

    case (div_state)
	    1'b0: begin
                    if(!int_fifo_empty && !rx_fifo_empty && !div_busy) begin //if both our sum and rx sum are ready, divide
                       div_q <= 1; //rd int fifo
	               rx_rd_en <= 1; //rd rx fifo 
		       div_state <= 1;
                    end else div_state <= 0;
	    end
	    1'b1: begin
		    div_q <= 0;
		    rx_rd_en <= 0;
		    div_state <= 0;
	    end
    endcase
    end
  end



endmodule

