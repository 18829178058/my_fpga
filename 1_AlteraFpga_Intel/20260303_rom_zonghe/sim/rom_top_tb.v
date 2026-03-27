`timescale 1ns/1ns
module rom_top_tb;

	reg clk,rst_n;
	
	initial
	begin
		clk = 0;
		rst_n = 0;
		#53 rst_n = 1;
	end
	
	always #10 clk = ~clk;

	wire [7:0] q1,q2,q3,q4;

rom_top	rom_top_inst
(
	.clk(clk),
	.rst_n(rst_n),
	.q1(q1),
	.q2(q2),
	.q3(q3),
	.q4(q4)
);

endmodule