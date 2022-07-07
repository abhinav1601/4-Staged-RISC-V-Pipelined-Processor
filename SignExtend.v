`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:03 04/16/2021 
// Design Name: 
// Module Name:    SignExtend 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module SignExtend(
input [7:0] instruc_code,
    output reg [7:0] ImmValue
    );
    
    always @(instruc_code)
	 begin
        if (instruc_code[7:6] == 2'b01) // addi
			  begin 
					if (instruc_code[2] == 0) 
							  ImmValue = {5'b00000, instruc_code[2:0]};
					else
							  ImmValue = {5'b11111, instruc_code[2:0]};
				end
        else 
			  begin
            
            if (instruc_code[7:6] == 2'b00)  // li
                if (instruc_code[2] == 0) 
                    ImmValue = {5'b00000, instruc_code[2:0]};
                else
                    ImmValue = {5'b11111, instruc_code[2:0]};
            else if (instruc_code[7:6] == 2'b11) 
                if (instruc_code[5] == 0)
                    ImmValue = {2'b00, instruc_code[2:0]};
                else
                    ImmValue = {2'b11, instruc_code[2:0]};
           end
    end
endmodule
