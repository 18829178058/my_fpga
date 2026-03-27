//矩阵键盘，4*4，低电平列扫描法

//端口
module keyboard(clk, rst_n, row, col, key_data, flag);

	input clk, rst_n;
	
	input [3:0] row;	//行
	
	output reg [3:0] col;	//列
	
	output reg [3:0] key_data;	//输出
	
	output reg flag;

//内部参数
	
	parameter 	CNT_MAX = 25_000;//扫描计数器
	
	parameter	IDLE	=	2'b00,	//初始状态
					SCAN	=	2'b01,	//扫描
					DOUT	=	2'b10;	//按键确认与结果输出
					
//内部变量
	reg	[14:0]	cnt;		//扫描计数，分频器
	wire				add_cnt;
	wire				end_cnt;
	
	reg	clk_1k;	//1KHZ，1ms时钟
	
	reg	[1:0] state;
	reg	[7:0]	coordinate;//坐标
	reg	[3:0] cnt_filter;//消抖
	
//1ms分频
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt <= 0;
					clk_1k <= 0;
				end
			else
				if(add_cnt)
					if(end_cnt)
						begin
							cnt <= 0;
							clk_1k <= ~clk_1k;
						end
					else
						begin
							cnt <= cnt + 1'b1;
							clk_1k <= clk_1k;
						end
				else
					begin
						cnt <= cnt;
						clk_1k <= clk_1k;
					end
		end
	
	assign	add_cnt	=	1'b1;
	assign	end_cnt	=	add_cnt	&& cnt == CNT_MAX - 1'b1;
	
//状态机
	always @ (posedge clk_1k, negedge rst_n)
		begin
			if(!rst_n)
				begin
					state <= 0;
					coordinate <= 0;
					cnt_filter <= 0;
					col <= 4'b0000;
					flag <= 0;
				end
			else
				case(state)
					IDLE	:	begin
									if(row != 4'b1111)		//检测到按下
										if(cnt_filter < 9)//按下消抖10ms
											begin
												cnt_filter <= cnt_filter + 1'b1;
												state <= IDLE;
												col <= 4'b0000;
												flag <= 0;
												coordinate <= 0;
											end
										else
											begin		//消抖后进入扫描状态
												state <= SCAN;
												cnt_filter <= 0;
												col <= 4'b0111;
											end
									else
										begin	//未按下
											state <= IDLE;
											col <= 4'b0000;
											cnt_filter <= 0;
										end
								end
					
					SCAN	:	begin	//扫描
									if(row == 4'b1111)
										begin
											state <= SCAN;
											col <= {col[2:0], col[3]};	//低电平列扫描
										end
									else
										begin
											coordinate	<=	{row, col};	//坐标
											flag <= 1;
											col <= 4'b0000;//如果按键列col不为0，row无法改变提供按键
											state <= DOUT;
										end
								end
					
					DOUT	:	begin
									flag <= 0;
									if(row == 4'b1111)
										if(cnt_filter < 9)//抬起消抖10ms
											begin
												cnt_filter <= cnt_filter + 1'b1;
												state <= DOUT;
												col <= 4'b0000;
											end
										else
											begin
												cnt_filter <= 0;
												state <= 0;
											end
									else
										begin
											cnt_filter <= 0;
											state <= DOUT;
										end
								end
						default	:	state <= 0;
				endcase
		end
		
	always @ (*)
		begin
			if(!rst_n)
				begin
					key_data = 0;
				end
			else
				case(coordinate)
					//第四行
					8'b0111_0111	:	key_data	=	4'hf;//第四列
					8'b0111_1011	:	key_data	=	4'he;//第三列
					8'b0111_1101	:	key_data	=	4'hd;//第二列
					8'b0111_1110	:	key_data	=	4'hc;//第一列
					//第三行
					8'b1011_0111	:	key_data	=	4'hb;
					8'b1011_1011	:	key_data	=	4'ha;
					8'b1011_1101	:	key_data	=	4'h9;
					8'b1011_1110	:	key_data	=	4'h8;
					//第二行
					8'b1101_0111	:	key_data	=	4'h7;
					8'b1101_1011	:	key_data	=	4'h6;
					8'b1101_1101	:	key_data	=	4'h5;
					8'b1101_1110	:	key_data	=	4'h4;
					//第一行
					8'b1110_0111	:	key_data	=	4'h3;
					8'b1110_1011	:	key_data	=	4'h2;
					8'b1110_1101	:	key_data	=	4'h1;
					8'b1110_1110	:	key_data	=	4'h0;	
				endcase
		end

endmodule 