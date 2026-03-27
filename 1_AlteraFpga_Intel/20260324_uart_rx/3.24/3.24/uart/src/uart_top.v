/**********************************************************
Engineer	:	S
Create Data	:	2026-3-24-10:00
Description	:	UART串口回环，FPGA与上位机进行通信，波特率可调
Revision		:	
Additional comments	:	
******************************************************/
/**************************模块及端口声明***************************/
module uart_top(clk, rst_n, uart_rxd, uart_txd);
	
	input clk, rst_n;
	
	input uart_rxd;
	
	output uart_txd;

/**************************参数定义***************************/

/**************************内部变量***************************/
	wire	[7:0]	rx_dout;
	wire			rx_dout_vld;

/**************************模块例化***************************/	
	uart_rx #(					.CLOCK_FRQ(50_000_000)		,//时钟频率
									.BAUD(115200)					,//波特率
									.DATA_LENTH(8)					,//数据位长度
									.CHECKBIT_SELECT(0)			,//0为无需校验，1为需要校验
									.CHECK_TYPE(0)		 			 //0为偶校验，1为奇校验
									)		
					(
							.clk(clk), 
							.rst_n(rst_n), 
							.uart_rxd(uart_rxd), 
							.rx_dout(rx_dout), 
							.rx_dout_vld(rx_dout_vld)
						);
	

endmodule 