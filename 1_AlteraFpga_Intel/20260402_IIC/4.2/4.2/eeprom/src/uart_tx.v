/*****************************************************
Engineer	:	S
Create Data	:	2026-3-25-9:05
Description	:	UART发送模块，波特率可调，校验位可选
Revision		:	
Additional comments	:	
******************************************************/
/**************************模块及端口声明***************************/
module uart_tx #(parameter	CLOCK_FRQ	=	50_000_000	,//时钟频率
									BAUD			=	115200		,//波特率
									DATA_LENTH	=	8				,//数据位长度
									CHECKBIT_SELECT	=	0		,//0为无需校验，1为需要校验
									CHECK_TYPE	=	0				 //0为偶校验，1为奇校验
									)		
						(clk, rst_n, tx_din, tx_vld, uart_txd,tx_done, ready);
						
	input clk, rst_n;
		
	input [DATA_LENTH - 1:0] tx_din;
	
	input tx_vld;
	
	output reg uart_txd;
	
	output reg tx_done;//发送结束信号

	output reg ready;//忙闲指示信号
		
/**************************参数声明***************************/
	parameter	BAUD_MAX	=	CLOCK_FRQ/BAUD;
	parameter	IDLE		=	5'b00001,	//空闲位
					START		=	5'b00010,	//起始位
					DATA		=	5'b00100,	//数据位
					CHECK		=	5'b01000,	//校验位
					STOP		=	5'b10000;	//停止位
					
/************************定义内部变量***************************/
	
	reg	[4:0]	state_c;
	reg	[4:0]	state_n;
	
	reg	[12:0]	cnt_baud;
	wire				add_cnt_baud;
	wire				end_cnt_baud;
	
	reg	[2:0]		cnt_bit;
	wire				add_cnt_bit;
	wire				end_cnt_bit;
	
	reg	[7:0]		tx_din_r;
	
	wire				idle2start	;
	wire				start2data	;
	wire				data2check	;
	wire				data2stop	;
	wire				check2stop	;
	wire				stop2idle	;
	
/************************数据寄存***************************/	
//tx_din_r
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					tx_din_r <= 0;
				end
			else
				if(tx_vld)
					begin
						tx_din_r <= tx_din;
					end
		end
	
/************************状态机***************************/	
//状态机第一段，时序逻辑描述状态转移	
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					state_c <= IDLE;
				end
			else
				begin
					state_c <= state_n;
				end
		end
	
//状态机第二段，组合逻辑描述状态转移逻辑
	always @ (*)
		begin
			case(state_c)
				IDLE	:	begin
								if(idle2start)
									state_n = START;
								else
									state_n = state_c;
							end
				
				START	:	begin
								if(start2data)
									state_n = DATA;
								else
									state_n = state_c;
							end
				
				DATA	:	begin
								if(data2check)
									state_n = CHECK;
								else
									if(data2stop)
										state_n = STOP;
									else
										state_n = state_c;
							end
				
				CHECK	:	begin
								if(check2stop)
									state_n = STOP;
								else
									state_n = state_c;
							end
				
				STOP	:	begin
								if(stop2idle)
									state_n = IDLE;
								else
									state_n = state_c;
							end
							
				default	:	state_n = IDLE;
			endcase
		end
	
	assign	idle2start	=	(state_c == IDLE)	&&	tx_vld;//接收到8位有效数据后，发送启动
	assign	start2data	=	(state_c == START)&&	end_cnt_baud;//起始位计满1bit,开始计数据位
	assign	data2check	=	(state_c == DATA) && end_cnt_bit && CHECKBIT_SELECT;
	assign	data2stop	=	(state_c == DATA) && end_cnt_bit && !CHECKBIT_SELECT;
	assign	check2stop	=	(state_c == CHECK)&& end_cnt_baud;
	assign	stop2idle	=	(state_c == STOP)	&&	end_cnt_baud;
	
//状态机第三段，时序逻辑描述输出
//uart_txd
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					uart_txd <= 1'b1;
				end
			else
				begin
					case(state_c)
						IDLE	:	begin
										uart_txd <= 1'b1;
									end
									
						START	:	begin
										uart_txd <= 1'b0;
									end
						
						DATA	:	begin
										uart_txd <= tx_din_r[cnt_bit];	//并转串,LSB
									end
						
						CHECK	:	begin
									//	uart_txd	<=	^tx_din_r + CHECK_TYPE;
										uart_txd <= CHECK_TYPE ? (^tx_din_r + 1) : (^tx_din_r);
									end
						
						STOP	:	begin
										uart_txd <= 1'b1;
									end
									
						default	:	uart_txd <= 1;
					endcase
				end
		end
	
/************************计数器***************************/	
//cnt_baud
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt_baud <= 0;
				end
			else
				if(add_cnt_baud)
					if(end_cnt_baud)
						cnt_baud <= 0;
					else
						cnt_baud <= cnt_baud + 1'b1;
				else
					cnt_baud <= cnt_baud;
		end
	
	assign	add_cnt_baud	=	state_c != IDLE;
	assign	end_cnt_baud	=	add_cnt_baud && cnt_baud == ((state_c==STOP)?(BAUD_MAX>>1)+(BAUD_MAX>>2):(BAUD_MAX-1));
	
//cnt_bit
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt_bit <= 0;
				end
			else
				if(add_cnt_bit)
					if(end_cnt_bit)
						cnt_bit <= 0;
					else
						cnt_bit <= cnt_bit + 1'b1;
				else
					cnt_bit <= cnt_bit;
		end
	
	assign	add_cnt_bit	=	state_c == DATA	&&	end_cnt_baud;
	assign	end_cnt_bit	=	add_cnt_bit	&& cnt_bit == DATA_LENTH - 1;
	
/************************结束信号***************************/	
//tx_done
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					tx_done <= 0;
				end
			else
				begin
					tx_done <= stop2idle;
				end
		end
	
//ready
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					ready <= 0;
				end
			else
				begin
					ready <= state_n == IDLE;
				end
		end
	
	
endmodule 