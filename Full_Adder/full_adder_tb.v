`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:49:45 09/24/2026
// Design Name:   full_adder
// Module Name:   /home/ise/VLSI_LAB/Full_Adder/full_adder_tb.v
// Project Name:  Full_Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: full_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module full_adder_tb;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	full_adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0; b = 0; cin = 0;
		#20;
        
		a = 0; b = 0; cin = 1;
		#20;
        
		a = 0; b = 1; cin = 0;
		#20;
        
		a = 0; b = 1; cin = 1;
		#20;
        
		a = 1; b = 0; cin = 0;
		#20;
        
		a = 1; b = 0; cin = 1;
		#20;
        
		a = 1; b = 1; cin = 0;
		#20;
        
		a = 1; b = 1; cin = 1;
		#20;
        
		$finish;
	end
      
endmodule

