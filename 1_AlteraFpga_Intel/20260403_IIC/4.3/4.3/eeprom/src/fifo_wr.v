//接收指令并解析，获取iic所需要的信息，rx以数据包的形式发送数据
module fifo_wr(clk, rst_n, data_rx, rx_dout_vld, done_wr, done_iic, start, data_iic, addr_iic, worr_iic, sendnum, recvnum);
	
	input			clk, rst_n;
	
	input [7:0] data_rx;		//rx接收到的指令
	input 		rx_dout_vld;	//fifo的写入数据使能
	
	input			done_iic;		//iic通信结束信号，控制fifo清空
	input			done_wr;			//iic写入成功的信号，fifo读使能
	
	output	reg				start;		//iic启动信号
	output	reg	[7:0]		data_iic;	//要写的数据
	output	reg	[15:0]	addr_iic;	//读写数据操作的地址，分两次传输，高8位+低8位（指令）
	output	reg				worr_iic;	//传输方向（指令）
	
	output	reg	[7:0]		sendnum;		//写数据个数（指令）
	output	reg	[7:0]		recvnum;		//读数据个数（指令）
	
//帧头+sendnum（写数据字节数）+recvnum（读数据字节数）+worr（方向）+addr_H（地址高8位）+addr_L（地址低8位）+data（写的数据）+帧尾
	
//参数定义
	parameter	IDLE	=	1,		//帧头
					SEND	=	2,		//发送数据字节数
					RECV	=	3,		//读数据字节数
					WORR	=	4,		//方向
					ADDR_H=	5,		//地址高
					ADDR_L=	6,		//地址低
					DATA	=	7,		//数据
					STOP	=	8;		//帧尾
	
//内部变量
	reg	[3:0]		c_state, n_state;
	reg	[7:0]		data;
	reg				wrreq;
	
	
	wire				empty;
	wire				full;
	wire	[7:0]		q;
	wire	[8:0]		usedw;
	
//状态机
//第一段
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					c_state <= IDLE;
				end
			else
				c_state <= n_state;
		end
		
//第二段
	always @ (*)
		begin
			case(c_state)
				IDLE		:	begin
									if(rx_dout_vld && data_rx == 8'hfe)
										begin
											n_state <= SEND;
										end
									else
										n_state <= c_state;
								end
				
				SEND		:	begin
									if(rx_dout_vld )
										n_state <= RECV;
									else
										n_state <= c_state;
								end
				
				RECV		:	begin
									if(rx_dout_vld)
										n_state <= WORR;
									else
										n_state <= c_state;
								end
				
				WORR		:	begin
									if(rx_dout_vld)
										begin
											n_state <= ADDR_H;
										end
									else
										n_state <= c_state;
								end
				
				ADDR_H	:	begin
									if(rx_dout_vld)
										n_state	<=	ADDR_L;
									else
										n_state	<=	c_state;
								end
				
				ADDR_L	:	begin
									if(rx_dout_vld)
										n_state <= DATA;
									else
										n_state <= c_state;
								end
				
				DATA		:	begin
									if(rx_dout_vld && data_rx == 8'hee)
										n_state <= STOP;
									else
										n_state <= c_state;
								end
				
				STOP		:	begin
									n_state <= IDLE;
								end
								
				default	:	n_state <= IDLE;
			endcase
		end
	
//第三段
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					start		<=	0;
					data		<=	0;
					addr_iic	<=	0;
					worr_iic	<=	0;
					sendnum	<=	0;
					recvnum	<=	0;
					wrreq		<=	0;
				end
			else
				case(c_state)
					IDLE	:	begin
									start	<=	0;
									data	<=	0;
									wrreq	<=	0;
								end
					
					SEND	:	begin
									if(rx_dout_vld)
										sendnum	<=	data_rx;
								end
					
					RECV	:	begin
									if(rx_dout_vld)
										recvnum	<=	data_rx;
								end
					
					WORR	:	begin
									if(rx_dout_vld)
										worr_iic	<=	data_rx;
								end
					
					ADDR_H:	begin
									if(rx_dout_vld)
										addr_iic[15:8]	<=	data_rx;
								end
					
					ADDR_L:	begin
									if(rx_dout_vld)
										addr_iic[7:0]	<=	data_rx;
								end
					
					DATA	:	begin
									if(rx_dout_vld && data_rx != 8'hee)
										begin
											data_iic	<=	data_rx;
											wrreq	<=	1;
										end
									else
										begin
											data	<= 0;
											wrreq	<=	0;
										end
								end
					STOP	:	begin
									start	<=	1;
									data	<=	0;
									wrreq	<=	0;
								end
					default	:	begin
										start	<=	0;
										data	<=	0;
										wrreq	<=	0;
									end
				endcase
		end
	
//	wfifo wfifo_inst(
//							.aclr(!rst_n || done_iic),
//							.clock(clk),
//							.data(data),
//							.rdreq(done_wr),
//							.wrreq(wrreq),
//							.empty(empty),
//							.full(full),
//							.q(data_iic),
//							.usedw(usedw)
//						);
//
endmodule 