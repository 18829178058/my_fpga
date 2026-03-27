module top(clk, rst_n, rgb, hsync, vsync);
	
	input clk, rst_n;
	
	output [7:0] rgb;
	
	output hsync;
	
	output vsync;
	
	wire	clk_40M;
	
	pll_vga p1(
					.inclk0(clk),
					.c0(clk_40M));
					
	vga v1(
					.clk(clk_40M), 
					.rst_n(rst_n), 
					.hsync(hsync),
					.vsync(vsync), 
					.rgb(rgb)
				);


endmodule 