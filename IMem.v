`timescale 1ns / 1ps

module IMem(
	 input [7:0] PC,
    input rst,
    output [7:0] instruc_code
    );
	reg [7:0] Mem [7:0];   // Array of length 36, each element 1 byte

	assign instruc_code = Mem[PC]; //assigning instruction code as address of PC
	
	always @(rst)
	begin
		if (rst == 0) begin
		  Mem[0] = 8'b00011011; // li R3,3
		  Mem[1] = 8'b01011010; // addi R3,2
		  Mem[2] = 8'b01010011; // addi R2,3
		  Mem[3] = 8'b11000001; // j L1	
		  Mem[4] = 8'b00011100; // li R3,4
		  Mem[5] = 8'b01011101; // L1: addi R3,-3
		end
	end
endmodule