module top
(
	input clk,
	input rst_n,
	input [3:0] key,
	output [7:0] rgb,
	output hsync,
	output vsync
);

//变量
//	wire	rst_n;
//	assign	rst_n = key[0] | key[1];
	
	wire vga_clk;

my_pll my_pll_inst(
	.inclk0(clk),
	.c0(vga_clk)
	);
	
	wire [3:0]key_out;
	
	key_filter key_filter_inst1(
							.clk(vga_clk), 
							.rst_n(rst_n), 
							.key_in(key[0]), 
							.key_pose(key_out[0]), 
							.key_nege()
						);
						
						
	key_filter key_filter_inst2(
							.clk(vga_clk), 
							.rst_n(rst_n), 
							.key_in(key[1]), 
							.key_pose(key_out[1]), 
							.key_nege()
						);
						
						
						
	key_filter key_filter_inst3(
							.clk(vga_clk), 
							.rst_n(rst_n), 
							.key_in(key[2]), 
							.key_pose(key_out[2]), 
							.key_nege()
						);
						
						
	key_filter key_filter_inst4(
							.clk(vga_clk), 
							.rst_n(rst_n), 
							.key_in(key[3]), 
							.key_pose(key_out[3]), 
							.key_nege()
						);
	
	wire [3:0] direction;

	key_ctrl	key_ctrl(
						.clk(vga_clk),
						.rst_n(rst_n),
						.key_in(key_out),
						.direction(direction)
					);
					
	wire [9:0] apple_x, apple_y;
	wire apple_en;
	
	apple apple_inst(
					
						.clk(vga_clk),
						.rst_n(rst_n),
						.apple_en(apple_en),
						.apple_x(apple_x),
						.apple_y(apple_y)
					);
					
					
	wire vaild_range;
	wire [9:0] x, y;
		
	vga vga_inst(
					.clk(vga_clk),
					.rst_n(rst_n),
					.vaild_range(vaild_range),
					.x(x),
					.y(y),
					.hsync(hsync),
					.vsync(vsync)
				);
				
	data data_inst
				(
					.clk(vga_clk),
					.rst_n(rst_n),
					.vaild_range(vaild_range),				//图像有效位置
					.x(x),					//当前像素点的x坐标
					.y(y),					//当前像素点的y坐标
					.apple_x(apple_x),
					.apple_y(apple_y),
					.direction(direction),
					.apple_en(apple_en),			//当蛇头位置与苹果位置重叠时，生成新苹果（使能有效）
					.rgb(rgb)
				);

endmodule