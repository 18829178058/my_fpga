`timescale 1ns/1ps
module reduce_tb;

	reg clk;			//系统时钟输入
	reg rst_n;		//系统复位
	
	
	initial
	begin
		clk = 1'b0;
		rst_n = 1'b0;
		#1000.1 rst_n = 1'b1;
	end
	
	always #10 clk = ~clk;
	
	wire c;		//输出寄存器

reduce reduce_inst
(
	.clk(clk),			//系统时钟输入
	.rst_n(rst_n),		//系统复位
	.c(c)				//输出寄存器
);


endmodule