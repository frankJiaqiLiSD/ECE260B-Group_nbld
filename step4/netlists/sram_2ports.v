module sram_2ports (CLK, D_A, CEN_A, WEN_A, A_A, D_B, Q_B, CEN_B, WEN_B, A_B);

    parameter sram_bit = 160;
    parameter width = 16;
    //Port A for ofifo
    input  CLK;
    input  CEN_A;
    input  WEN_A;
    input  [sram_bit-1:0] D_A;
    input  [3:0] A_A;
    //Port B for sfp
    input  CEN_B;
    input  WEN_B;        
    input  [sram_bit-1:0] D_B;
    input  [3:0] A_B;
    output reg [sram_bit-1:0] Q_B;

    // reg [sram_bit-1:0] memory0;
    // reg [sram_bit-1:0] memory1;
    // reg [sram_bit-1:0] memory2;
    // reg [sram_bit-1:0] memory3;
    // reg [sram_bit-1:0] memory4;
    // reg [sram_bit-1:0] memory5;
    // reg [sram_bit-1:0] memory6;
    // reg [sram_bit-1:0] memory7;
    // reg [sram_bit-1:0] memory8;
    // reg [sram_bit-1:0] memory9;
    // reg [sram_bit-1:0] memory10;
    // reg [sram_bit-1:0] memory11;
    // reg [sram_bit-1:0] memory12;
    // reg [sram_bit-1:0] memory13;
    // reg [sram_bit-1:0] memory14;
    // reg [sram_bit-1:0] memory15;
    reg [sram_bit-1:0] mem [0:15];


    always @ (posedge CLK) begin

        if (!CEN_A && WEN_A) begin // read
            // case (A_A)
            //     4'b0000: Q_B <= memory0; 
            //     4'b0001: Q_B <= memory1; 
            //     4'b0010: Q_B <= memory2; 
            //     4'b0011: Q_B <= memory3; 
            //     4'b0100: Q_B <= memory4; 
            //     4'b0101: Q_B <= memory5; 
            //     4'b0110: Q_B <= memory6; 
            //     4'b0111: Q_B <= memory7; 
            //     4'b1000: Q_B <= memory8; 
            //     4'b1001: Q_B <= memory9; 
            //     4'b1010: Q_B <= memory10; 
            //     4'b1011: Q_B <= memory11; 
            //     4'b1100: Q_B <= memory12; 
            //     4'b1101: Q_B <= memory13; 
            //     4'b1110: Q_B <= memory14; 
            //     4'b1111: Q_B <= memory15; 
            // endcase
            Q_B <= mem[A_A];
        end
        else if (!CEN_A && !WEN_A) begin // write
            // case (A_A)
            //     4'b0000: memory0  <= D_A; 
            //     4'b0001: memory1  <= D_A; 
            //     4'b0010: memory2  <= D_A; 
            //     4'b0011: memory3  <= D_A; 
            //     4'b0100: memory4  <= D_A; 
            //     4'b0101: memory5  <= D_A; 
            //     4'b0110: memory6  <= D_A; 
            //     4'b0111: memory7  <= D_A; 
            //     4'b1000: memory8  <= D_A; 
            //     4'b1001: memory9  <= D_A; 
            //     4'b1010: memory10 <= D_A; 
            //     4'b1011: memory11 <= D_A; 
            //     4'b1100: memory12 <= D_A; 
            //     4'b1101: memory13 <= D_A; 
            //     4'b1110: memory14 <= D_A; 
            //     4'b1111: memory15 <= D_A; 
            // endcase
            mem[A_A] <= D_A;
        end        
        // if (!CEN_B && WEN_B) begin // read
        //     case (A_B)
        //         4'b0000: Q_B <= memory0; 
        //         4'b0001: Q_B <= memory1; 
        //         4'b0010: Q_B <= memory2; 
        //         4'b0011: Q_B <= memory3; 
        //         4'b0100: Q_B <= memory4; 
        //         4'b0101: Q_B <= memory5; 
        //         4'b0110: Q_B <= memory6; 
        //         4'b0111: Q_B <= memory7; 
        //         4'b1000: Q_B <= memory8; 
        //         4'b1001: Q_B <= memory9; 
        //         4'b1010: Q_B <= memory10; 
        //         4'b1011: Q_B <= memory11; 
        //         4'b1100: Q_B <= memory12; 
        //         4'b1101: Q_B <= memory13; 
        //         4'b1110: Q_B <= memory14; 
        //         4'b1111: Q_B <= memory15; 
        //     endcase
        // end else 
        else if (!CEN_B && !WEN_B) begin // write
            // case (A_B)
            //     4'b0000: memory0  <= D_B; 
            //     4'b0001: memory1  <= D_B; 
            //     4'b0010: memory2  <= D_B; 
            //     4'b0011: memory3  <= D_B; 
            //     4'b0100: memory4  <= D_B; 
            //     4'b0101: memory5  <= D_B; 
            //     4'b0110: memory6  <= D_B; 
            //     4'b0111: memory7  <= D_B; 
            //     4'b1000: memory8  <= D_B; 
            //     4'b1001: memory9  <= D_B; 
            //     4'b1010: memory10 <= D_B; 
            //     4'b1011: memory11 <= D_B; 
            //     4'b1100: memory12 <= D_B; 
            //     4'b1101: memory13 <= D_B; 
            //     4'b1110: memory14 <= D_B; 
            //     4'b1111: memory15 <= D_B; 
            // endcase
            mem[A_B] <= D_B;
        end
    end
endmodule
