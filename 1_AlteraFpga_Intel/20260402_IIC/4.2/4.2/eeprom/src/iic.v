//iic驱动eeprom，增加四个状态为发送地址高位，对应应答，发送地址地位，对应应答100K速度
/*************************端口定义*******************************/
module iic(clk, rst_n, start, worr, addr, sendnum, recvnum, data_in, data_out, done_send, done_recv, done_iic, sda, scl);

	input clk, rst_n;
	
	input start;	//开始信号
	
	input [15:0] addr;//寄存器地址
	
	input worr;		//读写方向，ID[0]
	
	input	[7:0]	sendnum;	//写的数据的个数
	input [7:0]	recvnum;	//读的数据的个数
	
	input [7:0] data_in;	//写数据

	output	reg	[7:0]	data_out;	//读数据
	output	wire			done_send;	//写数据的完成信号
	output	wire			done_recv;	//读数据的完成信号
	output	wire			done_iic;	//iic工作结束信号
	
	inout						sda;	//数据线
	inout						scl;	//时钟线
	
/*************************参数声明*******************************/	
	parameter	sysclk	=	50_000_000;		//系统时钟
	parameter	iicclk	=	100_000;			//iic工作频率
	parameter	delay		=	sysclk/iicclk;	//iic的工作周期
	
	parameter	MID		=	delay/2;			//1/2处
	parameter	Q_MID		=	delay/4;			//1/4处
	parameter	TQ_MID	=	MID + Q_MID;	//3/4处
	
	parameter	IDW		=	8'b1010000_0;	//ID拼写方向
	parameter	IDR		=	8'b1010000_1;	//ID拼读方向
	
/***********************定义内部变量*********************************/	
	reg	[8:0]	cnt;			//iic工作周期的计数
	reg	[3:0]	cnt_bit;		//数据bit的个数
	
	reg			ack_flag;	//应答信号的寄存
	reg			worr_flag;	//方向寄存
	reg	[7:0]	data_i_reg;	//写数据寄存器
	reg	[15:0]	addr_reg;
	
	reg	[7:0]	send_cnt;	//写数据个数的计数
	reg	[7:0]	recv_cnt;	//读数据个数的计数
	
/*************************起始信号*******************************/
//上升沿01， 下降沿10， 电平11， 00
	reg	[1:0]	start_reg;
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					start_reg <= 0;
				end
			else
				start_reg <= {start_reg[0], start};
		end
		
/*************************三态门*******************************/	
	reg	sda_en;	//使能，开关
	reg	sda_out;	//输出
	wire	sda_in;	//输入
	
	assign	sda_in	=	sda;		//sda为输入时，直接当做输入
	assign	sda	=	(sda_en)	?	sda_out	:	1'bz;	//sda为输出时，使能有效为输出，无效为高阻
	
	reg	scl_en;
	reg	scl_out;
	wire	scl_in;
	
	assign	scl_in	=	scl;
	assign	scl	=	(scl_en)	?	scl_out	:	1'bz;
	
/*************************状态机参数*******************************/	
	reg	[3:0]	c_state, n_state;
	
	localparam	IDLE	=	1,		//空闲，sda，scl都为高
					START	=	2,		//产生开始信号
					ID		=	3,		//发送ID（worr）
					ACK1	=	4,		//从机对ID的应答（分支）
					SEND_ADDR_H	=	5,	//地址高八位
					ACK2	=	6,
					SEND_ADDR_L	=	7,	//地址低八位
					ACK3	=	8,
					SEND_DATA	=	9,		//写数据
					ACK4	=	10,		//写数据的应答（写次数判断）（分支）
					STOP	=	11,		//停止信号
					RECV_DATA	=	12,		//读数据
					ACK5	=	13,		//读数据的应答（读次数判断）
					START1=	14,	//重新开始，先写后读
					ID1	=	15,	//读ID
					ACK6	=	16;	//读ID的应答	
					
/*************************状态机*******************************/	
//第一段，时序逻辑描述状态转移
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				c_state	<=	IDLE;
			else
				c_state	<=	n_state;
		end

