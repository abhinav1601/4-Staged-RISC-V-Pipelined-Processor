`timescale 1ns / 1ps

module IFetch(
    input clk,
    input rst,
    output [7:0] instruc_code
    );
	reg [7:0] PC;
	
	IMem m1(PC, rst, instruc_code);
	
	always @(posedge clk, negedge rst)
	begin
        if (rst == 0)
            PC <= 0;
        else 
              if (instruc_code[7:6] == 2'b11)
                  if (instruc_code[5] == 0) 
                   PC <= PC + 1 + {2'b00, instruc_code[5:0]}; //jump instruction with sign extend in case of 0
                  else
                   PC <= PC + 1 + {2'b11, instruc_code[5:0]}; //jump instruction with sign extend in case of 1
              else	      
                  PC <= PC + 1; //excluding jump instruction
	end
	
endmodule
