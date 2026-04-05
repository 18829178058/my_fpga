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
da_wave_send da_wave_send_inst
(
	.clk(sys_clk),
	.rst_n(sys_rst_n),
	.key(key),
	.rd_data_0(rd_data_0),
	.rd_data_1(rd_data_1),
	.rd_addr(rd_addr),
	.da_clk(da_clk),
	.da_data(da_data)
);

//ROM0存储波形
rom_256X8_0 rom_256X8_0_inst
(
	.clka(sys_clk),					//input wire clka
	.addra(rd_addr),				//input wire [7:0] addra
	.douta(rd_data_0)				//output wire [7:0]	douta
);

//ROM1存储波形
rom_256X8_1 rom_256X8_1_inst
(
	.clka(sys_clk),					//input wire clka
	.addra(rd_addr),                //input wire [7:0] addra
	.douta(rd_data_1)               //output wire [7:0]	douta
);

endmodule