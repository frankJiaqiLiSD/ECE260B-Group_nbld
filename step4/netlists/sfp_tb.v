`timescale 1ns / 1ps

module core_tb;

    parameter col = 8;
    parameter bw = 8;
    parameter bw_psum = 2*bw+4;
    parameter pr = 16;
    
    integer m, n, chunk;
    reg clk;
    reg reset;
    reg [16:0] inst;
    reg [pr*bw-1:0] mem_in;

    wire [bw_psum+3:0] sum_out;
    wire [bw_psum*col-1:0] out;

    // Instantiate top-level Core
    core #(.col(col), .bw(bw), .bw_psum(bw_psum), .pr(pr)) dut (
        .clk(clk),
        .sum_out(sum_out),
        .mem_in(mem_in),
        .out(out),
        .inst(inst),
        .reset(reset)
    );

    // ==========================================
    // Clock generation (1GHz -> 1ns period)
    // ==========================================
    always #0.5 clk = ~clk;

    // display in decimal

    task display_in_decimal();
	    begin
	   
            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.psum_mem_instance.mem[0][n*20 +: 20]); 
	        $write("%d ", chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed( dut.psum_mem_instance.mem[1][n*20 +: 20]); 
	        $write("%d ", chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.psum_mem_instance.mem[2][n*20 +: 20]); 
	        $write("%d ",chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.psum_mem_instance.mem[3][n*20 +: 20]); 
	        $write("%d ",chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.psum_mem_instance.mem[4][n*20 +: 20]); 
	        $write("%d ",chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.psum_mem_instance.mem[5][n*20 +: 20]); 
	        $write("%d ",chunk);
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.psum_mem_instance.mem[6][n*20 +: 20]); 
	        $write("%d ", chunk );
	    end


            $display("");
	    for(n = 7; n >= 0; n = n - 1) begin
	        chunk = $signed(dut.psum_mem_instance.mem[7][n*20 +: 20]); 
	        $write("%d ",chunk );
	    end



	    end
    endtask

    // ==========================================
    // Helper Tasks: Simplify instruction dispatch
    // ==========================================
    task write_kmem(input [3:0] addr, input [pr*bw-1:0] data);
        begin
            @(negedge clk);
            mem_in = data;
            inst = 17'b0;
            inst[15:12] = addr;
            inst[2]     = 1'b1; // kmem_wr
        end
    endtask

    task write_qmem(input [3:0] addr, input [pr*bw-1:0] data);
        begin
            @(negedge clk);
            mem_in = data;
            inst = 17'b0;
            inst[15:12] = addr;
            inst[4]     = 1'b1; // qmem_wr
        end
    endtask

    task load_mac_from_kmem(input [3:0] addr);
        begin
            // Cycle 1: Issue read instruction only, address SRAM
            @(negedge clk);
            inst = 17'b0;
            inst[15:12] = addr;
            inst[3]     = 1'b1; // kmem_rd

            // Cycle 2: Data is stable at kmem_out!
            // Toggle MUX to select K, and send Load instruction to MAC array
            @(negedge clk);
            inst = 17'b0;
            inst[6]     = 1'b1; // mac_in selects K, trigger MAC load
        end
    endtask

    task exec_mac_from_qmem(input [3:0] addr);
        begin
            // Cycle 1: Issue read instruction only
            @(negedge clk);
            inst = 17'b0;
            inst[15:12] = addr;
            inst[5]     = 1'b1; // qmem_rd

            // Cycle 2: Data is stable at qmem_out!
            // Toggle MUX to select Q (inst[6]=0), and send Execute instruction to MAC
            @(negedge clk);
            inst = 17'b0;
            inst[7]     = 1'b1; // Trigger MAC Execute
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

    $dumpfile("out.vcd");
    $dumpvars(0, core_tb);
        // 1. Initialization
        clk = 0;
        reset = 1;
        inst = 0;
        mem_in = 0;
        #2.5; // Offset from clock rising edge
        reset = 0;

        $display("--- Start loading SRAM data ---");
        
        // 2. Read kdata.txt into kmem
        fd_k = $fopen("kdata.txt", "r");
        for (i = 0; i < 8; i = i + 1) begin
            row_data = 0; // Zero-pad high bits automatically (since pr=16, data only has 8 columns)
            for (j = 0; j < 8; j = j + 1) begin
                code = $fscanf(fd_k, "%d", val);
                row_data[(j*bw) +: bw] = val[7:0];
            end
            write_kmem(i, row_data);
        end
        $fclose(fd_k);

        // 3. Read qdata.txt into qmem
        fd_q = $fopen("qdata.txt", "r");
        for (i = 0; i < 8; i = i + 1) begin
            row_data = 0;
            for (j = 0; j < 8; j = j + 1) begin
                code = $fscanf(fd_q, "%d", val);
                row_data[(j*bw) +: bw] = val[7:0];
            end
            write_qmem(i, row_data);
        end
        $fclose(fd_q);

        $display("--- Start MAC array computation ---");
        
        // 4. Load K into MAC array
        for (i = 0; i < 8; i = i + 1) begin
            load_mac_from_kmem(i);
        end

        // 5. Send Q into MAC array for multiply-accumulate (Execute)
        for (i = 0; i < 8; i = i + 1) begin
            exec_mac_from_qmem(i);
        end

        // Stop issuing instructions, wait for MAC array to finish computation and push results to OFIFO
        @(negedge clk);
        inst = 17'b0;
        #20; // Wait for the inherent latency of the systolic array

        $display("--- Extract OFIFO data and store in PMEM ---");
        
        // 6. Read OFIFO data, store in PMEM, and trigger SFP addition simultaneously
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk); // Added here!
            inst = 17'b0;
            inst[16]    = 1'b1; // ofifo_rd (pop data)
            inst[0]     = 1'b1; // pmem_wr (write raw data)
            inst[11:8]  = i;    // pmem_add
        end
         @(negedge clk) inst = 17'b0;
        inst = 17'b0;
                
        // Wait for SFP internal FIFO to safely store the last few Sums
        #5; 
        display_in_decimal();
        $display("--- Start SFP division and automatic write-back ---");
        
        // 7. Issue PMEM read instruction, trigger SFP normalization, and rely on 2-cycle delay line for automatic in-place write-back!
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk);
            inst = 17'b0;
            inst[1]     = 1'b1; // pmem_rd (read raw data, trigger div)
            inst[11:8]  = i;    // Read address
        
            @(negedge clk) inst = 17'b0;
            @(negedge clk); 
            @(negedge clk); 
            @(negedge clk);
        end
        // Wait for the last batch of data to pass through the 2-cycle delay line and complete write-back to SRAM
        #20;

        $display("--- Verify normalization results (PMEM read) ---");
        
        // 8. Re-read PMEM, view final results in waveform and console
        $display("PMEM Address 0: %h", dut.psum_mem_instance.mem[0]);
        $display("PMEM Address 1: %h", dut.psum_mem_instance.mem[1]);
        $display("PMEM Address 2: %h", dut.psum_mem_instance.mem[2]);
        $display("PMEM Address 3: %h", dut.psum_mem_instance.mem[3]);
        $display("PMEM Address 4: %h", dut.psum_mem_instance.mem[4]);
        $display("PMEM Address 5: %h", dut.psum_mem_instance.mem[5]);
        $display("PMEM Address 6: %h", dut.psum_mem_instance.mem[6]);
        $display("PMEM Address 7: %h", dut.psum_mem_instance.mem[7]);
        
        display_in_decimal();

        $display("--- End of simulation ---");
        #10 $finish;
    end

endmodule
