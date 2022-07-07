`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:12 04/16/2021 
// Design Name: 
// Module Name:    id_ex 
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
module id_ex(
    input clk,
    input rst,
    input RegWrite,
    input ALUOp,
    input [7:0] Data1,
    input [7:0] Data2,
    input [2:0] WriteRegNum,
    output reg ID_EX_RegWrite,
    output reg ID_EX_ALUOp,
    output reg [7:0] ID_EX_Data1,
    output reg [7:0] ID_EX_Data2,
    output reg [2:0] ID_EX_Reg
    );
    
    always @(posedge clk, negedge rst) 
	 begin
        if (rst == 0) begin
            ID_EX_RegWrite <= 0;
            ID_EX_ALUOp <= 0;
            ID_EX_Data1 <= 0;
            ID_EX_Data2 <= 0;
            ID_EX_Reg <= 0;
        end
        else begin
            ID_EX_RegWrite <= RegWrite;
            ID_EX_ALUOp <= ALUOp;
            ID_EX_Data1 <= Data1;
            ID_EX_Data2 <= Data2;
            ID_EX_Reg <= WriteRegNum;
        end
    end
	 
endmodule
