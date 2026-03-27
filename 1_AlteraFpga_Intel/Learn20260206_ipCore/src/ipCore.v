module ipCore(clk, rst_n, clk_out);

	input clk,rst_n;
	output clk_out;

pll pll_inst(
	.areset(rst_n),
	.inclk0(clk),
	.c0(clk_out),
	.locked());

endmodule