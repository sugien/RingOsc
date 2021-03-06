`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:51 04/27/2017 
// Design Name: 
// Module Name:    Counting_circuit 
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
module Counting_circuit(clk, Ring_in, value_out);
		parameter max = 99;
		input clk, Ring_in;
		output reg [7:0] value_out = 0;
		wire [7:0] rst_value;
		reg rst = 1;
		wire [7:0] ring_value;
		
		nBitCounter Counter1(.count(rst_value), .clk(clk), .rst_n(rst));
		
		nBitCounter Counter2(.count(ring_value), .clk(Ring_in), .rst_n(rst));
		
		always@(posedge clk)
			if(rst_value > max) begin
					value_out = 511;
					rst = 0;					
					$display("ow");
				end

endmodule
