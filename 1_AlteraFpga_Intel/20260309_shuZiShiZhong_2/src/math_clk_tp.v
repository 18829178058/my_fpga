module	math_clk_tp
(
	input clk,
	input rst_n,
	output [2:0] sel,
	output [7:0] seg
);
	wire [23:0] data;
	
	math_clk math_clk_inst
	(
		.clk(clk),
		.rst_n(rst_n),
		.data_bcd(data)
	);
	
	
	seg_driver	seg_driver_inst
	(
		.clk(clk),		//系统时钟
		.rst_n(rst_n),	//系统复位
		.data(data),	//需要译码的数据
		.sel(sel),		//片选信号
		.seg(seg)		//段选信号
	);


endmodule