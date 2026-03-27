`timescale 1ns/1ns
module seg_driver_tb;

	reg clk;					//系统时钟
	reg rst_n;				//系统复位
	
	initial 
	begin
		clk = 0;
		rst_n = 0;
		#51 rst_n = 1;
	end

	always #10 clk = ~clk;
	
	
	
	
	wire  [2:0] sel;		//片选信号
	wire  [7:0] seg;		//段选信号


seg_driver	seg_driver_inst
(
	.clk(clk),					//系统时钟
	.rst_n(rst_n),				//系统复位
	.sel(sel),		//片选信号
	.seg(seg)		//段选信号
);


endmodule