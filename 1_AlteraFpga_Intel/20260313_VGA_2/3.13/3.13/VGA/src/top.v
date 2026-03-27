module top(clk, rst_n, key, hsync, vsync, rgb);

	input clk, rst_n;
	
	input key;
	
	output hsync, vsync;
	
	output [7:0] rgb;
	
	wire	clk_40m;
	
	vga_pll p1(
					.inclk0(clk),
					.c0(clk_40m)
				);
				
	key_filter k1(
							.clk(clk), 
							.rst_n(rst_n), 
							.key_in(key), 
							.key_pose(key_pose), 
							.key_nege()
						);
	
	vga v1(
					.clk(clk_40m), 
					.rst_n(rst_n), 
					.key(key_pose), 
					.hsync(hsync), 
					.vsync(vsync),
					.rgb(rgb)
				);



endmodule 