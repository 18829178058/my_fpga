`timescale 1ns/1ps
module  Assignment2_tb;

	reg clk;				//系统时钟输入
	reg rst_n;	  			//低电平复位信号

	initial
	begin
		clk = 0;
		rst_n = 0;
		#1000.1 rst_n = 1;
	end
	
	always #10 clk=~clk;

Assignment2 assignment2_inst(
			.clk(clk), 
			.rst_n(rst_n));
endmodule