//第二段，组合逻辑描述状态转移逻辑
	always @ (*)
		begin
			case(c_state)
				IDLE	:	begin
								if(start_reg == 2'b01)
									n_state	=	START;
								else
									n_state	=	c_state;
							end
				
				START	:	begin
								if(cnt == delay - 1)
									n_state	=	ID;
								else
									n_state	=	c_state;
							end	
				
				ID		:	begin
								if(cnt_bit == 7 && cnt == delay - 1)
									n_state	=	ACK1;
								else
									n_state	=	c_state;
							end
				
				ACK1	:	begin
								if(ack_flag	== 1)	//应答无效
									n_state	=	IDLE;
								else
									if(ack_flag == 0 && cnt == delay - 1)
										n_state = SEND_ADDR_H;
									else
										n_state = c_state;
							end
				
				SEND_ADDR_H	:	begin
										if(cnt_bit == 7 && cnt == delay - 1)
											n_state = ACK2;
										else
											n_state = c_state;
									end
				
				ACK2	:	begin
								if(ack_flag == 1)
									n_state = IDLE;
								else
									if(ack_flag == 0 && cnt == delay - 1)
										n_state = SEND_ADDR_L;
									else
										n_state = c_state;
							end
							
				SEND_ADDR_L	:	begin
										if(cnt_bit == 7 && cnt == delay - 1)
											n_state = ACK3;
										else
											n_state = c_state;
									end
				
				ACK3	:	begin
								if(ack_flag == 1)
									n_state = IDLE;
								else
									if(ack_flag == 0 && cnt == delay - 1 && worr_flag == 0)	//worr为0，只写
										n_state = SEND_DATA;
									else
										if(ack_flag == 0 && cnt == delay - 1 && worr_flag == 1)//先写后读
											n_state	=	START1;
										else
											n_state = c_state;
							end
				
				SEND_DATA	:	begin
										if(cnt_bit == 7 && cnt == delay - 1)
											n_state	=	ACK4;
										else
											n_state	=	c_state;
									end
				
				ACK4	:	begin
								if(ack_flag == 1)	//应答无效
									n_state = IDLE;
								else
									if(ack_flag == 0 && cnt == delay - 1 && send_cnt == sendnum )//写完数据后无需读
										n_state = STOP;
									else
										if(ack_flag == 0 && cnt == delay - 1 && send_cnt < sendnum)//写数据计数未满
											n_state	=	SEND_DATA;
										else
											n_state	=	c_state;
							end
				
				STOP	:	begin
								if(cnt == delay - 1)
									n_state = IDLE;
								else
									n_state = c_state;
							end
				
				RECV_DATA	:	begin
								if(cnt_bit == 7 && cnt == delay - 1)
									n_state = ACK5;
								else
									n_state = c_state;
							end
				
				ACK5	:	begin
								if(cnt == delay - 1 && recv_cnt == recvnum)
									n_state = STOP;
								else
									if(cnt == delay - 1 && recv_cnt < recvnum)
										n_state = RECV_DATA;
									else
										n_state = c_state;
							end
				
				START1:	begin
								if(cnt == delay - 1)
									n_state = ID1;
								else
									n_state = c_state;
							end
				
				ID1	:	begin	//发送8bit设备地址
								if(cnt == delay - 1 && cnt_bit == 7)
									n_state = ACK6;
								else
									n_state = c_state;
							end
				
				ACK6	:	begin
								if(ack_flag == 1)
									n_state = IDLE;
								else
									if(cnt == delay - 1)
										n_state = RECV_DATA;
									else
										n_state = c_state;
							end
							
				default	:	n_state = IDLE;		
			endcase
		end

//状态机第三段，时序逻辑描述输出
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					data_out <= 0;//读的数据
					//计数
					cnt		<=	0;//iic工作周期计数
					cnt_bit	<=	0;//bit计数
					//寄存
					ack_flag	<=	0;//应答寄存
					addr_reg <= 0;//地址寄存
					worr_flag<=	0;//方向寄存
					data_i_reg	<=	0;//写数据寄存
					//读写字节计数
					send_cnt <= 0;//写数据个数计数
					recv_cnt <= 0;//读数据个数计数
					//三态门
					scl_en	<=	0;//使能，开关
					scl_out	<=	0;//输出
					sda_en	<=	0;//使能开关
					sda_out	<=	0;//输出
				end
			else
				case(c_state)
					IDLE	:	begin
									data_out <= 0;//读的数据
									cnt		<=	0;//iic工作周期计数
									cnt_bit	<=	0;//bit计数
									
									ack_flag	<=	0;//应答寄存
									worr_flag<=	worr;//方向寄存
									addr_reg <= addr;
									data_i_reg	<=	data_in;//写数据寄存
									
									send_cnt <= 0;//写数据个数计数
									recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	0;//使能，开关
									scl_out	<=	1;//输出,空闲为高
									sda_en	<=	0;//使能开关
									sda_out	<=	1;//输出，空闲为高
								end
					
					START	:	begin
								//	data_out <= 0;//读的数据
									if(cnt == delay - 1)
										cnt	<=	0;//iic工作周期计数
									else
										begin
											cnt <= cnt + 1;
										end
										
								//	cnt_bit	<=	0;//bit计数
								//	ack_flag	<=	0;//应答寄存
								//	worr_flag<=	worr;//方向寄存
								//	data_i_reg	<=	data_in;//写数据寄存
								//	send_cnt <= 0;//写数据个数计数	
								//	recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
											
									sda_en	<=	1;//使能开关
									if(cnt <= Q_MID)
										sda_out	<=	1;//输出，空闲为高
									else
										sda_out	<=	0;
								end
					
					ID		:	begin
						//			data_out <= 0;//读的数据
									if(cnt == delay - 1)
										begin
											cnt		<=	0;//iic工作周期计数
											cnt_bit	<=	cnt_bit + 1;//bit计数
										end
									else
										begin
											cnt <= cnt + 1;
										end
									
						//			ack_flag	<=	0;//应答寄存
						//			worr_flag<=	worr;//方向寄存
						//			data_i_reg	<=	data_in;//写数据寄存
						//			send_cnt <= 0;//写数据个数计数
						//			recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID && cnt >= Q_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
										
									sda_en	<=	1;//使能开关
									if(worr_flag == 0 && cnt == 1)
										sda_out	<=	IDW[7-cnt_bit];//输出，空闲为高
									else
										sda_out	<=	sda_out;
								end
					
					ACK1	:	begin
						//			data_out <= 0;//读的数据
									if(cnt == delay - 1)
										cnt <= 0;//iic工作周期计数
									else
										begin
											cnt <= cnt + 1;
										end
									cnt_bit	<=	0;//bit计数
									
									if(cnt == MID)
										ack_flag	<=	sda_in;//应答寄存
									
						//			worr_flag<=	worr;//方向寄存
						//			data_i_reg	<=	data_in;//写数据寄存
						//			send_cnt <= 0;//写数据个数计数
						//			recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID && cnt >= Q_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
										
									sda_en	<=	0;//使能开关
									sda_out	<=	1;//输出，空闲为高
								end
					
					SEND_ADDR_H	:	begin
											if(cnt == delay - 1)
												begin
													cnt <= 0;
													cnt_bit <= cnt_bit + 1;
												end
											else
												cnt <= cnt + 1;
											
											scl_en	<=	1;//使能，开关
											if(cnt <= TQ_MID && cnt >= Q_MID)
												scl_out	<=	1;//输出,空闲为高
											else
												begin
													scl_out	<=	0;
												end
												
											sda_en	<=	1;//使能开关
											if(cnt == 1)
												sda_out	<=	addr_reg[15-cnt_bit];//输出，空闲为高
										end
					
					ACK2	:	begin
						//			data_out <= 0;//读的数据
									if(cnt == delay - 1)
										cnt <= 0;//iic工作周期计数
									else
										begin
											cnt <= cnt + 1;
										end
									cnt_bit	<=	0;//bit计数
									
									if(cnt == MID)
										ack_flag	<=	sda_in;//应答寄存
									
						//			worr_flag<=	worr;//方向寄存
						//			data_i_reg	<=	data_in;//写数据寄存
						//			send_cnt <= 0;//写数据个数计数
						//			recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID && cnt >= Q_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
										
									sda_en	<=	0;//使能开关
									sda_out	<=	1;//输出，空闲为高
								end
					
					SEND_ADDR_L	:	begin
											if(cnt == delay - 1)
												begin
													cnt <= 0;
													cnt_bit <= cnt_bit + 1;
												end
											else
												cnt <= cnt + 1;
											
											scl_en	<=	1;//使能，开关
											if(cnt <= TQ_MID && cnt >= Q_MID)
												scl_out	<=	1;//输出,空闲为高
											else
												begin
													scl_out	<=	0;
												end
												
											sda_en	<=	1;//使能开关
											if(cnt == 1)
												sda_out	<=	addr_reg[7-cnt_bit];//输出，空闲为高
										end
					
					ACK3	:	begin
						//			data_out <= 0;//读的数据
									if(cnt == delay - 1)
										cnt <= 0;//iic工作周期计数
									else
										begin
											cnt <= cnt + 1;
										end
									cnt_bit	<=	0;//bit计数
									
									if(cnt == MID)
										ack_flag	<=	sda_in;//应答寄存
									
						//			worr_flag<=	worr;//方向寄存
						//			data_i_reg	<=	data_in;//写数据寄存
						//			send_cnt <= 0;//写数据个数计数
						//			recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID && cnt >= Q_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
										
									sda_en	<=	0;//使能开关
									sda_out	<=	1;//输出，空闲为高
								end
					
					SEND_DATA	:	begin
						//			data_out <= 0;//读的数据
									if(cnt == delay - 1)
										begin
											cnt		<=	0;//iic工作周期计数
											cnt_bit	<=	cnt_bit + 1;//bit计数
										end
									else
										begin
											cnt <= cnt + 1;
										end
									
						//			ack_flag	<=	0;//应答寄存
						//			worr_flag<=	worr;//方向寄存
						//			data_i_reg	<=	data_in;//写数据寄存
									send_cnt <= send_cnt;//写数据个数计数--------保持
						//			recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID && cnt >= Q_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
										
									sda_en	<=	1;//使能开关
									if(cnt == 1)
										sda_out	<=	data_i_reg[7-cnt_bit];//输出，空闲为高
									else
										sda_out	<=	sda_out;
								end
								
					ACK4	:	begin
									data_out <= 0;//读的数据
									if(cnt == delay - 1)
										cnt <= 0;//iic工作周期计数
									else
										begin
											cnt <= cnt + 1;
										end
										
									cnt_bit	<=	0;//bit计数
									
									if(cnt == MID)
										ack_flag	<=	sda_in;//应答寄存
									
						//			worr_flag<=	worr;//方向寄存
									data_i_reg	<=	data_in;//写数据寄存,接受新数据
									if(cnt == MID)
										begin
											send_cnt <= send_cnt + 1;//写数据个数计数
										end
										
									recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID && cnt >= Q_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
										
									sda_en	<=	0;//使能开关
									sda_out	<=	1;//输出，空闲为高
								end
					
					STOP	:	begin
									data_out <= 0;//读的数据
									if(cnt == delay - 1)
										cnt		<=	0;//iic工作周期计数
									else
										begin
											cnt <= cnt + 1;
										end
										
									cnt_bit	<=	0;//bit计数
									ack_flag	<=	0;//应答寄存
									worr_flag<=	0;//方向寄存
									addr_reg <= 0;
									data_i_reg	<=	0;//写数据寄存
									send_cnt <= 0;//写数据个数计数
									recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= Q_MID)
										scl_out	<=	0;
									else
										scl_out	<=	1;
										
									sda_en	<=	1;//使能开关
									if(cnt <= TQ_MID)
										sda_out	<=	0;
									else
										sda_out	<=	1;
								end
					
					RECV_DATA	:	begin	
									if(cnt == MID)
										data_out[7-cnt_bit] <= sda_in;//读的数据，正中间采样
										
									if(cnt == delay - 1)
										begin
											cnt		<=	0;//iic工作周期计数
											cnt_bit	<=	cnt_bit + 1;//bit计数
										end
									else
										begin
											cnt <= cnt + 1;
										end
										
							//		ack_flag	<=	0;//应答寄存，写数据寄存
							//		worr_flag<=	worr;//方向寄存
							//		data_i_reg	<=	data_in;//写数据寄存
							//		send_cnt <= 0;//写数据个数计数
									recv_cnt <= recv_cnt;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID && cnt >= Q_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
									
									sda_en	<=	0;//使能开关,释放数据线
									sda_out	<=	1;//输出，空闲为高
								end
					
					ACK5	:	begin
							//		data_out <= 0;//读的数据
									if(cnt == delay - 1)
										cnt		<=	0;//iic工作周期计数
									else
										begin
											cnt <= cnt + 1;
										end
										
									cnt_bit	<=	0;//bit计数
									
									ack_flag	<=	0;//应答寄存
									
							//		worr_flag<=	worr;//方向寄存
							//		data_i_reg	<=	data_in;//写数据寄存
							//		send_cnt <= 0;//写数据个数计数
									if(cnt == MID)
										recv_cnt <= recv_cnt + 1;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID && cnt >= Q_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
									
									sda_en	<=	1;//使能开关,驱动数据线
									sda_out	<=	0;//输出，应答
								end
					
					START1:	begin
						//			data_out <= 0;//读的数据
									if(cnt == delay - 1)
										cnt	<=	0;//iic工作周期计数
									else
										begin
											cnt <= cnt + 1;
										end
										
								//	cnt_bit	<=	0;//bit计数
								//	ack_flag	<=	0;//应答寄存
								//	worr_flag<=	worr;//方向寄存
								//	data_i_reg	<=	data_in;//写数据寄存
								//	send_cnt <= 0;//写数据个数计数	
								//	recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
											
									sda_en	<=	1;//使能开关
									if(cnt <= Q_MID)
										sda_out	<=	1;//输出，空闲为高
									else
										sda_out	<=	0;
								end
					
					ID1	:	begin
									data_out <= 0;//读的数据
									if(cnt == delay - 1)
										begin
											cnt		<=	0;//iic工作周期计数
											cnt_bit	<=	cnt_bit + 1;//bit计数
										end
									else
										begin
											cnt <= cnt + 1;
										end
									
						//			ack_flag	<=	0;//应答寄存
						//			worr_flag<=	worr;//方向寄存
						//			data_i_reg	<=	data_in;//写数据寄存
						//			send_cnt <= 0;//写数据个数计数
						//			recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID && cnt >= Q_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
										
									sda_en	<=	1;//使能开关
									if(cnt == 1)
										sda_out	<=	IDR[7-cnt_bit];//输出，空闲为高
									else
										sda_out	<=	sda_out;
								end
					
					ACK6	:	begin
						//			data_out <= 0;//读的数据
									if(cnt == delay - 1)
										cnt <= 0;//iic工作周期计数
									else
										begin
											cnt <= cnt + 1;
										end
									cnt_bit	<=	0;//bit计数
									
									if(cnt == MID)
										ack_flag	<=	sda_in;//应答寄存
									
						//			worr_flag<=	worr;//方向寄存
						//			data_i_reg	<=	data_in;//写数据寄存
						//			send_cnt <= 0;//写数据个数计数
						//			recv_cnt <= 0;//读数据个数计数
									
									scl_en	<=	1;//使能，开关
									if(cnt <= TQ_MID && cnt >= Q_MID)
										scl_out	<=	1;//输出,空闲为高
									else
										begin
											scl_out	<=	0;
										end
										
									sda_en	<=	0;//使能开关
									sda_out	<=	1;//输出，空闲为高
								end
								
					default	:	begin
										data_out <= 0;//读的数据
										cnt		<=	0;//iic工作周期计数
										cnt_bit	<=	0;//bit计数
										ack_flag	<=	0;//应答寄存
										worr_flag<=	worr;//方向寄存
										data_i_reg	<=	data_in;//写数据寄存
										addr_reg <= 0;
										send_cnt <= 0;//写数据个数计数
										recv_cnt <= 0;//读数据个数计数
										
										scl_en	<=	0;//使能，开关
										scl_out	<=	1;//输出,空闲为高
										sda_en	<=	0;//使能开关
										sda_out	<=	1;//输出，空闲为高
									end
				endcase
		end
		
	assign	done_send	=	(c_state == SEND_DATA && cnt == 1 && cnt_bit == 7)	?	1:0;
	assign	done_recv	=	(c_state	==	RECV_DATA && cnt == 1 && cnt_bit == 7)	?	1:0;
	assign	done_iic		=	(c_state == STOP && cnt == delay - 1)	?	1:0;
			
endmodule 