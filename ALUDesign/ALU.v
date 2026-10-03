`timescale 1ns / 1ps

module ALU #(parameter WIDTH = 8) (
    input  wire [WIDTH-1:0] A,        // Operand A
    input  wire [WIDTH-1:0] B,        // Operand B
    input  wire [2:0]       ALU_Sel,  // Operation selector
    output reg  [WIDTH-1:0] ALU_Out,  // ALU result
    output reg              CarryOut, // Carry out flag
    output wire             Zero      // Zero flag
);

	always @(*) begin
        CarryOut = 1'b0; // Default carry state
        
        case(ALU_Sel)
            3'b000: {CarryOut, ALU_Out} = A + B;       // Addition
            3'b001: ALU_Out = A - B;                   // Subtraction
            3'b010: ALU_Out = A & B;                   // Logical AND
            3'b011: ALU_Out = A | B;                   // Logical OR
            3'b100: ALU_Out = A ^ B;                   // Logical XOR
				3'b101: ALU_Out = ~(A | B);                // Logical NOR
            3'b110: ALU_Out = A << 1;                  // Shift Left by 1
            3'b111: ALU_Out = A >> 1;                  // Shift Right by 1
            default: ALU_Out = {WIDTH{1'b0}};          // Default to 0
			endcase
    end

    // The Zero flag goes high when all bits of ALU_Out are 0
    assign Zero = (ALU_Out == {WIDTH{1'b0}});

endmodule