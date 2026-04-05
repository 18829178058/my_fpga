//项目功能：使用串口对eeprom进行数据读写操作
//帧格式固定，
//帧头+sendnum（写数据字节数）+recvnum（读数据字节数）+worr（方向）+addr_H（地址高8位）+addr_L（地址低8位）+data（数据）+帧尾
module top(clk, rst_n, rx, tx, scl, sda);
	
	input clk, rst_n;
	
	input rx;
	
	output tx;
	
	inout  scl;
	inout  sda;
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
	
/*	
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
*/		

e2prom_rw  u_e2prom_rw(
    .clk         (dri_clk   ),  //时钟信号
    .rst_n       (rst_n ),  //复位信号
    //i2c interface
    .i2c_exec    (i2c_exec  ),  //I2C触发执行信号
    .i2c_rh_wl   (i2c_rh_wl ),  //I2C读写控制信号
    .i2c_addr    (i2c_addr  ),  //I2C器件内地址
    .i2c_data_w  (i2c_data_w),  //I2C要写的数据
    .i2c_data_r  (i2c_data_r),  //I2C读出的数据
    .i2c_done    (i2c_done  ),  //I2C一次操作完成
    .i2c_ack     (i2c_ack   ),  //I2C应答标志 
    //user interface
    .rw_done     (   ),  //E2PROM读写测试完成
    .rw_result   ( )   //E2PROM读写测试结果 0:失败 1:成功
);

			
	i2c_dri i2c_dri_inst
   (                                                            
    .clk(clk)        ,    
    .rst_n(rst_n)      ,   
                
    .i2c_exec(start)   ,  //I2C触发执行信号
    .bit_ctrl(0)   ,  //字地址位控制(16b/8b)
    .i2c_rh_wl(worr)  ,  //I2C读写控制信号
    .i2c_addr(addr)   ,  //I2C器件内地址
    .i2c_data_w(data_in) ,  //I2C要写的数据
    .i2c_data_r(data_out) ,  //I2C读出的数据
    .i2c_done(i2c_done)   ,  //I2C一次操作完成
    .i2c_ack(i2c_ack)    ,  //I2C应答标志 0:应答 1:未应答
    .scl(scl)        ,  //I2C的SCL时钟信号
    .sda(sda)        ,  //I2C的SDA信号
                                       
    //user interface                   
    .dri_clk(dri_clk)       //驱动I2C操作的驱动时钟
     );
	
	fifo_rd fifo_rd_inst(
									.clk(clk), 
									.rst_n(rst_n), 
									.data_rd(data_out),
									.done_rd(i2c_done),
									.done_iic(i2c_done), 
									.done_tx(i2c_done),
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