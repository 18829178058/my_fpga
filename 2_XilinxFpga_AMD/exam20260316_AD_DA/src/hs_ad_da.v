module hs_ad_da
(
	input sys_clk,				//系统时钟
	input sys_rst_n,			//系统复位，低电平有效
	output 	da_clk,             //dac驱动时钟
	output [7:0] da_data,		//输出给DA的数捿
	
	input [7:0] ad_data,		//AD输出数据
	input 		ad_otr,			//0:在量程范围内	1：超出量稿
	output ad_clk				//ADC驱动时钟
);

	//wire define
	wire [7:0] 	rd_addr;			//ROM读地坿
	wire [7:0] 	rd_data;			//ROM读出的数捿
	wire 		clk_50M;			//50MHz时钟
	wire 		clk_25M;			//25MHz时钟
	wire 		clk_25m_deg120;		//相位偏移120皿25MHz时钟
	wire		locked;				//pll时钟锁定信号
	wire 		rst_n;				//复位信号，低电平有效
	
	
	
/*----------------------------------------------------------------------------------*/	
	
	assign rst_n = sys_rst_n & locked;
	assign ad_clk = clk_25M;
	
	clk_wiz_0 clk_wiz_0_inst(
							.clk_out1(clk_50M),
							.clk_out2(clk_25M),
							.clk_out3(clk_25m_deg120),
							.locked(locked),
							.clk_in1(sys_clk)
						);
	
	
	//DA数据发?
	da_wave_send da_wave_send_inst(
										.clk(clk_50M),		//时钟
										.rst_n(rst_n),		//复位信号，低电平有效
										.rd_data(rd_data),	//ROM读取的数捿
										.rd_addr(rd_addr),	//读ROM地址
										.da_clk(da_clk),		//DAC驱动时钟
										.da_data(da_data)		//输出给DA的数捿
									);
									
	//ROM存储波形
	blk_mem_gen_0 rom_256x8b_inst(
									.clka(sys_clk),		//input wire clk
									.addra(rd_addr),	//input wire [7:0] addra
									.douta(rd_data)		//output wire [7:0] douta
								);
//ILA采集AD数据
ila_0 ila_0(
				.clk(clk_25m_deg120),					//input wire clk
				.probe0(ad_otr),						//input wire [0:0] probe0
				.probe1(ad_data),						//input wire [7:0] probe1
				.probe2(da_data)
			);

endmodule
