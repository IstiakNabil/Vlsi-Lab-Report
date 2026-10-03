`timescale 1ns / 1ps

module tb_ALU;

    // Inputs to the ALU
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] ALU_Sel;
	 
	 wire [7:0] ALU_Out;
    wire CarryOut;
    wire Zero;
	 ALU #(.WIDTH(8)) uut (
        .A(A), 
        .B(B), 
        .ALU_Sel(ALU_Sel), 
        .ALU_Out(ALU_Out), 
        .CarryOut(CarryOut), 
        .Zero(Zero)
    );
	 initial begin
        // Print a header for the console output
        $display("Time\t A \t B \t Sel\t Out\t C_out\t Zero");
        // Monitor changes and print them to the TCL console
        $monitor("%0t\t %d\t %d\t %b\t %d\t %b\t %b", $time, A, B, ALU_Sel, ALU_Out, CarryOut, Zero);

        // Initialize Inputs
        A = 0;
        B = 0;
        ALU_Sel = 0;
		  
		  #100;
        
        // Test 1: Addition (000)
        A = 8'd15; B = 8'd10; ALU_Sel = 3'b000; #20;
        
        // Test 2: Addition triggering CarryOut (250 + 10 = 260, which exceeds 8-bit max of 255)
        A = 8'd250; B = 8'd10; ALU_Sel = 3'b000; #20;

        // Test 3: Subtraction (001)
        A = 8'd45; B = 8'd15; ALU_Sel = 3'b001; #20;
		  
		  // Test 4: Subtraction triggering Zero Flag (50 - 50 = 0)
        A = 8'd50; B = 8'd50; ALU_Sel = 3'b001; #20;

        // Test 5: Bitwise AND (010)
        A = 8'b10101010; B = 8'b11001100; ALU_Sel = 3'b010; #20;

        // Test 6: Bitwise OR (011)
        A = 8'b10101010; B = 8'b11001100; ALU_Sel = 3'b011; #20;
		  
		  A = 8'b11110000; B = 8'b01010101; ALU_Sel = 3'b100; #20;

        // Test 8: Shift Left (110)
        A = 8'b00001111; B = 8'd0; ALU_Sel = 3'b110; #20;

        // End simulation
        #20;
        $display("Simulation finished.");
        $finish;
    end
    
endmodule