`timescale 1ns/1ns
module fifo_top_tb;

reg clk, rst_n;
initial
	begin
		clk = 0;
		rst_n = 0;
		#51 rst_n = 1;
	end
	
	
	always#10 clk = ~clk;

wire [7:0]q;

fifo_top fifo_top_inst
(
	.clk(clk), 
	.rst_n(rst_n), 
	.q(q)
);

endmodule