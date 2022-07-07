`timescale 1ns / 1ps

module processor(
		input clk,
		input rst
    );

	wire [7:0] RegA, Imm, ID_EX_RegA, ID_EX_Imm;
	wire [7:0] instruc_code, IF_ID_instr;
	wire [7:0] ALURes, EX_WB_ALURes;
	wire RegWrite, ID_EX_RegWrite, EX_WB_RegWrite;
	wire ALUOp, ID_EX_ALUOp;
	wire PC_control; 
	wire [2:0] ID_EX_Reg, EX_WB_Reg;
	wire ForwardSignal;

	IFetch M1(clk, rst, instruc_code);
	
	if_id M2(clk, rst, instruc_code, IF_ID_instr);
	
	Rfile M3(IF_ID_instr[7:0],IF_ID_instr[5:3], EX_WB_Reg, EX_WB_ALURes, clk, EX_WB_RegWrite, rst, RegA);
	
	control M4(IF_ID_instr[7:6], ALUOp, RegWrite, PC_control);
	
	SignExtend M5(IF_ID_instr, Imm);
	
	id_ex M6(clk, rst, RegWrite, ALUOp, RegA, Imm, IF_ID_instr[5:3], ID_EX_RegWrite, ID_EX_ALUOp, 
                         ID_EX_RegA, ID_EX_Imm, ID_EX_Reg);
                         
	ALU_Block M7(ID_EX_RegA, EX_WB_ALURes, ID_EX_Imm, ForwardSignal, ID_EX_ALUOp, ALURes);
	
	ex_wb M8(clk, rst, ID_EX_RegWrite, ID_EX_Reg, ALURes, EX_WB_RegWrite, EX_WB_Reg, 
                        EX_WB_ALURes);
								
   forwardingunit M9(clk, EX_WB_Reg, ID_EX_Reg, ForwardSignal);

endmodule
