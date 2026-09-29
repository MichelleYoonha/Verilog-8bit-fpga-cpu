`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:58 06/11/2025 
// Design Name: 
// Module Name:    Control 
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
module Control(
	input  [1:0] op,
	output Branch,
	output MemtoReg,
	output MemRead,
	output MemWrite,
	output ALUOp,
	output ALUSrc,
	output Regwrite,
	output RegDst
    );
	 
	 reg [7:0] con; 
	 always @(*) begin
		 case(op)
			 2'b00: con <= 8'b11000001;
			 2'b01: con <= 8'b01101010;
			 2'b10: con <= 8'bx01001x0;
			 2'b11: con <= 8'bx00100x0;
		 endcase
	 end
	 
	 assign RegDst = con[7];
	 assign Regwrite = con[6];
	 assign ALUSrc = con[5];
	 assign Branch = con[4];
	 assign MemRead = con[3];
	 assign MemWrite = con[2];
	 assign MemtoReg = con[1];
	 assign ALUOp = con[0];


endmodule
