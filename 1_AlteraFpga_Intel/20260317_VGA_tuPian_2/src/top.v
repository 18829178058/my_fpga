module top
(
	input clk, 
	input rst_n,
	output [7:0] rgb, 
	output hsync, 
	output vsync
);

wire c0;

my_pll my_pll_inst 
(
	.inclk0(clk),
	.c0(c0)
);

wire [7:0] q;
wire [15:0] addr;

vga vga_inst(
	.clk(c0), 
	.rst_n(rst_n), 
	.q(q),
	.hsync(hsync), 
	.vsync(vsync),
	.rgb(rgb),
	.addr(addr)
);

 my_rom my_rom_inst
 (
	.address(addr),
	.clock(c0),
	.q(q)
);

endmodule