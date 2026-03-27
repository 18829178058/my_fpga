`timescale    1ns/1ns
module test_dig_driver_tb;


//系统相关
reg  clk_50mhz;		//系统时钟，50MHz
reg  rst_n;       	//系统复位，低电平有效
//数码管驱动信号


initial begin
	clk_50mhz = 1'b0;
	rst_n = 1'b0;
	# 53;
	rst_n = 1'b1;
end

always #10   clk_50mhz = ~clk_50mhz;

wire [7:0]  seg; //段选信号
wire [2:0] sel; //位选0~5,默认单个数码管显示时间1ms


test_dig_driver		test_dig_driver_inst
(
		.clk_50mhz(clk_50mhz),		//系统时钟，50MHz
		.rst_n(rst_n),       	//系统复位，低电平有效
		.seg(seg), //段选信号
		.sel(sel) //位选0~5,默认单个数码管显示时间1ms
);

endmodule