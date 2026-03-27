//贪吃蛇小游戏
//端口定义
module top(clk, key, rgb, hsync, vsync);
	
	input clk;
	
	input [3:0]key;
	
	output [7:0] rgb;
	
	output hsync;
	
	output vsync;

//变量
	wire	rst_n;
	assign	rst_n = key[0] | key[1];
	
	wire	vga_clk;	//25.175MHZ
	//key
	wire	key_out1;
	wire	key_out2;
	wire	key_out3;
	wire	key_out4;
	//key_ctrl
	wire	up;
	wire	down;
	wire	left;
	wire	right;
	//apple
	wire	[9:0]	apple_x;
	wire	[9:0]	apple_y;
	
	wire			apple_en;
	
	//data,vga
	wire	vaild_range;
	wire	[9:0]	x,y;
	
	vga_pll v1(
					.inclk0(clk),
					.c0(vga_clk));
	
	key_filter k1(
						.clk(vga_clk), 
						.rst_n(rst_n), 
						.key_in(key[0]), 
						.key_pose(key_out1), 
						.key_nege()
					);
	
	key_filter k2(
						.clk(vga_clk), 
						.rst_n(rst_n), 
						.key_in(key[1]), 
						.key_pose(key_out2), 
						.key_nege()
					);
	
	key_filter k3(
						.clk(vga_clk), 
						.rst_n(rst_n), 
						.key_in(key[2]), 
						.key_pose(key_out3), 
						.key_nege()
					);
	
	key_filter k4(
						.clk(vga_clk), 
						.rst_n(rst_n), 
						.key_in(key[3]), 
						.key_pose(key_out4), 
						.key_nege()
					);
	
	key_ctrl k5(
						.clk(vga_clk), 
						.rst_n(rst_n), 
						.key_out1(key_out1), 
						.key_out2(key_out2), 
						.key_out3(key_out3), 
						.key_out4(key_out4), 
						.up(up), 
						.down(down), 
						.left(left), 
						.right(right)
					);
	
	
	apple v2(
						.clk(vga_clk), 
						.rst_n(rst_n), 
						.apple_en(apple_en), 
						.apple_x(apple_x), 
						.apple_y(apple_y)
					);	
	
	data v3(
					.clk(vga_clk), 
					.rst_n(rst_n), 
					.vaild_range(vaild_range), 
					.x(x), 
					.y(y), 
					.apple_x(apple_x), 
					.apple_y(apple_y), 
					.up(up), 
					.down(down), 
					.left(left), 
					.right(right), 
					.apple_en(apple_en), 
					.rgb(rgb)
				);
	
	vga v4(
				.clk(vga_clk), 
				.rst_n(rst_n), 
				.vaild_range(vaild_range), 
				.x(x), 
				.y(y), 
				.hsync(hsync), 
				.vsync(vsync)
			);


endmodule 