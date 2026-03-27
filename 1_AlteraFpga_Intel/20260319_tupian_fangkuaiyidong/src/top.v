module	top
(
	input clk,
	input rst_n,
	output hsync,
	output vsync,
	output [7:0] rgb
);

	wire clk_40M;
	
my_pll my_pll_inst (
						.inclk0(clk),
						.c0(clk_40M)
					);

	wire [7:0] q;
	wire [14:0] addr;
	wire [9:0] x, y;
	wire [7:0] color;
	wire data_sel;

move_ctrl move_ctrl_inst
(
	.clk(clk_40M),
	.rst_n(rst_n),
	.q(q),
	.x(x),
	.y(y),
	.addr(addr),
	.color(color)
);


vga_scan vga_scan_inst
(
	.clk(clk_40M),
	.rst_n(rst_n),
	.color(color),
	.hsync(hsync),
	.vsync(vsync),
	.rgb(rgb),
	.x(x),
	.y(y)
);

freq freq_inst
(
	.clk(clk),
	.rst_n(rst_n),
	.data_sel(data_sel)
);

	wire [7:0] q1,q2;

mux2_1	mux2_1
(
	.q1(q1),
	.q2(q2),
	.data_sel(data_sel),
	.q(q)
);

my_rom1 my_rom1_inst 
(
	.address(addr),
	.clock(clk_40M),
	.q(q1)
);

my_rom2 my_rom2_inst
(
	.address(addr),
	.clock(clk_40M),
	.q(q2)
);


endmodule