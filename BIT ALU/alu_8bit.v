// ============================================================
// 8-Bit Arithmetic Logic Unit (ALU)
// Verilog HDL
// ============================================================

module alu_8bit (
    input  wire [7:0] A,
    input  wire [7:0] B,
    input  wire [2:0] ALU_Sel,

    output reg  [7:0] ALU_Out,
    output reg        Carry,
    output wire       Zero
);

    always @(*) begin

        // Default values
        ALU_Out = 8'b0;
        Carry   = 1'b0;

        case (ALU_Sel)

            // Addition
            3'b000: begin
                {Carry, ALU_Out} = A + B;
            end

            // Subtraction
            3'b001: begin
                ALU_Out = A - B;
                Carry   = (A < B);
            end

            // AND
            3'b010: begin
                ALU_Out = A & B;
            end

            // OR
            3'b011: begin
                ALU_Out = A | B;
            end

            // XOR
            3'b100: begin
                ALU_Out = A ^ B;
            end

            // NOT A
            3'b101: begin
                ALU_Out = ~A;
            end

            // Shift Left
            3'b110: begin
                ALU_Out = A << 1;
            end

            // Shift Right
            3'b111: begin
                ALU_Out = A >> 1;
            end

            default: begin
                ALU_Out = 8'b0;
                Carry   = 1'b0;
            end

        endcase

    end

    // Zero flag
    assign Zero = (ALU_Out == 8'b0);

endmodule