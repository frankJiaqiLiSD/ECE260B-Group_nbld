`timescale 1ns / 1ps
//por mineyrose
module dual_tb;

    parameter col = 8;
    parameter bw = 8;
    parameter bw_psum = 2*bw+4;
    parameter pr = 16;
    
    integer m, n, chunk;
    reg clk0, clk1;
    reg reset0, reset1;
    reg [16:0] inst0, inst1;
    reg [pr*bw-1:0] mem_in0, mem_in1;

    wire [bw_psum+3:0] sum_out0, sum_out1;
    wire [bw_psum*col-1:0] out0, out1;

    // Instantiate top-level dual core
    fullchip #(.col(col), .bw(bw), .bw_psum(bw_psum), .pr(pr) ) dut (
        
        .clk0(clk0), .clk1(clk1),
        .mem_in0(mem_in0), .mem_in1(mem_in1),
        .out0(out0), .out1(out1),
        .inst0(inst0), .inst1(inst1),
        .reset0(reset0), .reset1(reset1)
    
    );
    
    // ==========================================
    // Clock generation (1GHz -> 1ns period)
    // ==========================================
    
    always #0.5 clk0 = ~clk0;
    // display in decimal
    // ==========================================
    // Helper Tasks: Simplify instruction dispatch
    // ==========================================
    task write_kmem0(input [3:0] addr, input [pr*bw-1:0] data);
        begin
            @(negedge clk0);
            mem_in0 = data;
            inst0 = 17'b0;
            inst0[15:12] = addr;
            inst0[2]     = 1'b1; // kmem_wr
        end
    endtask

    task write_qmem0(input [3:0] addr, input [pr*bw-1:0] data);
        begin
            @(negedge clk0);
            mem_in0 = data;
            inst0 = 17'b0;
            inst0[15:12] = addr;
            inst0[4]     = 1'b1; // qmem_wr
        end
    endtask

    task load_mac_from_kmem0(input [3:0] addr);
        begin
            // Cycle 1: Issue read instruction only, address SRAM
            @(negedge clk0);
            inst0 = 17'b0;
            inst0[15:12] = addr;
            inst0[3]     = 1'b1; // kmem_rd

            // Cycle 2: Data is stable at kmem_out!
            // Toggle MUX to select K, and send Load instruction to MAC array
            @(negedge clk0);
            inst0 = 17'b0;
            inst0[6]     = 1'b1; // mac_in selects K, trigger MAC load
        end
    endtask

    task exec_mac_from_qmem0(input [3:0] addr);
        begin
            // Cycle 1: Issue read instruction only
            @(negedge clk0);
            inst0 = 17'b0;
            inst0[15:12] = addr;
            inst0[5]     = 1'b1; // qmem_rd

            // Cycle 2: Data is stable at qmem_out!
            // Toggle MUX to select Q (inst[6]=0), and send Execute instruction to MAC
            @(negedge clk0);
            inst0 = 17'b0;
            inst0[7]     = 1'b1; // Trigger MAC Execute
        end
    endtask


    // ==========================================
    // Helper Tasks: Simplify instruction dispatch for core1 !
    // ==========================================
    task write_kmem1(input [3:0] addr, input [pr*bw-1:0] data);
        begin
            @(negedge clk1);
            mem_in1 = data;
            inst1 = 17'b0;
            inst1[15:12] = addr;
            inst1[2]     = 1'b1; // kmem_wr
        end
    endtask

    task write_qmem1(input [3:0] addr, input [pr*bw-1:0] data);
        begin
            @(negedge clk1);
            mem_in1 = data;
            inst1 = 17'b0;
            inst1[15:12] = addr;
            inst1[4]     = 1'b1; // qmem_wr
        end
    endtask

    task load_mac_from_kmem1(input [3:0] addr);
        begin
            // Cycle 1: Issue read instruction only, address SRAM
            @(negedge clk1);
            inst1 = 17'b0;
            inst1[15:12] = addr;
            inst1[3]     = 1'b1; // kmem_rd

            // Cycle 2: Data is stable at kmem_out!
            // Toggle MUX to select K, and send Load instruction to MAC array
            @(negedge clk1);
            inst1 = 17'b0;
            inst1[6]     = 1'b1; // mac_in selects K, trigger MAC load
        end
    endtask

    task exec_mac_from_qmem1(input [3:0] addr);
        begin
            // Cycle 1: Issue read instruction only
            @(negedge clk1);
            inst1 = 17'b0;
            inst1[15:12] = addr;
            inst1[5]     = 1'b1; // qmem_rd

            // Cycle 2: Data is stable at qmem_out!
            // Toggle MUX to select Q (inst[6]=0), and send Execute instruction to MAC
            @(negedge clk1);
            inst1 = 17'b0;
            inst1[7]     = 1'b1; // Trigger MAC Execute
        end
    endtask

    // ==========================================
    // Main test flow
    // ==========================================
    integer fd_k, fd_q;
    integer i, j, code;
    integer val;
    reg [pr*bw-1:0] row_data;

    initial begin
         clk0 = 0; clk1 = 0;

        #0.0; //phase offset
        forever #0.2 clk1=~clk1;
    end
    initial begin

    $dumpfile("out.vcd");
    $dumpvars(0, dual_tb);
        // 1. Initialization
        reset0 = 1; reset1 = 1;
        inst0 = 0; inst1 = 0;
        mem_in0 = 0; mem_in1 = 0;
        #2.5; // Offset from clock rising edge
        reset0 = 0; reset1 = 0;

        $display("--- Start loading SRAM data ---");
        
        // 2a. Read kdata.txt into kmem0
        fd_k = $fopen("kdata.txt", "r");
        for (i = 0; i < 8; i = i + 1) begin
            row_data = 0; // Zero-pad high bits automatically (since pr=16, data only has 8 columns)
            for (j = 0; j < 8; j = j + 1) begin
                code = $fscanf(fd_k, "%d", val);
                row_data[(j*bw) +: bw] = val[7:0];
            end
            write_kmem0(i, row_data);
        end
        $fclose(fd_k);

        // 2b. Read kdata.txt into kmem1
        fd_k = $fopen("kdata.txt", "r");
        for (i = 0; i < 8; i = i + 1) begin
            row_data = 0; // Zero-pad high bits automatically (since pr=16, data only has 8 columns)
            for (j = 0; j < 8; j = j + 1) begin
                code = $fscanf(fd_k, "%d", val);
                row_data[(j*bw) +: bw] = val[7:0];
            end
            write_kmem1(i, row_data);
        end
        $fclose(fd_k);

        // 3a. Read qdata.txt into qmem0
        fd_q = $fopen("qdata.txt", "r");
        for (i = 0; i < 8; i = i + 1) begin
            row_data = 0;
            for (j = 0; j < 8; j = j + 1) begin
                code = $fscanf(fd_q, "%d", val);
                row_data[(j*bw) +: bw] = val[7:0];
            end
            write_qmem0(i, row_data);
        end
        $fclose(fd_q);


        // 3b. Read qdata.txt into qmem1
        fd_q = $fopen("qdata.txt", "r");
        for (i = 0; i < 8; i = i + 1) begin
            row_data = 0;
            for (j = 0; j < 8; j = j + 1) begin
                code = $fscanf(fd_q, "%d", val);
                row_data[(j*bw) +: bw] = val[7:0];
            end
            write_qmem1(i, row_data);
        end
        $fclose(fd_q);

        $display("--- Start MAC array computation ---");
        
        // 4. Load K into MAC array 0,1
        for (i = 0; i < 8; i = i + 1) begin
            load_mac_from_kmem0(i);
        end
        
	for (i = 0; i < 8; i = i + 1) begin
            load_mac_from_kmem1(i);
        end
  
        // 5. Send Q into MAC array for multiply-accumulate (Execute) 0,1
        for (i = 0; i < 8; i = i + 1) begin
            exec_mac_from_qmem0(i);
        end
    
        @(negedge clk0); //EXECUTE THE FINAL VECTOR	
	inst0 = 0; //TURN OF CORE0 INSTRUCTIONS

        for (i = 0; i < 8; i = i + 1) begin
            exec_mac_from_qmem1(i);
        end


        // Stop issuing instructions, wait for MAC array to finish computation and push results to OFIFO
        @(negedge clk0);
        inst0 = 17'b0;
       	@(negedge clk1);
        inst1 = 17'b0;
        #20; // Wait for the inherent latency of the systolic array

        $display("--- Extract OFIFO data and store in PMEM ---");
        
        // 6. Read OFIFO data, store in PMEM, and trigger SFP addition simultaneously
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk0); // Added here!
            inst0 = 17'b0;
            inst0[16]    = 1'b1; // ofifo_rd (pop data)
            inst0[0]     = 1'b1; // pmem_wr (write raw data)
            inst0[11:8]  = i;    // pmem_add

        end

         @(negedge clk0) inst0 = 17'b0;
        inst0 = 17'b0;

        for(i = 0; i < 8; i = i + 1) begin
            @(negedge clk1); // Added here!
            inst1 = 17'b0;
            inst1[16]    = 1'b1; // ofifo_rd (pop data)
            inst1[0]     = 1'b1; // pmem_wr (write raw data)
            inst1[11:8]  = i;    // pmem_add
        end

         @(negedge clk1) inst1 = 17'b0;
        inst1 = 17'b0;
                       
        // Wait for SFP internal FIFO to safely store the last few Sums
        #5;
        $display("PRENORMALIZED RESULTS IN CORE 0!");	
        display_in_decimal0();
	$display("PRENORMALIZED RESULTS IN CORE 1!");
	display_in_decimal1();

        $display("--- Start SFP division and automatic write-back ---");
        
        // 7. Issue PMEM read instruction, trigger SFP normalization, and rely on 2-cycle delay line for automatic in-place write-back!
        
	fork
	    //thread for core0
            begin
              for (i = 0; i < 8; i = i + 1) begin
                @(negedge clk0);
                inst0 = 17'b0;
                inst0[1]     = 1'b1; // pmem_rd (read raw data, trigger div)
                inst0[11:8]  = i;    // Read address
           
                @(negedge clk0) inst0 = 17'b0; 
                @(negedge clk0);
		@(negedge clk0);
		@(negedge clk0);
		@(negedge clk0);
		@(negedge clk0);
		@(negedge clk0);
		@(negedge clk0);
		@(negedge clk0);
        end

  
	    end

	    //thread for core1
	    begin
                for (j = 0; j < 8; j = j + 1) begin
                    @(negedge clk1);
                    inst1 = 17'b0;
                    inst1[1]     = 1'b1; // pmem_rd (read raw data, trigger div)
                    inst1[11:8]  = j;    // Read address
   
	            @(negedge clk1) inst1 = 17'b0;
		    @(negedge clk1);
		    @(negedge clk1);
		    @(negedge clk1);
		    @(negedge clk1);
                    @(negedge clk1);
		    @(negedge clk1);
		    @(negedge clk1);
		    @(negedge clk1);


                end


            end
        join
	        // Wait for the last batch of data to pass through the 2-cycle delay line and complete write-back to SRAM
        #30;

        $display("--- Verify normalization results (PMEM read) ---");
        
        // 8. Re-read PMEM, view final results in waveform and console
        $display("CORE 0 NORMALIZED RESULTS!");
       	$display("PMEM Address 0: %h", dut.core_instance0.psum_mem_instance.mem[0]);
        $display("PMEM Address 1: %h", dut.core_instance0.psum_mem_instance.mem[1]);
        $display("PMEM Address 2: %h", dut.core_instance0.psum_mem_instance.mem[2]);
        $display("PMEM Address 3: %h", dut.core_instance0.psum_mem_instance.mem[3]);
        $display("PMEM Address 4: %h", dut.core_instance0.psum_mem_instance.mem[4]);
        $display("PMEM Address 5: %h", dut.core_instance0.psum_mem_instance.mem[5]);
        $display("PMEM Address 6: %h", dut.core_instance0.psum_mem_instance.mem[6]);
        $display("PMEM Address 7: %h", dut.core_instance0.psum_mem_instance.mem[7]);
      
	display_in_decimal0();


        $display("CORE 1 NORMALIZED RESULTS!");
	$display("PMEM Address 0: %h", dut.core_instance1.psum_mem_instance.mem[0]);
        $display("PMEM Address 1: %h", dut.core_instance1.psum_mem_instance.mem[1]);
        $display("PMEM Address 2: %h", dut.core_instance1.psum_mem_instance.mem[2]);
        $display("PMEM Address 3: %h", dut.core_instance1.psum_mem_instance.mem[3]);
        $display("PMEM Address 4: %h", dut.core_instance1.psum_mem_instance.mem[4]);
        $display("PMEM Address 5: %h", dut.core_instance1.psum_mem_instance.mem[5]);
        $display("PMEM Address 6: %h", dut.core_instance1.psum_mem_instance.mem[6]);
        $display("PMEM Address 7: %h", dut.core_instance1.psum_mem_instance.mem[7]);
        
        display_in_decimal1();      

        $display("--- End of simulation ---");
        #10 $finish;
    end

    task display_in_decimal1();
	    begin
	   
            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance1.psum_mem_instance.mem[0][n*20 +: 20]); 
	        $write("%d ", chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed( dut.core_instance1.psum_mem_instance.mem[1][n*20 +: 20]); 
	        $write("%d ", chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance1.psum_mem_instance.mem[2][n*20 +: 20]); 
	        $write("%d ",chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance1.psum_mem_instance.mem[3][n*20 +: 20]); 
	        $write("%d ",chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance1.psum_mem_instance.mem[4][n*20 +: 20]);
	        $write("%d ",chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance1.psum_mem_instance.mem[5][n*20 +: 20]);
	        $write("%d ",chunk);
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance1.psum_mem_instance.mem[6][n*20 +: 20]);
	        $write("%d ", chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance1.psum_mem_instance.mem[7][n*20 +: 20]);
	        $write("%d ",chunk );
	    end

            $display("");

	    end
    endtask



    task display_in_decimal0();
	    begin
	   
            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance0.psum_mem_instance.mem[0][n*20 +: 20]); 
	        $write("%d ", chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed( dut.core_instance0.psum_mem_instance.mem[1][n*20 +: 20]); 
	        $write("%d ", chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance0.psum_mem_instance.mem[2][n*20 +: 20]); 
	        $write("%d ",chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance0.psum_mem_instance.mem[3][n*20 +: 20]); 
	        $write("%d ",chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance0.psum_mem_instance.mem[4][n*20 +: 20]);
	        $write("%d ",chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance0.psum_mem_instance.mem[5][n*20 +: 20]);
	        $write("%d ",chunk);
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance0.psum_mem_instance.mem[6][n*20 +: 20]);
	        $write("%d ", chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.core_instance0.psum_mem_instance.mem[7][n*20 +: 20]);
	        $write("%d ",chunk );
	    end

            $display("");

	    end
    endtask



endmodule
