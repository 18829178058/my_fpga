module test_dig_driver
(
		//系统相关
		input  clk_50mhz,		//系统时钟，50MHz
		input  rst_n,       	//系统复位，低电平有效
		//数码管驱动信号
		
		output [7:0]  seg, //段选信号
		output [2:0] sel //位选0~5,默认单个数码管显示时间1ms
);

wire [23:0]  din;
assign din = 24'habcdef;

dig_driver  dig_driver_inst
(
		//系统相关
		.clk_50mhz(clk_50mhz),		//系统时钟，50MHz
		.rst_n(rst_n),       	//系统复位，低电平有效
		.din(din),		//显示数码

		//数码管驱动信号
		.seg(seg), //段选信号
		.sel(sel) //位选0~5,默认单个数码管显示时间1ms
);
endmodule