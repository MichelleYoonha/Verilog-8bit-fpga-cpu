`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:40:34 06/11/2025 
// Design Name: 
// Module Name:    PC 
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
module PC(
input reset,
input [7:0] pcfin,
input CLK,
output reg [7:0] pc
    );
	 
always @(posedge CLK or posedge reset) begin
if (reset) begin
pc <= 8'b00000000;
end else 
pc <= pcfin;
end


endmodule
