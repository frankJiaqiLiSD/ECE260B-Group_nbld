// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 

`timescale 1ns/1ps

module fullchip_tb;

parameter total_cycle = 8;   // how many streamed Q vectors will be processed
parameter bw = 8;            // Q & K vector bit precision
parameter bw_psum = 2*bw+4;  // partial sum bit precision
parameter pr = 16;           // how many products added in each dot product 
parameter col = 8;           // how many dot product units are equipped

integer qk_file ; // file handler
integer qk_scan_file ; // file handler


integer  captured_data;
integer  weight [col*pr-1:0];
`define NULL 0




integer  K[col-1:0][pr-1:0];
integer  Q[total_cycle-1:0][pr-1:0];
integer  result[total_cycle-1:0][col-1:0];
integer  sum[total_cycle-1:0];

integer i,j,k,t,p,q,s,u,m;





reg reset = 1;
reg clk = 0;
reg [pr*bw-1:0] mem_in; 
wire [bw_psum*col-1:0] mem_out; 
reg ofifo_rd = 0;
wire [16:0] inst; 
reg qmem_rd = 0;
reg qmem_wr = 0; 
reg kmem_rd = 0; 
reg kmem_wr = 0;
reg pmem_rd = 0; 
reg pmem_wr = 0; 
reg execute = 0;
reg load = 0;
reg [3:0] qkmem_add = 0;
reg [3:0] pmem_add = 0;


assign inst[16] = ofifo_rd;
assign inst[15:12] = qkmem_add;
assign inst[11:8]  = pmem_add;
assign inst[7] = execute;
assign inst[6] = load;
assign inst[5] = qmem_rd;
assign inst[4] = qmem_wr;
assign inst[3] = kmem_rd;
assign inst[2] = kmem_wr;
assign inst[1] = pmem_rd;
assign inst[0] = pmem_wr;



reg [bw_psum-1:0] temp5b;
reg [bw_psum+3:0] temp_sum;
reg [bw_psum*col-1:0] temp16b;



fullchip #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) fullchip_instance (
      .reset(reset),
      .clk(clk), 
      .mem_in(mem_in), 
      .inst(inst),
      .out(mem_out)
);

  task tick;
    input [31:0] num_cycles;
    integer tick_counter;
    begin
      for (tick_counter=0; tick_counter<num_cycles; tick_counter=tick_counter+1) begin
        #0.5 clk = 1'b1;
        #0.5 clk = 1'b0;
      end
    end
  endtask


initial begin 

  $dumpfile("fullchip_tb.vcd");
  $dumpvars(0,fullchip_tb);

