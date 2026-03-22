// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 
module sfp_row (clk, reset, acc, div, txrx_full, txrx_empty, txrx_rd_en, txrx_wr_en, sum_in, sum_out, sfp_in, sfp_out, sfp_wr);

  parameter col = 8;
  parameter bw = 8;
  parameter bw_psum = 2*bw+4;
  localparam offset = 1 << (12 - 1);

  input  clk, reset, acc, div, txrx_full, txrx_empty;
  input  [bw_psum+3:0] sum_in;
  input  [col*bw_psum-1:0] sfp_in;
  wire   [col*bw_psum-1:0] sfp_in_abs,sfp_in_abs_o;
  wire   [col*bw_psum-1:0] denominator_abs;
  reg    div_q;
  reg    [25:2] div_q_chain;
  reg    acc_q, acc_q2, acc_q3, acc_q4;
  
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
  reg [bw_psum+2:0] sum_q_half0;
  reg [bw_psum+2:0] sum_q_half1;
  reg [bw_psum+1:0] sum_q_pair0;
  reg [bw_psum+1:0] sum_q_pair1;
  reg [bw_psum+1:0] sum_q_pair2;
  reg [bw_psum+1:0] sum_q_pair3;

  //divide
  reg [bw_psum-1:0] div_divisor_q   [0:20];
  reg [bw_psum-1:0] div_remainder_q [0:20];
  reg [bw_psum-1:0] div_quotient_q  [0:20];

  reg [24:0] prod0_q [0:7]; 
  reg [24:0] prod1_q [0:7]; 
  reg [24:0] prod2_q [0:7]; 
  reg [24:0] prod3_q [0:7];
  reg [29:0] psum0_q [0:7]; 
  reg [29:0] psum1_q [0:7];

  reg [col*bw_psum-1:0] sfp_in_abs_pipeline [0:21];
  integer p;
  integer k;

  reg fifo_wr;
  reg rx_rd_en, rx_wr_en;
  reg tx_rd_en, txrx_rd_en_q, txrx_rd_en_q2;
 
  reg div_state;
  reg wr_state;
  reg rd_state;
  output reg sfp_wr;

  wire int_fifo_full;
  wire tx_fifo_full;
  wire rx_fifo_full;
  wire int_fifo_empty;
  wire tx_fifo_empty;
  wire rx_fifo_empty;
  wire fifo_valid;
  
  //divide
  genvar i;
  generate
      for (i = 0; i < 20; i = i + 1) begin : div_pipe_stage
      
          wire current_dividend_bit = (i == 7) ? 1'b1 : 1'b0;

          wire [bw_psum-1:0] next_rem   = (div_remainder_q[i] << 1) | current_dividend_bit;
          wire [bw_psum:0] sub_result = {1'b0, next_rem} - {1'b0, div_divisor_q[i]};
          wire        is_enough  = ~sub_result[bw_psum];

          always @(posedge clk) begin
              div_divisor_q[i+1]  <= div_divisor_q[i];

              if (is_enough) begin
                  div_remainder_q[i+1] <= sub_result[19:0];
                  div_quotient_q[i+1]  <= (div_quotient_q[i] << 1) | 1'b1;
              end else begin
                  div_remainder_q[i+1] <= next_rem;
                  div_quotient_q[i+1]  <= (div_quotient_q[i] << 1);
              end
          end
      end
  endgenerate

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
	  .out(sfp_in_abs_o),
	  .o_full()
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
      div_q_chain <= 0;
      txrx_rd_en <= 0;
      txrx_wr_en <= 0;
      rx_rd_en <= 0;
      rx_wr_en <= 0;
      tx_rd_en <= 0;
      rd_state <= 2'b0;
      wr_state <= 0;
      div_state <= 0;
      sfp_in_q <= 0;
      acc_q <= 0;
    end
    else begin
      //div_q <= div;
      div_q_chain <= {div_q_chain[24:2], div_q}; 
      acc_q <= acc;
      acc_q2 <= acc_q;
      acc_q3 <= acc_q2;
      acc_q4 <= acc_q3;
      if(acc_q) begin //takes a cycle for sfp_in to be valid
         sfp_in_q <= sfp_in;
      end
      if (acc_q2) begin
        sum_q_pair0 <= {2'b0, denominator_abs[bw_psum*1-1 : bw_psum*0]} + 
                       {2'b0, denominator_abs[bw_psum*2-1 : bw_psum*1]};
                       
        sum_q_pair1 <= {2'b0, denominator_abs[bw_psum*3-1 : bw_psum*2]} + 
                       {2'b0, denominator_abs[bw_psum*4-1 : bw_psum*3]};
                       
        sum_q_pair2 <= {2'b0, denominator_abs[bw_psum*5-1 : bw_psum*4]} + 
                       {2'b0, denominator_abs[bw_psum*6-1 : bw_psum*5]};
                       
        sum_q_pair3 <= {2'b0, denominator_abs[bw_psum*7-1 : bw_psum*6]} + 
                       {2'b0, denominator_abs[bw_psum*8-1 : bw_psum*7]};
      end
      if (acc_q3) begin
        sum_q_half0 <= 
          sum_q_pair0 + sum_q_pair1;
           
        sum_q_half1 <= 
          sum_q_pair2 + sum_q_pair3;
      end

      if (acc_q4) begin
        sum_q <= 
          sum_q_half0 + sum_q_half1;
        fifo_wr <= 1; //sum is ready
      end

      else begin
        fifo_wr <= 0; //sum is not ready
      end
      //divide
      if (div_q) begin
        sum_this_core_q <= sum_this_core;
        sum_rx_q <= sum_rx;

	    sfp_in_abs_pipeline[0] <= {sfp_in_abs7_o, sfp_in_abs6_o, sfp_in_abs5_o, sfp_in_abs4_o, 
                                     sfp_in_abs3_o, sfp_in_abs2_o, sfp_in_abs1_o, sfp_in_abs0_o};
      end

      for (p = 0; p < 21; p = p + 1) begin
          sfp_in_abs_pipeline[p+1] <= sfp_in_abs_pipeline[p];
      end

      if (div_q_chain[2]) begin
          div_divisor_q[0]   <= sum_2core;
          div_remainder_q[0] <= {bw_psum{1'b0}};
          div_quotient_q[0]  <= {bw_psum{1'b0}};
      end

      if (div_q_chain[23]) begin
        for (k = 0; k < 8; k = k + 1) begin
            prod0_q[k] <= sfp_in_abs_pipeline[21][bw_psum*k +: 20] * div_quotient_q[20][4:0];
            prod1_q[k] <= sfp_in_abs_pipeline[21][bw_psum*k +: 20] * div_quotient_q[20][9:5];
            prod2_q[k] <= sfp_in_abs_pipeline[21][bw_psum*k +: 20] * div_quotient_q[20][14:10];
            prod3_q[k] <= sfp_in_abs_pipeline[21][bw_psum*k +: 20] * div_quotient_q[20][19:15];
        end
      end

      if (div_q_chain[24]) begin
        for (k = 0; k < 8; k = k + 1) begin
            psum0_q[k] <= prod0_q[k] + (prod1_q[k] << 5);
            psum1_q[k] <= prod2_q[k] + (prod3_q[k] << 5);
        end
      end
      
      if (div_q_chain[25]) begin
        sfp_out_abs0_q <= (psum0_q[0] + (psum1_q[0] << 10) + offset) >> 12;
        sfp_out_abs1_q <= (psum0_q[1] + (psum1_q[1] << 10) + offset) >> 12;
        sfp_out_abs2_q <= (psum0_q[2] + (psum1_q[2] << 10) + offset) >> 12;
        sfp_out_abs3_q <= (psum0_q[3] + (psum1_q[3] << 10) + offset) >> 12;
        sfp_out_abs4_q <= (psum0_q[4] + (psum1_q[4] << 10) + offset) >> 12;
        sfp_out_abs5_q <= (psum0_q[5] + (psum1_q[5] << 10) + offset) >> 12;
        sfp_out_abs6_q <= (psum0_q[6] + (psum1_q[6] << 10) + offset) >> 12;
        sfp_out_abs7_q <= (psum0_q[7] + (psum1_q[7] << 10) + offset) >> 12;

        sfp_wr <= 1;
       end 

       else begin
        sfp_wr <= 0;
       end

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


    //   case (rd_state)
	  //   2'b0: begin
		//     if(!rx_fifo_full && !txrx_empty)begin
	  //       txrx_rd_en<=0;
		//       rx_wr_en<=1;
		//       rd_state<=1;
		//     end else
    //     rd_state<=0;
	  //   end
	  //   2'b1: begin
		//     txrx_rd_en<=1;
		//     rx_wr_en<=0;
		//     rd_state<=2;
	  //   end
    //   2'b10: begin
		//     txrx_rd_en<=0;
		//     rx_wr_en<=0;
		//     rd_state<=0;
	  //   end

    // endcase


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

    // case (wr_state)
	  //   2'b00: begin
		//     if(!tx_fifo_empty && !txrx_full)begin
	  //             txrx_wr_en<=1;
		//       tx_rd_en<=0;
		//       wr_state<=1;
	  //           end else
	  //           wr_state<=0;
	  //   end
	  //   2'b01: begin
		//     txrx_wr_en<=0;
		//     tx_rd_en<=1;
		//     wr_state<=2;
	  //   end
	  //   2'b10: begin
		//     txrx_wr_en<=0;
		//     wr_state<=0;
	  //   end
    // endcase


    case (div_state)
	    1'b0: begin
                    if(!int_fifo_empty && !rx_fifo_empty) begin //if both our sum and rx sum are ready, divide
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


endmodule

