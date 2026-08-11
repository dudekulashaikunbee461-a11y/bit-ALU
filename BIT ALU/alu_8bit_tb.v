// ============================================================
// Testbench for 8-Bit ALU
// ============================================================

`timescale 1ns/1ps

module alu_8bit_tb;

    reg  [7:0] A;
    reg  [7:0] B;
    reg  [2:0] ALU_Sel;

    wire [7:0] ALU_Out;
    wire       Carry;
    wire       Zero;

    // Instantiate ALU
    alu_8bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .Carry(Carry),
        .Zero(Zero)
    );

    // Generate waveform
    initial begin
        $dumpfile("alu_waveform.vcd");
        $dumpvars(0, alu_8bit_tb);
    end

    initial begin

        // A = 10, B = 5
        A = 8'd10;
        B = 8'd5;

        // Addition: 10 + 5 = 15
        ALU_Sel = 3'b000;
        #10;

        // Subtraction: 10 - 5 = 5
        ALU_Sel = 3'b001;
        #10;

        // AND: 10 & 5 = 0
        ALU_Sel = 3'b010;
        #10;

        // OR: 10 | 5 = 15
        ALU_Sel = 3'b011;
        #10;

        // XOR: 10 ^ 5 = 15
        ALU_Sel = 3'b100;
        #10;

        // NOT A
        ALU_Sel = 3'b101;
        #10;

        // Shift Left A
        ALU_Sel = 3'b110;
        #10;

        // Shift Right A
        ALU_Sel = 3'b111;
        #10;

        // Test addition with carry
        A = 8'd255;
        B = 8'd1;
        ALU_Sel = 3'b000;
        #10;

        // Test zero result
        A = 8'd10;
        B = 8'd10;
        ALU_Sel = 3'b001;
        #10;

        $finish;

    end

    // Display results
    initial begin
        $monitor(
            "Time=%0t | A=%0d | B=%0d | Sel=%b | Out=%0d | Carry=%b | Zero=%b",
            $time,
            A,
            B,
            ALU_Sel,
            ALU_Out,
            Carry,
            Zero
        );
    end

endmodule