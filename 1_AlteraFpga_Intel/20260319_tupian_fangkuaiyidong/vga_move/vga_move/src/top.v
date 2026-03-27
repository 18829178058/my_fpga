module top(clk, rst_n, hsync, vsync, rgb);
	
	input clk, rst_n;
	
	output hsync, vsync;
	
	output [7:0] rgb;
	
	wire		clk_40M;
	
	vga_pll v1(
					.inclk0(clk),
					.c0(clk_40M));
					
	wire	[7:0]	q;
	wire	[13:0]	addr;
	wire	[9:0]	x,y;
	wire	[7:0] color;
	
	wire	data_sel;
	
	move_ctrl v2(
						.clk(clk_40M), 
						.rst_n(rst_n), 
						.q(q),
						.x(x), 
						.y(y), 
						.addr(addr), 
						.color(color)
					);
	
	vga v3(
					.clk(clk_40M), 
					.rst_n(rst_n),
					.hsync(hsync), 
					.vsync(vsync), 
					.rgb(rgb), 
					.x(x), 
					.y(y), 
					.color(color)
				);
	
	freq v4(
				.clk(clk), 
				.rst_n(rst_n), 
				.data_sel(data_sel)
			);
	
	wire	[7:0]	q1,q2;
	
	mux4_1 v5(
					.q1(q1), 
					.q2(q2), 
					.data_sel(data_sel), 
					.q(q)
				);
	
	rom1 r1(
				.address(addr),
				.clock(clk_40M),
				.q(q1));
	
	rom2 r2(
				.address(addr),
				.clock(clk_40M),
				.q(q2));
	


	
	

endmodule 