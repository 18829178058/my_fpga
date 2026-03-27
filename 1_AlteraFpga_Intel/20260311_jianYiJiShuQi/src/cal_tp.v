`timescale 1ns/1ns
module cal_tp;

	reg clk;
	reg rst_n;
	reg [3:0] key_data;
	reg flag;			//按键使能信号，1代表按键按下
	
	initial
		begin
			clk = 0;
			rst_n = 0;
			#53 rst_n = 1;
			flag = 1;
		end
	
	always #10 clk = ~clk;
	
	initial
		begin
			#1000000	key_data = 2;
		end
	
	

	wire dout;

cal	cal_inst
(
	.clk(clk),
	.rst_n(rst_n),
	.key_data(key_data),
	.flag(flag),			//按键使能信号，1代表按键按下
	.dout(dout)
);


endmodule