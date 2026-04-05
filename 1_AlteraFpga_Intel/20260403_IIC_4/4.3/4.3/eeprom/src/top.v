//项目功能：使用串口对eeprom进行数据读写操作
//帧格式固定，
//帧头+sendnum（写数据字节数）+recvnum（读数据字节数）+worr（方向）+addr_H（地址高8位）+addr_L（地址低8位）+data（数据）+帧尾
module top(
		input clk, 
		input rst_n, 
		input rx, 
		output tx, 
		inout scl, 
		inout sda
);

//rx
	wire	[7:0]		data_rx;
	wire				rx_done;
//iic
	wire				done_wr;
	wire				done_iic;
	wire				done_rd;
	wire	[7:0]		data_rd;
//w_fifo	
	wire				start;
	wire	[7:0]		data_iic;
	wire	[15:0]	addr_iic;
	wire				worr_iic;
	wire	[7:0]		sendnum;
	wire	[7:0]		recvnum;

//r_fifo
	wire				start_tx;
	wire	[7:0]		data_tx;
	
	
	uart_rx #(			.CLOCK_FRQ(50_000_000),//时钟频率
							.BAUD	(115200)			,//波特率
							.DATA_LENTH	(8)		,//数据位长度
							.CHECKBIT_SELECT(0)	,//0为无需校验，1为需要校验
							.CHECK_TYPE	(0)		//0为偶校验，1为奇校验
									)		
					rx_inst(
									.clk(clk), 
									.rst_n(rst_n), 
									.uart_rxd(rx), 
									.rx_dout(data_rx), 
									.rx_dout_vld(rx_done)
								);
	
	fifo_wr	fifo_wr_inst(
										.clk(clk), 
										.rst_n(rst_n), 
										.data_rx(data_rx), 
										.rx_dout_vld(rx_done),
										.done_wr(done_wr), 
										.done_iic(done_iic), 
										.start(start),
										.data_iic(data_iic),
										.addr_iic(addr_iic),
										.worr_iic(worr_iic), 
										.sendnum(sendnum), 
										.recvnum(recvnum)
								);

	iic	iic_inst(
							.clk(clk), 
							.rst_n(rst_n), 
							.start(start), 
							.worr(worr_iic), 
							.addr(addr_iic),
							.sendnum(sendnum), 
							.recvnum(recvnum), 
							.data_in(data_iic), 
							.data_out(data_rd), 
							.done_send(done_wr), 
							.done_recv(done_rd),
							.done_iic(done_iic),
							.sda(sda),
							.scl(scl)
					);
	
	fifo_rd fifo_rd_inst(
									.clk(clk), 
									.rst_n(rst_n), 
									.data_rd(data_rd),
									.done_rd(done_rd),
									.done_iic(done_iic), 
									.done_tx(done_tx),
									.worr_iic(worr_iic), 
									.start_tx(start_tx),
									.data_tx(data_tx)
								);
	
	 uart_tx #(		.CLOCK_FRQ(50_000_000)	,//时钟频率
						.BAUD		(115200)		,//波特率
						.DATA_LENTH	(8)				,//数据位长度
						.CHECKBIT_SELECT	(0)		,//0为无需校验，1为需要校验
						.CHECK_TYPE	(0)				 //0为偶校验，1为奇校验
									)		
					tx_inst(
								.clk(clk), 
								.rst_n(rst_n), 
								.tx_din(data_tx), 
								.tx_vld(start_tx), 
								.uart_txd(tx),
								.tx_done(done_tx), 
								.ready()
							);

endmodule 