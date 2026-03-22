`timescale 1ns/1ns			//仿真单位/仿真精度
module	hs_ad_da_tb;

//parameter define
parameter CLK_PERIOD = 20;	//时钟周期

reg sys_clk;
reg sys_rst_n;

initial
begin
	sys_clk = 1'b0;
	sys_rst_n = 1'b0;
	#200
	sys_rst_n = 1'b1;
end
	
always #(CLK_PERIOD/2) sys_clk = ~sys_clk;

hs_ad_da hs_ad_da_inst
(
	.sys_clk(sys_clk),				//系统时钟
	.sys_rst_n(sys_rst_n),			//系统复位，低电平有效
	.da_clk(),             //dac驱动时钟
	.da_data(),		//输出给DA的数捿
	
	.ad_data(),		//AD输出数据
	.ad_otr(),			//0:在量程范围内	1：超出量稿
	.ad_clk()			//ADC驱动时钟
);
	

endmodule