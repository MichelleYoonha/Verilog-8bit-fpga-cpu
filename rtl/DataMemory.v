`timescale 1ns / 1ps
module DataMemory(
    input clk,              
    input [7:0] Address,
    input [7:0] writeData,
    input MemRead,
    input MemWrite,
    input reset,
    output [7:0] readData
);
    
    reg [7:0] data_memory [0:31];
	 
	 initial begin
	 data_memory[0]  <= 8'd0;
    data_memory[1]  <= 8'd1;
    data_memory[2]  <= 8'd2;
    data_memory[3]  <= 8'd3;
    data_memory[4]  <= 8'd4;
    data_memory[5]  <= 8'd5;
    data_memory[6]  <= 8'd6;
    data_memory[7]  <= 8'd7;
    data_memory[8]  <= 8'd8;
    data_memory[9]  <= 8'd9;
    data_memory[10] <= 8'd10;
    data_memory[11] <= 8'd11;
    data_memory[12] <= 8'd12;
    data_memory[13] <= 8'd13;
    data_memory[14] <= 8'd14;
    data_memory[15] <= 8'd15;

    data_memory[16] <= 8'd0;
    data_memory[17] <= 8'd255;  // -1 in 2's complement
    data_memory[18] <= 8'd254;  // -2
    data_memory[19] <= 8'd253;  // -3
    data_memory[20] <= 8'd252;  // -4
    data_memory[21] <= 8'd251;  // -5
    data_memory[22] <= 8'd250;  // -6
    data_memory[23] <= 8'd249;  // -7
    data_memory[24] <= 8'd248;  // -8
    data_memory[25] <= 8'd247;  // -9
    data_memory[26] <= 8'd246;  // -10
    data_memory[27] <= 8'd245;  // -11
    data_memory[28] <= 8'd244;  // -12
    data_memory[29] <= 8'd243;  // -13
    data_memory[30] <= 8'd242;  // -14
    data_memory[31] <= 8'd241;  // -15

	 end
    
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
    data_memory[0]  <= 8'd0;
    data_memory[1]  <= 8'd1;
    data_memory[2]  <= 8'd2;
    data_memory[3]  <= 8'd3;
    data_memory[4]  <= 8'd4;
    data_memory[5]  <= 8'd5;
    data_memory[6]  <= 8'd6;
    data_memory[7]  <= 8'd7;
    data_memory[8]  <= 8'd8;
    data_memory[9]  <= 8'd9;
    data_memory[10] <= 8'd10;
    data_memory[11] <= 8'd11;
    data_memory[12] <= 8'd12;
    data_memory[13] <= 8'd13;
    data_memory[14] <= 8'd14;
    data_memory[15] <= 8'd15;

    data_memory[16] <= 8'd0;
    data_memory[17] <= 8'd255;  // -1 in 2's complement
    data_memory[18] <= 8'd254;  // -2
    data_memory[19] <= 8'd253;  // -3
    data_memory[20] <= 8'd252;  // -4
    data_memory[21] <= 8'd251;  // -5
    data_memory[22] <= 8'd250;  // -6
    data_memory[23] <= 8'd249;  // -7
    data_memory[24] <= 8'd248;  // -8
    data_memory[25] <= 8'd247;  // -9
    data_memory[26] <= 8'd246;  // -10
    data_memory[27] <= 8'd245;  // -11
    data_memory[28] <= 8'd244;  // -12
    data_memory[29] <= 8'd243;  // -13
    data_memory[30] <= 8'd242;  // -14
    data_memory[31] <= 8'd241;  // -15

        end else if (MemWrite) begin
            data_memory[Address[4:0]] <= writeData;
        end 
		

		 end
		 
		 assign readData = (MemRead) ? data_memory[Address[4:0]] : 8'b0;
   
    
endmodule
