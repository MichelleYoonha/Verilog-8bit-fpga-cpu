//main
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:36:55 06/11/2025 
// Design Name: 
// Module Name:    main 
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
module main(
input reset,
input [7:0] inst,
input clk,
output [7:0] pc,
output [6:0] Seg1,
output[6:0] Seg2,
output reg [6:0] exSeg1,
output reg [6:0] exSeg2
    );
	 
	 wire [3:0] Num1;
	 wire [3:0] Num2;
	 reg endseq;
	 
	 FreqDivider T1(.clk(clk), .clr(1'b0), .clkout(clkout));
	 FinalProject T2(.CLK(clkout), .reset(reset), .pc(pc), .inst(inst), 
	 .Out1(Num1), .Out2(Num2)); 
	 
	 bcd_to_7 U1(.bcd(Num1), .seg(Seg1));
	 bcd_to_7 U2(.bcd(Num2), .seg(Seg2));
	
	always@(negedge clkout or posedge reset) begin
	 if(reset) begin
		exSeg1 <= 0;
		exSeg2 <= 0;
		endseq <= 0;
	 end
	 else begin
		if(pc > 32 && endseq == 0) begin
			exSeg1 <= 1;
			exSeg2 <= 1;
			endseq <= 1;
		end
		else if(pc > 32 && endseq == 1) begin
			exSeg1 <= exSeg1 << 1;
			exSeg2 <= exSeg2 << 1;
		end
	 end
	 end


endmodule
