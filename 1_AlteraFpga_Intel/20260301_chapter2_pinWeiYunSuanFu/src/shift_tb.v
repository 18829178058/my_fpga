`timescale 1ns/1ps
module shift_tb;

	reg clk_in;		//系统时钟
	reg rst_n;		//系统复位
	
	initial
	begin
		clk_in = 0;
		rst_n =0;
		#1000.1 rst_n = 1;
	end
	
	always #10 clk_in = ~clk_in;
	
	wire [3:0] led_out;

shift	shift_inst
(
	.clk_in(clk_in),
	.rst_n(rst_n),
	.led_out(led_out)
);

endmodule