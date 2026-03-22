`timescale 1ns / 1ps

// Gate-level dedicated testbench for fullchip.out.v
module gate_tb;

    localparam integer COL = 8;
    localparam integer BW = 8;
    localparam integer PR = 16;
    localparam integer BW_PSUM = 2 * BW + 4;
    localparam integer OFIFO_WAIT_MAX = 4000;

    integer m, n, chunk;

    reg clk0, clk1;
    reg reset0, reset1;
    reg [16:0] inst0, inst1;
    reg [PR*BW-1:0] mem_in0, mem_in1;

    wire [BW_PSUM*COL-1:0] out0, out1;

    integer fd_k, fd_q;
    integer i, j, code, val;
    integer err_count;
    reg [PR*BW-1:0] row_data;

    // Gate-level netlist has fixed widths, so instantiate without parameters.
    fullchip dut (
        .clk0(clk0),
        .clk1(clk1),
        .mem_in0(mem_in0),
        .mem_in1(mem_in1),
        .inst0(inst0),
        .inst1(inst1),
        .reset0(reset0),
        .reset1(reset1),
        .out0(out0),
        .out1(out1)
    );

    initial begin
        clk0 = 1'b0;
        forever #0.5 clk0 = ~clk0;
    end

    initial begin
        clk1 = 1'b0;
        forever #0.2 clk1 = ~clk1;
    end

    task tb_fail;
        input [8*160-1:0] msg;
        begin
            $display("FATAL: %0s", msg);
            $finish;
        end
    endtask

    function has_xz_160;
        input [159:0] value;
        begin
            has_xz_160 = (^value === 1'bx);
        end
    endfunction

    task check_file_open;
        input integer fd;
        input [8*128-1:0] filename;
        begin
            if (fd == 0) begin
                $display("FATAL: cannot open %0s", filename);
                $finish;
            end
        end
    endtask

    task write_kmem0;
        input [3:0] addr;
        input [PR*BW-1:0] data;
        begin
            @(negedge clk0);
            mem_in0 = data;
            inst0 = 17'b0;
            inst0[15:12] = addr;
            inst0[2] = 1'b1;
        end
    endtask

    task write_qmem0;
        input [3:0] addr;
        input [PR*BW-1:0] data;
        begin
            @(negedge clk0);
            mem_in0 = data;
            inst0 = 17'b0;
            inst0[15:12] = addr;
            inst0[4] = 1'b1;
        end
    endtask

    task load_mac_from_kmem0;
        input [3:0] addr;
        begin
            @(negedge clk0);
            inst0 = 17'b0;
            inst0[15:12] = addr;
            inst0[3] = 1'b1;

            @(negedge clk0);
            inst0 = 17'b0;
            inst0[6] = 1'b1;
        end
    endtask

    task exec_mac_from_qmem0;
        input [3:0] addr;
        begin
            @(negedge clk0);
            inst0 = 17'b0;
            inst0[15:12] = addr;
            inst0[5] = 1'b1;

            @(negedge clk0);
            inst0 = 17'b0;
            inst0[7] = 1'b1;
        end
    endtask

    task write_kmem1;
        input [3:0] addr;
        input [PR*BW-1:0] data;
        begin
            @(negedge clk1);
            mem_in1 = data;
            inst1 = 17'b0;
            inst1[15:12] = addr;
            inst1[2] = 1'b1;
        end
    endtask

    task write_qmem1;
        input [3:0] addr;
        input [PR*BW-1:0] data;
        begin
            @(negedge clk1);
            mem_in1 = data;
            inst1 = 17'b0;
            inst1[15:12] = addr;
            inst1[4] = 1'b1;
        end
    endtask

    task load_mac_from_kmem1;
        input [3:0] addr;
        begin
            @(negedge clk1);
            inst1 = 17'b0;
            inst1[15:12] = addr;
            inst1[3] = 1'b1;

            @(negedge clk1);
            inst1 = 17'b0;
            inst1[6] = 1'b1;
        end
    endtask

    task exec_mac_from_qmem1;
        input [3:0] addr;
        begin
            @(negedge clk1);
            inst1 = 17'b0;
            inst1[15:12] = addr;
            inst1[5] = 1'b1;

            @(negedge clk1);
            inst1 = 17'b0;
            inst1[7] = 1'b1;
        end
    endtask

    task wait_ofifo_valid_core0;
        integer wait_guard;
        begin
            wait_guard = 0;
            while (dut.core_instance0.ofifo_inst.o_valid !== 1'b1) begin
                @(negedge clk0);
                wait_guard = wait_guard + 1;
                if (wait_guard >= OFIFO_WAIT_MAX) begin
                    $display("[DBG] core0 ofifo_valid=%b inst0=%b", dut.core_instance0.ofifo_inst.o_valid, inst0);
                    tb_fail("Timeout waiting core0 OFIFO valid before extraction");
                end
            end
        end
    endtask

    task wait_ofifo_valid_core1;
        integer wait_guard;
        begin
            wait_guard = 0;
            while (dut.core_instance1.ofifo_inst.o_valid !== 1'b1) begin
                @(negedge clk1);
                wait_guard = wait_guard + 1;
                if (wait_guard >= OFIFO_WAIT_MAX) begin
                    $display("[DBG] core1 ofifo_valid=%b inst1=%b", dut.core_instance1.ofifo_inst.o_valid, inst1);
                    tb_fail("Timeout waiting core1 OFIFO valid before extraction");
                end
            end
        end
    endtask

    task check_core0_pmem_xz;
        input [8*64-1:0] phase;
        integer idx;
        reg [159:0] word;
        begin
            for (idx = 0; idx < 8; idx = idx + 1) begin
                case (idx)
                    0: word = dut.core_instance0.psum_mem_instance.mem[0];
                    1: word = dut.core_instance0.psum_mem_instance.mem[1];
                    2: word = dut.core_instance0.psum_mem_instance.mem[2];
                    3: word = dut.core_instance0.psum_mem_instance.mem[3];
                    4: word = dut.core_instance0.psum_mem_instance.mem[4];
                    5: word = dut.core_instance0.psum_mem_instance.mem[5];
                    6: word = dut.core_instance0.psum_mem_instance.mem[6];
                    default: word = dut.core_instance0.psum_mem_instance.mem[7];
                endcase

                if (has_xz_160(word)) begin
                    err_count = err_count + 1;
                    $display("[ERR][%0s] CORE0 PMEM[%0d] has X/Z: %h", phase, idx, word);
                end
            end
        end
    endtask

    task check_core1_pmem_xz;
        input [8*64-1:0] phase;
        integer idx;
        reg [159:0] word;
        begin
            for (idx = 0; idx < 8; idx = idx + 1) begin
                case (idx)
                    0: word = dut.core_instance1.psum_mem_instance.mem[0];
                    1: word = dut.core_instance1.psum_mem_instance.mem[1];
                    2: word = dut.core_instance1.psum_mem_instance.mem[2];
                    3: word = dut.core_instance1.psum_mem_instance.mem[3];
                    4: word = dut.core_instance1.psum_mem_instance.mem[4];
                    5: word = dut.core_instance1.psum_mem_instance.mem[5];
                    6: word = dut.core_instance1.psum_mem_instance.mem[6];
                    default: word = dut.core_instance1.psum_mem_instance.mem[7];
                endcase

                if (has_xz_160(word)) begin
                    err_count = err_count + 1;
                    $display("[ERR][%0s] CORE1 PMEM[%0d] has X/Z: %h", phase, idx, word);
                end
            end
        end
    endtask

    task dump_core0_pmem_hex;
        begin
            $display("CORE 0 PMEM (HEX)");
            $display("PMEM Address 0: %h", dut.core_instance0.psum_mem_instance.mem[0]);
            $display("PMEM Address 1: %h", dut.core_instance0.psum_mem_instance.mem[1]);
            $display("PMEM Address 2: %h", dut.core_instance0.psum_mem_instance.mem[2]);
            $display("PMEM Address 3: %h", dut.core_instance0.psum_mem_instance.mem[3]);
            $display("PMEM Address 4: %h", dut.core_instance0.psum_mem_instance.mem[4]);
            $display("PMEM Address 5: %h", dut.core_instance0.psum_mem_instance.mem[5]);
            $display("PMEM Address 6: %h", dut.core_instance0.psum_mem_instance.mem[6]);
            $display("PMEM Address 7: %h", dut.core_instance0.psum_mem_instance.mem[7]);
        end
    endtask

    task dump_core1_pmem_hex;
        begin
            $display("CORE 1 PMEM (HEX)");
            $display("PMEM Address 0: %h", dut.core_instance1.psum_mem_instance.mem[0]);
            $display("PMEM Address 1: %h", dut.core_instance1.psum_mem_instance.mem[1]);
            $display("PMEM Address 2: %h", dut.core_instance1.psum_mem_instance.mem[2]);
            $display("PMEM Address 3: %h", dut.core_instance1.psum_mem_instance.mem[3]);
            $display("PMEM Address 4: %h", dut.core_instance1.psum_mem_instance.mem[4]);
            $display("PMEM Address 5: %h", dut.core_instance1.psum_mem_instance.mem[5]);
            $display("PMEM Address 6: %h", dut.core_instance1.psum_mem_instance.mem[6]);
            $display("PMEM Address 7: %h", dut.core_instance1.psum_mem_instance.mem[7]);
        end
    endtask

    task display_in_decimal0;
        begin
            $display("");
            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance0.psum_mem_instance.mem[0][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance0.psum_mem_instance.mem[1][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance0.psum_mem_instance.mem[2][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance0.psum_mem_instance.mem[3][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance0.psum_mem_instance.mem[4][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance0.psum_mem_instance.mem[5][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance0.psum_mem_instance.mem[6][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance0.psum_mem_instance.mem[7][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");
        end
    endtask

    task display_in_decimal1;
        begin
            $display("");
            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance1.psum_mem_instance.mem[0][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance1.psum_mem_instance.mem[1][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance1.psum_mem_instance.mem[2][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance1.psum_mem_instance.mem[3][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance1.psum_mem_instance.mem[4][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance1.psum_mem_instance.mem[5][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance1.psum_mem_instance.mem[6][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");

            for (n = 7; n >= 0; n = n - 1) begin
                chunk = $signed(dut.core_instance1.psum_mem_instance.mem[7][n*20 +: 20]);
                $write("%d ", chunk);
            end
            $display("");
        end
    endtask

    initial begin
        $dumpfile("gate_out.vcd");
        $dumpvars(0, gate_tb);

        err_count = 0;
        reset0 = 1'b1;
        reset1 = 1'b1;
        inst0 = 17'b0;
        inst1 = 17'b0;
        mem_in0 = {PR*BW{1'b0}};
        mem_in1 = {PR*BW{1'b0}};

        // Hold reset for multiple cycles, then deassert on clock edges to avoid
        // racey gate-level startup around active clock transitions.
        repeat (20) @(posedge clk0);
        @(negedge clk0);
        reset0 = 1'b0;
        @(negedge clk1);
        reset1 = 1'b0;
        repeat (4) @(posedge clk0);

        $display("--- [GATE TB] Start loading SRAM data ---");

        fd_k = $fopen("kdata.txt", "r");
        check_file_open(fd_k, "kdata.txt");
        for (i = 0; i < 8; i = i + 1) begin
            row_data = {PR*BW{1'b0}};
            for (j = 0; j < 8; j = j + 1) begin
                code = $fscanf(fd_k, "%d", val);
                row_data[(j*BW) +: BW] = val[7:0];
            end
            write_kmem0(i[3:0], row_data);
        end
        $fclose(fd_k);

        fd_k = $fopen("kdata.txt", "r");
        check_file_open(fd_k, "kdata.txt");
        for (i = 0; i < 8; i = i + 1) begin
            row_data = {PR*BW{1'b0}};
            for (j = 0; j < 8; j = j + 1) begin
                code = $fscanf(fd_k, "%d", val);
                row_data[(j*BW) +: BW] = val[7:0];
            end
            write_kmem1(i[3:0], row_data);
        end
        $fclose(fd_k);

        fd_q = $fopen("qdata.txt", "r");
        check_file_open(fd_q, "qdata.txt");
        for (i = 0; i < 8; i = i + 1) begin
            row_data = {PR*BW{1'b0}};
            for (j = 0; j < 8; j = j + 1) begin
                code = $fscanf(fd_q, "%d", val);
                row_data[(j*BW) +: BW] = val[7:0];
            end
            write_qmem0(i[3:0], row_data);
        end
        $fclose(fd_q);

        fd_q = $fopen("qdata.txt", "r");
        check_file_open(fd_q, "qdata.txt");
        for (i = 0; i < 8; i = i + 1) begin
            row_data = {PR*BW{1'b0}};
            for (j = 0; j < 8; j = j + 1) begin
                code = $fscanf(fd_q, "%d", val);
                row_data[(j*BW) +: BW] = val[7:0];
            end
            write_qmem1(i[3:0], row_data);
        end
        $fclose(fd_q);

        $display("--- [GATE TB] Start MAC array computation ---");

        for (i = 0; i < 8; i = i + 1) begin
            load_mac_from_kmem0(i[3:0]);
        end
        for (i = 0; i < 8; i = i + 1) begin
            load_mac_from_kmem1(i[3:0]);
        end

        for (i = 0; i < 8; i = i + 1) begin
            exec_mac_from_qmem0(i[3:0]);
        end
        @(negedge clk0);
        inst0 = 17'b0;

        for (i = 0; i < 8; i = i + 1) begin
            exec_mac_from_qmem1(i[3:0]);
        end

        @(negedge clk0);
        inst0 = 17'b0;
        @(negedge clk1);
        inst1 = 17'b0;

        #20;

        $display("--- [GATE TB] Wait OFIFO valid ---");
        wait_ofifo_valid_core0;
        wait_ofifo_valid_core1;

        $display("--- [GATE TB] Extract OFIFO data and store in PMEM ---");
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk0);
            inst0 = 17'b0;
            inst0[16] = 1'b1;
            inst0[0] = 1'b1;
            inst0[11:8] = i[3:0];
        end
        @(negedge clk0);
        inst0 = 17'b0;

        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk1);
            inst1 = 17'b0;
            inst1[16] = 1'b1;
            inst1[0] = 1'b1;
            inst1[11:8] = i[3:0];
        end
        @(negedge clk1);
        inst1 = 17'b0;

        #5;
        $display("PRENORMALIZED RESULTS IN CORE 0!");
        display_in_decimal0;
        $display("PRENORMALIZED RESULTS IN CORE 1!");
        display_in_decimal1;

        check_core0_pmem_xz("prenorm");
        check_core1_pmem_xz("prenorm");

        $display("--- [GATE TB] Start SFP division and automatic write-back ---");
        fork
            begin
                for (i = 0; i < 8; i = i + 1) begin
                    @(negedge clk0);
                    inst0 = 17'b0;
                    inst0[1] = 1'b1;
                    inst0[11:8] = i[3:0];

                    @(negedge clk0);
                    inst0 = 17'b0;
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

            begin
                for (j = 0; j < 8; j = j + 1) begin
                    @(negedge clk1);
                    inst1 = 17'b0;
                    inst1[1] = 1'b1;
                    inst1[11:8] = j[3:0];

                    @(negedge clk1);
                    inst1 = 17'b0;
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

        #20;

        $display("--- [GATE TB] Verify normalization results ---");
        dump_core0_pmem_hex;
        display_in_decimal0;
        dump_core1_pmem_hex;
        display_in_decimal1;

        check_core0_pmem_xz("norm");
        check_core1_pmem_xz("norm");

        if (err_count == 0) begin
            $display("[PASS] gate_tb completed with no X/Z in PMEM results.");
            $finish;
        end else begin
            $display("[FAIL] gate_tb found %0d PMEM words with X/Z.", err_count);
            $finish;
        end
    end

endmodule
