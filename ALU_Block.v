`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:55 04/16/2021 
// Design Name: 
// Module Name:    ALU_Block 
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
module ALU_Block(
   input [7:0] A,
    input [7:0] ForwardA,
    input [7:0] B,
    input ForwardSignal,
    input ctrl,
    output reg [7:0] result
    );
    
	always @(*) begin
        case (ctrl)
        0: begin
            result <= B; 
        end
        
        1: begin
            if (ForwardSignal == 1'b0) 
                result <= A + B;
            else
                result <= ForwardA + B;
        end
        endcase
	end 
endmodule
