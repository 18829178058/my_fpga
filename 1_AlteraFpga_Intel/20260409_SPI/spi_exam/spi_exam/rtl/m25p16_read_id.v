module				m25p16_read_id
(
					//系统相关
					input			clk,//系统时钟，默认为fclk=2*scl
					input			rst_n,//系统复位，默认低电平有效
					//spi  master总线相关，默认CPOL=0,CPHA=0
					output 			scl,//spi同步时钟
					output 			cs_n,//SPI片选，低电平有效
					output			sdo,//SPI主机数据输出
					input			sdi,//SPI从机数据输出
					
					//uart接口发送相关
					output			tx					
					
					
);
//用户通信端口
wire				req;		//当req==1表示spi请求
wire				done;		//当done==1表示当前spi通信完成
wire				load;		//当load==1加载当前spi发送的数据
wire[7:0]			din;		//当前被加载的发送的数据
wire				dout_vld;	//当dout_vld==1表示SPI接收的数据有效
wire[7:0]			dout;		//当前SPI通信接收的数据
wire				stop;		//当stop==1终止当前SPI通信
//FIFO读相关
wire				rd_clk;
wire				rd_en;
wire				empty;
wire [7:0] 			rddata;
				
									//FIFO写有关	
wire				wr_clk;
wire				wr_en;
wire[7:0]			wrdata;
wire [9:0]			wrnum;//默认FIFO深度depth =1024
fifo				fifo_inst 
(
					.data ( wrdata ),
					.rdclk ( rd_clk ),
					.rdreq ( rd_en ),
					.wrclk ( wr_clk ),
					.wrreq ( wr_en ),
					.q ( rddata ),
					.rdempty ( empty ),
					.wrusedw ( wrnum )
	);

id_m25p16_read      id_m25p16_read_ins
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
spi_master_m25p16_interface spi_master_m25p16_interface_ins
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


uart_snt			u_uart_snt
(
					//系统相关
					.clk(clk),//系统时钟，默认50mhz
					.rst_n(rst_n),//系统复位，低电平有效
					
					//FIFO读相关
					.rd_clk(rd_clk),
					.rd_en(rd_en),
					.empty(empty),
					.rddata(rddata),
					
					//uart接口发送相关
					.tx(tx)
);
endmodule 