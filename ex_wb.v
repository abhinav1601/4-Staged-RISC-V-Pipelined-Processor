`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:54 04/16/2021 
// Design Name: 
// Module Name:    ex_wb 
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
module ex_wb(
   input clk,
    input rst,
    input ID_EX_RegWrite,
    input [2:0] ID_EX_Reg,
    input [7:0] ALUResult,
    output reg EX_WB_RegWrite,
    output reg [2:0] EX_WB_Reg,
    output reg [7:0] EX_WB_ALUResult
    );
    
    always @(posedge clk, negedge rst) begin
        if (rst == 0) begin
           EX_WB_RegWrite <= 0;
           EX_WB_Reg <= 0;
           EX_WB_ALUResult <= 0;
        end
        else begin
            EX_WB_RegWrite <= ID_EX_RegWrite;
            EX_WB_Reg <= ID_EX_Reg;
            EX_WB_ALUResult <= ALUResult;
        end
    end
endmodule
