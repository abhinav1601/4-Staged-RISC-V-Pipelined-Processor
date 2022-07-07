`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:02 04/16/2021 
// Design Name: 
// Module Name:    Rfile 
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
module Rfile(
   input [7:0] instrcode,
    input [2:0] ReadReg,
    input [2:0] WriteReg,
    input [7:0] WriteData,
    input clk,
    input RegWrite,
	input rst,
	output reg [7:0] ReadData
	);

	reg [7:0] RegData [7:0];
	always@*
	begin
		ReadData = RegData[ReadReg];
	end
	//assign ReadData = RegData[ReadReg];

	always @(posedge clk, negedge rst) begin
		if (rst == 0) begin
			RegData[0] = 0;
			RegData[1] = 1;
			RegData[2] = 2;
			RegData[3] = 3;
			RegData[4] = 4;
			RegData[5] = 5;
			RegData[6] = 6;
			RegData[7] = 7;
		end
		else if (RegWrite == 1) begin
			RegData[WriteReg] = WriteData;
		end
	end


endmodule
