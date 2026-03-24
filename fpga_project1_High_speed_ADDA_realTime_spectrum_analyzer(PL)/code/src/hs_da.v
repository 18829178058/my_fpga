module hs_da
(
	input	sys_clk,			//系统时钟
	input	sys_rst_n,			//系统复位，低电平有效
	input 	key,				//按键
	//DA芯片接口
	output	da_clk,				//驱动时钟，最大支持125MHz
	output  [7:0] da_data		//输出给DA的数据
);

//wire define
wire [7:0]	rd_addr;
wire [7:0]	rd_data_1;			//ROM读出的数据
wire [7:0]	rd_data_0;			//ROM读出的数据

/*-----------------------------------------------------------------*/
