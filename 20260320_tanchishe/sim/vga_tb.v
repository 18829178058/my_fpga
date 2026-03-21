`timescale 1ns/1ns
module vga_tb; 


	reg clk;
	reg rst_n;
	
	
	initial 
		begin
			rst_n = 0;
			clk = 0;
			#51 rst_n = 1;
		end
		
	always #10 clk = ~clk;
	
	wire vaild_range;
	wire [9:0] x;
	wire [9:0] y;
	wire hsync;
	wire vsync;

vga vga_inst
(
	.clk(clk),
	.rst_n(rst_n),
	.vaild_range(vaild_range),
	.x(x),
	.y(y),
	.hsync(hsync),
	.vsync(vsync)
);


endmodule