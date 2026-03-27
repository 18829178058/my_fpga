module top
(
	input clk, 
	input rst_n,
	input key,
	output hsyns, 
	output vsync,
	output [7:0] rgb
);

wire c0;
wire key_filter_out;

my_pll my_pll_inst 
(
	.inclk0(clk),
	.c0(c0)
);

key_filter key_filter_inst
			(
			.clk(clk),
			.rst_n(rst_n),
			.key_in(key),
			.key_pose(key_filter_out),
			.key_nege()
			);


vga vga_inst(
	.clk(c0), 
	.rst_n(rst_n),
	.key(key_filter_out),
	.rgb(rgb), 
	.hsyns(hsyns), 
	.vsync(vsync)
);

endmodule