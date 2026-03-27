module top
(
	input clk, 
	input rst_n,
	output [7:0] rgb, 
	output hsyns, 
	output vsync
);

wire c0;

my_pll my_pll_inst 
(
	.inclk0(clk),
	.c0(c0)
);



vga vga(
	.clk(c0), 
	.rst_n(rst_n), 
	.rgb(rgb), 
	.hsyns(hsyns), 
	.vsync(vsync)
);

endmodule