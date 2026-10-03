`timescale 1ns / 1ps

module full_adder_8bit_tb;

    // Inputs
    reg [7:0] A;
    reg [7:0] B;
    reg Cin;

    // Outputs
    wire [7:0] Sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    full_adder_8bit uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .Sum(Sum), 
        .Cout(Cout)
    );
	 
    initial begin
        // Initialize Inputs
        A = 0; B = 0; Cin = 0;
        #100; // Wait 100 ns for global reset to finish
        
        // Case 1: Simple addition without carry (10 + 20 = 30)
        A = 8'd10; B = 8'd20; Cin = 0; #20;

        // Case 2: Addition with Cin (15 + 25 + 1 = 41)
        A = 8'd15; B = 8'd25; Cin = 1; #20;
		  
		  A = 8'h7F; B = 8'h01; Cin = 0; #20;

        // Case 4: Overflow generation (255 + 1 = 256 -> Cout=1, Sum=0)
        A = 8'hFF; B = 8'h01; Cin = 0; #20;

        // Case 5: Maximum sum (255 + 255 + 1 = 511 -> Cout=1, Sum=255)
        A = 8'hFF; B = 8'hFF; Cin = 1; #20;

        // Case 6: Bitwise pattern
        A = 8'hAA; B = 8'h55; Cin = 0; #20;
S		  $finish;
    end
      
endmodule