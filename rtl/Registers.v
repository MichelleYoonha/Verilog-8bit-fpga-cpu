//Registers

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:53 06/11/2025 
// Design Name: 
// Module Name:    Registers 
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
module Registers(
input reset,
input CLK,
input [1:0] readReg1,
input [1:0] readReg2,
input [1:0] writeReg,
input [7:0] writeData,
input RegWrite,
output reg[7:0] readData1,
output reg[7:0] readData2
    );
	 
	 reg [7:0] s0;
	 reg [7:0] s1;
	 reg [7:0] s2;
	 reg [7:0] s3;
	 
	 always @(*) begin
	 case(readReg1)
		2'b00 : readData1 <= s0;
		2'b01 : readData1 <= s1;
		2'b10 : readData1 <= s2;
		2'b11 : readData1 <= s3;
	 endcase
	 
	 case(readReg2)
		2'b00 : readData2 <= s0;
		2'b01 : readData2 <= s1;
		2'b10 : readData2 <= s2;
		2'b11 : readData2 <= s3;
	 endcase
	 end
	 
	 always @(posedge CLK or posedge reset) begin
	 if (reset) begin
		s0 <= 8'b00000000;
		s1 <= 8'b00000000;
		s2 <= 8'b00000000;
		s3 <= 8'b00000000;
	 end
	 
	 else if (RegWrite) begin
	 case(writeReg)
		2'b00 : s0 <= writeData;
		2'b01 : s1 <= writeData;		
		2'b10 : s2 <= writeData;
		2'b11 : s3 <= writeData;
	 endcase
	 end
	 end
	 

endmodule