/* Each row in the file corresponds to a column of the matrix, Q₁, Q₂, ... */
///// Q data txt reading /////
  $display("##### Q data txt reading #####");
  qk_file = $fopen("q.txt", "r");
  for (q=0; q<total_cycle; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
          Q[q][j] = captured_data;
    end
  end
/////////////////////////////////


///// K data txt reading /////
  $display("##### K data txt reading #####");
  tick(12);
  reset = 0;
  qk_file = $fopen("k.txt", "r");
  for (q=0; q<col; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
          K[q][j] = captured_data;
    end
  end
/////////////////////////////////





/////////////// Estimated result printing /////////////////
  $display("##### Estimated multiplication result #####");
  for (t=0; t<total_cycle; t=t+1) begin
     for (q=0; q<col; q=q+1) begin
       result[t][q] = 0; // zero-out memory to save
     end
  end

  for (t=0; t<total_cycle; t=t+1) begin
     for (q=0; q<col; q=q+1) begin
         for (k=0; k<pr; k=k+1) begin
            result[t][q] = result[t][q] + Q[t][k] * K[q][k];
//            $display("  Expected result for row(q) #%1d, col(k) #%1d : %1d", q, t, result[t][q]);
         end

//         temp5b = result[t][q];
//         temp16b = {temp16b[139:0], temp5b};
         #0.1;
     end

     //$display("%d %d %d %d %d %d %d %d", result[t][0], result[t][1], result[t][2], result[t][3], result[t][4], result[t][5], result[t][6], result[t][7]);
//     $display("prd @cycle%2d: %40h", t, temp16b);
  end
//////////////////////////////////////////////






///// Qmem writing  /////
  $display("##### Qmem writing  #####");
  qkmem_add = 0;
  qmem_wr = 1;
  for (q=0; q<total_cycle; q=q+1) begin
    mem_in[1*bw-1:0*bw] = Q[q][0];
    mem_in[2*bw-1:1*bw] = Q[q][1];
    mem_in[3*bw-1:2*bw] = Q[q][2];
    mem_in[4*bw-1:3*bw] = Q[q][3];
    mem_in[5*bw-1:4*bw] = Q[q][4];
    mem_in[6*bw-1:5*bw] = Q[q][5];
    mem_in[7*bw-1:6*bw] = Q[q][6];
    mem_in[8*bw-1:7*bw] = Q[q][7];
    mem_in[9*bw-1:8*bw] = Q[q][8];
    mem_in[10*bw-1:9*bw] = Q[q][9];
    mem_in[11*bw-1:10*bw] = Q[q][10];
    mem_in[12*bw-1:11*bw] = Q[q][11];
    mem_in[13*bw-1:12*bw] = Q[q][12];
    mem_in[14*bw-1:13*bw] = Q[q][13];
    mem_in[15*bw-1:14*bw] = Q[q][14];
    mem_in[16*bw-1:15*bw] = Q[q][15];

    tick(1);
    qkmem_add = qkmem_add + 1; 
  end
  qmem_wr = 0; 
  tick(4);
///////////////////////////////////////////





///// Kmem writing  /////
  $display("##### Kmem writing #####");
  qkmem_add = 0;
  kmem_wr = 1;    
  for (q=0; q<col; q=q+1) begin
    mem_in[ 1*bw-1 :0*bw] = K[q][0];
    mem_in[ 2*bw-1: 1*bw] = K[q][1];
    mem_in[ 3*bw-1: 2*bw] = K[q][2];
    mem_in[ 4*bw-1: 3*bw] = K[q][3];
    mem_in[ 5*bw-1: 4*bw] = K[q][4];
    mem_in[ 6*bw-1: 5*bw] = K[q][5];
    mem_in[ 7*bw-1: 6*bw] = K[q][6];
    mem_in[ 8*bw-1: 7*bw] = K[q][7];
    mem_in[ 9*bw-1: 8*bw] = K[q][8];
    mem_in[10*bw-1: 9*bw] = K[q][9];
    mem_in[11*bw-1:10*bw] = K[q][10];
    mem_in[12*bw-1:11*bw] = K[q][11];
    mem_in[13*bw-1:12*bw] = K[q][12];
    mem_in[14*bw-1:13*bw] = K[q][13];
    mem_in[15*bw-1:14*bw] = K[q][14];
    mem_in[16*bw-1:15*bw] = K[q][15];

    tick(1);
    qkmem_add = qkmem_add + 1; 
  end
  kmem_wr = 0;  
  tick(4);
///////////////////////////////////////////






/////  K data loading  /////
  $display("##### K data loading to processor #####");
  qkmem_add = 0;
  for (q=0; q<col+1; q=q+1) begin
    load = 1; 
    if (q==1) kmem_rd = 1;
    if (q>1) begin
       qkmem_add = qkmem_add + 1;
    end
    tick(1);
  end

  kmem_rd = 0;
  tick(1);
  load = 0; 
  tick(10);
///////////////////////////////////////////






///// execution  /////
  qkmem_add = 0;
  execute = 1; 
  qmem_rd = 1;
  $display("##### execute #####");
  for (q=0; q<total_cycle; q=q+1) begin

    tick(1);
    qkmem_add = qkmem_add + 1;
  end

  qmem_rd = 0; qkmem_add = 0; execute = 0;
  tick(10);
///////////////////////////////////////////





////////////// output fifo rd and wb to psum mem ///////////////////
  $display("##### move ofifo to pmem #####");
  ofifo_rd = 1; 
  pmem_wr = 1; 
  for (q=0; q<total_cycle; q=q+1) begin
    tick(1);
    pmem_add = pmem_add + 1;

  end

  pmem_wr = 0; ofifo_rd = 0;
  tick(10);
///////////////////////////////////////////


///////////// Read from PMEM and verify results //////////
  $display("##### Reading from pmem #####");
  pmem_rd = 1;
  pmem_add = 0;
  tests_fail = 0;
  for (t=0; t<total_cycle; t=t+1) begin
    tick(1);
    pmem_add = pmem_add + 1;

    $write("Checking cycle %0d's values: ", t);
    for (q=0; q<col; q=q+1) begin
      expected = result[t][col-q-1];
      actual = $signed(mem_out[bw_psum*q +: bw_psum]);
      if (expected == actual) $write("%0d=%0d, ", expected, actual);
      else begin
        $write("\033[31m%0d≠%0d\033[0m, ", expected, actual);
        tests_fail = tests_fail + 1;
      end
    end
    $write("\n");
  end
  pmem_rd = 0;
  if (tests_fail == 0)
    $display("\n[\033[32mPASS\033[0m] All %0d products match their expected values.", total_cycle*col);
  else
    $display("\n[\033[31mFAIL\033[0m] %0d of %0d products did not match their expected values.", tests_fail, total_cycle*col);


  #10 $finish;


end
  integer expected, actual, tests_fail;

endmodule




