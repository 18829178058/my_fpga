module question_13_tb;

	reg clk_in;
	wire clk_out;
	
always #53 clk_in = 1'b1;

question_13		question_13_inst
(
	.clk_in(clk_in),
	.clk_out(clk_out)
);

endmodule