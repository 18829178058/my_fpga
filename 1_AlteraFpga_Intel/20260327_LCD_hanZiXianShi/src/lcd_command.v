//lcd命令与初始化
//端口定义
module lcd_command
(
    input        lcd_clk,
	input        rst_n,
	input        [3:0]  shift_cnt,   //移位计数器，用于控制数据传输时序
	
	output reg   lcd_rs,             //命令和数据选择 0为命令，1为数据
	output reg   lcd_res,            //lcd软复位
	output reg   shift_en,           //移位使能信号，控制数据发送
	output reg [7:0] data            //要发送到LCD的8位数据
);

//内部变量
	reg  [4:0]   state;
	reg  [3:0]   cnt;      //计数复位延时1us,最大值为9
	
    reg  [3:0]   m;        //页地址计数器
	reg  [7:0]   n;        //列地址计数器
	reg  [9:0]   addr;
	
	wire [7:0] q;

//状态机
	always @ (posedge lcd_clk or negedge rst_n)
	    begin
	        if(!rst_n)
			    begin
				    state <= 0;
					data <= 0;
					lcd_res <= 0;
					lcd_rs <= 0;
					shift_en <= 0;
					cnt <= 0;
					m <= 0;
					n <= 0;
				end
			else
			    case(state)
					0	:	begin   //复位等待状态
								if(cnt < 9)      //未计满1us
									begin
										cnt <= cnt + 1;
										lcd_res <= 0;
									end
								else
								    begin
									    cnt <= 0;          
										lcd_res <= 1;          //释放复位
										data <= 8'he2;         //发送第一个命令（系统复位）
										state <= 1;            //跳转到转态1（软复位）
									end
					        end
							
					1	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'h2c;         //发送第二个命令（升压步骤1）
										state <= 2;            //跳转到状态2
										shift_en <= 0;         //停止移位使能
									end
								else
								    shift_en <= 1;             //发送当前数
							end
							
					2	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'h2e;         //发送第三个命令（升压步骤2）
										state <= 3;            //跳转到状态3
										shift_en <= 0;         //停止移位使能
									end
								else
								    shift_en <= 1;             //发送当前数
							end
					
					3	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'h2f;         //发送第4个命令（升压步骤2）
										state <= 4;            //跳转到状态4
										shift_en <= 0;         //停止移位使能
									end
								else
								    shift_en <= 1;             //发送当前数
							end
				
					4	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'h23;         //发送第5个命令（粗调对比度）
										state <= 5;            //跳转到状态5
										shift_en <= 0;         //停止移位使能
									end
								else
								    shift_en <= 1;             //发送当前数
							end
				
					5	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'h81;         //发送第6个命令（微调对比度）
										state <= 6;            //跳转到状态5
										shift_en <= 0;         //停止移位使能
									end
								else
								    shift_en <= 1;             //发送当前数
							end
			
					6	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'h23;         //发送第7个命令（微调对比度的值），对比度1
										state <= 7;            //跳转到状态7
										shift_en <= 0;         //停止移位使能
									end
								else
								    shift_en <= 1;             //发送当前数
							end
			
	 				7	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'ha2;         //发送第8个命令（偏压比）
										state <= 8;            //跳转到状态8
										shift_en <= 0;         //停止移位使能
									end
								else
								    shift_en <= 1;             //发送当前数
							end
							
					8	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'hc0;         //发送第9个命令（行扫描顺序）显示方向设置
										state <= 9;            //跳转到状态9
										shift_en <= 0;         //停止移位使能
									end
								else
								    shift_en <= 1;             //发送当前数
							end
							
					9	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'ha1;         //发送第10个命令（列扫描顺序）行输出的方向
										state <= 10;            //跳转到状态10
										shift_en <= 0;         //停止移位使能
									end
								else
								    shift_en <= 1;             //发送当前数
							end
							
					10	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'haf;         //发送第11个命令（开关）
										state <= 11;            //跳转到状态11
										shift_en <= 0;         //停止移位使能
									end
								else
								    shift_en <= 1;             //发送当前数
							end
							
					11	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'hb0;         //发送第12个命令（设置页地址）
										state <= 12;            //跳转到状态12
										shift_en <= 0;         //停止移位使能
									end
								else
								    shift_en <= 1;             //发送当前数
							end
					//设置显示RAM地址并写入数据	
					12	:	begin
								if(m < 8)  //检查所有8页是否都处理完
									if(shift_cnt == 8)
										begin
											data <= 8'h10;			//设置列地址高4位（列地址高四位为1）
											state <= 13;
											shift_en <= 0;
										
										end
									else
										shift_en <= 1;
								else
									state <= 16;	//初始化已完成，转空闲状态
							end
							
					13	:	begin
								if(shift_cnt == 8)
									begin
										data <= 8'h00;			//设置列地址低4位
										state <= 14;
										shift_en <= 0;
									
									end
								else
									shift_en <= 1;
							end
					
					14	:	begin                       //写一页数据
								if(shift_cnt == 8)
									begin
									//	data <= q;
										state <= 15;
										shift_en <=0;
									end
								else
									shift_en <= 1;
							end
							
					15	:	begin								//写入显示数据（填充一整行）								
								data <= q;
								if(n < 128)						//一行有128个像素点
									begin
										lcd_rs <= 1;			//设置为数据模式
										if(shift_cnt < 8)		//判断指令是否发生完成
											shift_en <= 1;
										else
											begin
												shift_en <= 0;
												n <= n + 1;		         //地址递增
												addr <= m*112 + n;       //112是工具生成数据的一半
												if(n == 112)	         //写完一行（128个字节
													m <= m + 1;          //页地址递增，准备下一行
												else
													m <= m;
											end
									
									end
								else
									begin
										n <= 0;					//列地址清零
										data <= 8'hb0 + m;		//发送
										state <= 12;
										lcd_rs <= 0;
									end
							end
				16	:	begin
							state <= 16;    //空闲状态，必须保持
						end
				default : state <= 0;
				endcase
	    end 
		
my_rom my_rom_inst
(
	.address(addr),
	.clock(lcd_clk),
	.q(q)
);	
		
endmodule