//项目功能：使用串口对eeprom进行数据读写操作
//帧格式固定，
//帧头+sendnum（写数据字节数）+recvnum（读数据字节数）+worr（方向）+addr_H（地址高8位）+addr_L（地址低8位）+data（数据）+帧尾
module top(
		input clk, 
		input rst_n, 
		
		output cs_n, 
		output scl, 
		output sdo, 
		input sdi,
		
		output tx
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
	
//-----------------------------------------
	wire	req;
	wire 	done;
	wire	load;
	wire	[7:0] din;
	wire	dout_vld;
	wire	[7:0] dout;
	wire	stop;
	wire [7:0]	wrdata;
	wire    wr_clk;
	wire    wr_en;
	wire	done_tx;
	wire [9:0] wrnum;
	
	wire	rd_clk;
	wire	rd_en;
	wire	empty;
	wire	[7:0]rddata;

spi_master_m25p16_interface  spi_master_m25p16_interface_inst
(
		//系统相关
		.clk(clk),//系统时钟，默认为fclk=2*scl
		.rst_n(rst_n),//系统复位，默认低电平有效
		
		//spi  master总线相关，默认CPOL=0,CPHA=0
		.scl(scl),//spi同步时钟
		.cs_n(cs_n),//SPI片选，低电平有效
		.sdo(sdo),//SPI主机数据输出
		.sdi(sdi),//SPI从机数据输出
		
		
		
		//用户通信端口
		.req(req),		//当req==1表示spi请求
		.done(done),		//当done==1表示当前spi通信完成
		.load(load),		//当load==1加载当前spi发送的数据
		.din(din),		//当前被加载的发送的数据
		.dout_vld(dout_vld),	//当dout_vld==1表示SPI接收的数据有效
		.dout(dout),		//当前SPI通信接收的数据
		.stop(stop)		//当stop==1终止当前SPI通信		
);
	
	
	
id_m25p16_read				id_m25p16_read_inst
(	
					//系统相关
					.clk(clk),//系统时钟，默认为fclk=2*scl
					.rst_n(rst_n),//系统复位，默认低电平有效
	
	
					//用户通信端口
					.req(req),		//当req==1表示spi请求
					.done(done),		//当done==1表示当前spi通信完成
					.load(load),		//当load==1加载当前spi发送的数据
					.din(din),		//当前被加载的发送的数据
					.dout_vld(dout_vld),	//当dout_vld==1表示SPI接收的数据有效
					.dout(dout),		//当前SPI通信接收的数据
					.stop(stop),		//当stop==1终止当前SPI通信
					//FIFO写有关	
					.wr_clk(wr_clk),
					.wr_en(wr_en),
					.wrdata(wrdata),
					.wrnum(wrnum)//默认FIFO深度depth =1024
);
	
rfifo rfifo_inst(
	.data(wrdata),
	.rdclk(rd_clk),
	.rdreq(rd_en),
	.wrclk(wr_clk),
	.wrreq(wr_en),
	.q(rddata),
	.rdempty(empty),
	.wrusedw(wrnum)
);
			
uart_tx uart_tx_inst
(
	//系统相关
	.clk(clk),			//系统时钟，默认50Mhz
	.rst_n(rst_n),			//系统复位，低电平有效
	
	//FIFO读相关
	.rd_clk(rd_clk),
	.rd_en(rd_en),
	.empty(empty),
	.rddata(rddata),
	
	//uart接口发送相关
	.tx(tx)
);

endmodule 