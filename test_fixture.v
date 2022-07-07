`timescale 1ns / 1ps

module test_fixture;

	// Inputs
	reg clk;
	reg rst;

	// Instantiate the Unit Under Test (UUT)
	processor uut (
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// reset
		rst = 0;
		#10
		rst = 1;
	end
	
	initial begin
		// Clock
		clk = 0;
		#20;
		repeat(20)
		begin
			#15;
			clk = ~clk;
		end
		$finish;
	end
      
endmodule



