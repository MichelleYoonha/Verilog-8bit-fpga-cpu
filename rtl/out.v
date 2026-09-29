`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:13:14 06/12/2025 
// Design Name: 
// Module Name:    out 
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
module out(
input CLK,
input Regwrite,
input [7:0] WBdata,
output reg [3:0] Out1,
output reg [3:0] Out2
    );
	 

	 always @(posedge CLK) begin
	 		Out1 = (Regwrite == 1'b1) ? WBdata[3:0]:
								4'b0000;
			Out2 = (Regwrite == 1'b1) ? WBdata[7:4]:
								4'b0000;
	 end

endmodule
