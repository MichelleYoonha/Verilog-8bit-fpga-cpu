//FinalProject

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:09 06/11/2025 
// Design Name: 
// Module Name:    FinalProject 
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
////////////////////////////////////////////////////////////////////////////////

module FinalProject(
	input [7:0] inst,
	input CLK,
	input reset,
	output [7:0] pc,
	output [3:0] Out1,
	output [3:0] Out2,
	output [7:0] dumb_R,
	output [7:0] dumb_A,
	output dumb_CON,
	output [7:0] dumb_DM
    );
	 
	 wire [7:0] pcval;
	 wire [7:0] pcjump;
	 wire [7:0] pcfin;
	 wire [1:0] op;
	 wire [1:0] rs;
	 wire [1:0] rt;
	 wire [1:0] rd; 
    wire[1:0] writeReg;
	 wire [1:0] imm;
	 
	 
	 wire Branch;
	 wire MemtoReg;
	 wire MemRead;
	 wire MemWrite;
	 wire ALUOp;
	 wire ALUSrc;
	 wire Regwrite;
	 wire RegDst;
	 
	 wire [7:0] data1;
	 wire [7:0] data2;
	 wire[7:0] immval;
	 wire[7:0] aludata2;
	 wire [7:0] ALUres;
	 wire [7:0] Memres;
	 wire [7:0] WBdata;


	 
	 		
		assign op = inst[7:6];
		assign rs = inst[5:4];
		assign rt = inst[3:2];
		assign rd = inst[1:0];
		assign imm = inst [1:0];
		
		Control CON(.op(op), .Branch(Branch), .MemtoReg(MemtoReg), .MemRead(MemRead), .MemWrite(MemWrite),
		.ALUOp(ALUOp), .ALUSrc(ALUSrc), .Regwrite(Regwrite), .RegDst(RegDst));
		
		assign dumb_CON = Branch;
		//Fetch
		assign pcval= pc + 1;
		
		assign writeReg = RegDst? rd : rt;
		
		Registers R(.readReg1(rs), .readReg2(rt), .writeReg(writeReg), .CLK(CLK),
		.writeData(WBdata), .RegWrite(Regwrite),
		.readData1(data1), .readData2(data2), .reset(reset));
		 
		 assign dumb_R = data2;
	
		
		assign immval = { {6{imm[1]}}, imm[1:0]}; // signextend
		
		assign aludata2 = (ALUSrc == 1'b0) ? data2 : immval;
		
		//ALU
		alu_8bit A(.a(data1), .b(aludata2), .s(3'b110), .cin(1'b0), .F(ALUres));
		assign pcjump = pcval + immval; 
		
		assign dumb_A = ALUres;
		



	 	DataMemory DM(.Address(ALUres), .writeData(data2), .MemRead(MemRead), 
		.MemWrite(MemWrite), .reset(reset), .clk(CLK)
		, .readData(Memres));
		
		assign dumb_DM = Memres;
	
		//WB
		assign WBdata = (MemtoReg == 1'b0) ? ALUres : Memres;

		

		PC P(.pcfin(pcfin), .CLK(CLK), .reset(reset), .pc(pc));
		
		assign pcfin = (Branch == 1'b0) ? pcval : pcjump;
		

		out O(.CLK(CLK), .Regwrite(Regwrite), 
		.WBdata(WBdata), .Out1(Out1),.Out2(Out2));

	

endmodule





