module top(clk, rst_n, hsync, vsync, rgb);
	
	input clk, rst_n;
	
	output hsync, vsync;
	
	output [7:0] rgb;
	
	wire	clk_40M;
	
	vga_pll p1(
					.inclk0(clk),
					.c0(clk_40M));
					
	wire	[7:0] q;
	wire	[7:0]	addr;
	
	fangbo_rom r1(
						.address(addr),
						.clock(clk_40M),
						.q(q));
	
	vga_dds v1(
						.clk(clk_40M), 
						.rst_n(rst_n), 
						.q(q), 
						.hsync(hsync), 
						.vsync(vsync),
						.rgb(rgb), 
						.addr(addr)
					);


endmodule 