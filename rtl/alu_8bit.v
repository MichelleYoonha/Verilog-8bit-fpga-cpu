//alu_8bit

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:11 06/11/2025 
// Design Name: 
// Module Name:    alu_8bit 
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
module alu_8bit(
	input [7:0] a,
	input [7:0] b,
	input [2:0] s,
	input cin,
	output reg [7:0] F
    );
	
	always@(*) begin
	
	case(s) 
	3'b000: F = a;
	3'b001: F = ~a;
	3'b010: F = a^b;
	3'b011: F = ~(a^b);
	3'b100: F = a;
	3'b101: F = ~a;
	3'b110: F = a+b+cin;
	3'b111: F = ~a+b;
	default: F = 8'd0;
	endcase
	end
	

endmodule
