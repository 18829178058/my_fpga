`timescale 1ns/1ns
module top_tb;

	reg clk;
	reg rst_n;
	
	initial
	begin
		clk = 0;
		rst_n = 0;
		#43 rst_n = 1;
	end
	
	always #10 clk = ~clk;
	
	wire [7:0] q;

top top_inst
(		
	.clk(clk),
	.rst_n(rst_n),
	.q(q)
);

endmodule