`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:57:46 06/14/2025 
// Design Name: 
// Module Name:    TopSystem 
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
module TopSystem(
input [7:0] pc,
output [7:0] inst
    );
	 
	 wire [7:0] MemByte [31:0];
	 
	 assign MemByte[0] = 8'b00001011;
	 assign MemByte[1] = 8'b01001010;
	 assign MemByte[2] = 8'b11000001;
	 assign MemByte[3] = 8'b00011000;
	 assign MemByte[4] = 8'b01001111;
	 assign MemByte[5] = 8'b00101100;
	 assign MemByte[6] = 8'b10101001;
	 assign inst = MemByte[pc];
	 


endmodule
