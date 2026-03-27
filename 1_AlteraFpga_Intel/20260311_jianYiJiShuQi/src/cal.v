module	cal
(
	input clk,
	input rst_n,
	input [3:0] key_data,
	input flag,			//按键使能信号，1代表按键按下
	output reg [19:0] dout
);

//参数定义
	parameter	ONE_NUM = 2'b00,
				TWO_NUM = 2'b01,
				RESULT  = 2'b10;

//内部变量
	reg flag_buff1;
	reg flag_buff2;
	
	wire flag_pose;
	
	reg [19:0]	num1, num2, result;
	
	reg [3:0] symbol;
	
	reg [1:0] c_state, n_state;
	

//flag 打拍，锁沿
	always@ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					flag_buff1 <= 0;
					flag_buff2 <= 0;
				end
			else
				begin
					flag_buff1 <= flag;
					flag_buff2 <= flag_buff1;
				end
		end
	
	assign flag_pose = (~flag_buff2) & flag_buff1;

//状态机第一段，时序逻辑描述转态转移
	always@(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				c_state <= ONE_NUM;
			else
				c_state <= n_state;
		end
		
		
//状态机第二段，组合逻辑描述状态转移
	always @ (*)
		begin
			case(c_state)
				ONE_NUM :	begin
								if(flag_pose && key_data >= 10 && key_data <= 13)
									n_state = TWO_NUM;
								else
									n_state	= ONE_NUM;
							end
				
				TWO_NUM :	begin
								if(flag_pose && key_data == 14)
									begin
										n_state = RESULT;
									end
								else
									n_state	= TWO_NUM;
							end
				
				RESULT :	begin
								n_state = RESULT;
							end
				default :	n_state	=	ONE_NUM;
			endcase
		end
	
	
//转态机第三段，时序逻辑描述输出

always@(posedge clk or negedge rst_n)	
	begin
		if(!rst_n)
			begin
				num1 <= 0;
				num2 <= 0;
				symbol <= 0;
			end
		else
				case(c_state)
					ONE_NUM :	begin
									if(flag_pose && key_data < 10)
										begin
											num1 <= num1*10 + key_data;
											num2 <=	num2;
											symbol <= symbol;
										end
									else
										if(flag_pose && key_data >= 10 && key_data <= 13)
											begin
												symbol <= key_data;
												num1 <= num1;
												num2 <= num2;
											end
										else	
											begin
												num1 <= num1;
												num2 <= num2;
												symbol <= symbol;
											end	
								end
					
					TWO_NUM :	begin
									if(flag_pose && key_data <10)
										begin
											num1 <= num1;
											num2 <= num2*10 + key_data;
											symbol <= symbol;
										end
									else
										begin
											num1 <= num1;
											num2 <= num2;
											symbol <= symbol;
										end
								end
					
					RESULT :	begin
									num1 <= num1;
									num2 <= num2;
									symbol <= symbol;
								end
						
					default :	begin
									num1 <= 0;
									num2 <= 0;
									symbol <= 0;
								end
				
				endcase
	end
	
//根据symbol,给result赋值
always@(*)
	begin
		if(!rst_n)
			result = 0;
		else
			case(symbol)
				10 :	result = num1 + num2;
				11 :	result = num1 - num2;
				12 :	result = num1 * num2;
				13 :	result = num1 / num2;//整数运算
				default :	result = 0;
			endcase
	end
	
	
//输出赋值dout	

always@ (*)
	begin
		if(!rst_n)
			dout = 0;
		else
			case(c_state)
				ONE_NUM :	dout = num1;
				TWO_NUM :	dout = num2;
				RESULT  :	dout = result;
				default :	dout = 0;
			endcase
	end

endmodule