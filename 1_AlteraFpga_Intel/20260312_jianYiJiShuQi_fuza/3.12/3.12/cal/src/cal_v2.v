//第二版计算器逻辑，可退位可连续计算

//端口定义
module cal_v2(clk, rst_n, key_data, flag, dout);

	input clk, rst_n;
	
	input [3:0] key_data;
	
	input flag;//按键使能信号，为1带代表按键按下一次
	
	output	reg	[19:0] dout;
	
//参数声明
	parameter	ONE_NUM = 2'b00,
					TWO_NUM = 2'b01,
					RESULT  = 2'b10;

//变量定义
	
	reg flag_buff1;
	reg flag_buff2;
	
	wire	flag_pose;
	
	reg [19:0] num1, num2, result;

	reg [3:0] symbol;
	
	reg	[1:0] c_state, n_state;

//flag打拍，锁沿
	always @ (posedge clk, negedge rst_n)
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
	
	assign	flag_pose =  (~flag_buff2) & flag_buff1;

//状态机第一段，时序逻辑描述状态转移
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				c_state <= ONE_NUM;
			else
				c_state <= n_state;
		end
	
//状态机第二段，组合逻辑描述状态转移逻辑
	always @ (*)
		begin
			if(!rst_n)
				begin
					n_state = ONE_NUM;
				end
			else
				case(c_state)
					ONE_NUM	:	begin
										if(flag_pose && key_data >= 10 && key_data <=13)//按下运算符后跳转状态
											n_state = TWO_NUM;
										else
											n_state = ONE_NUM;//按下数字键；按下等于号；按下退位；不按
									end
					
					TWO_NUM	:	begin
										if(flag_pose && key_data == 14)//按下等于后跳转
											n_state = RESULT;
										else
										n_state = TWO_NUM;//按下数字键；按下运算符；按下退位；不按
									end
					
					RESULT	:	begin
										if(flag_pose && key_data < 10)//按下数字，开启新运算，等于归零一次
											n_state = ONE_NUM;
										else
											if(flag_pose && key_data >= 10 && key_data <=13)//按下运算符，连续运算
												n_state = TWO_NUM;
											else	
											n_state = RESULT;//按下退位；按下等于；不按
									end
					default	:	n_state = ONE_NUM;
				endcase
		end
	
//状态机第三段，时序逻辑描述输出
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					num1 <= 0;
					num2 <= 0;
					symbol <= 0;
				end
			else
				case(c_state)
					ONE_NUM	:	begin
										if(flag_pose && key_data < 10)//按下数字键
											num1 <= num1 * 10 + key_data;
										else
											if(flag_pose && key_data>=10 && key_data <= 13)//按下运算符，跳转状态
												begin
													symbol <= key_data;
													num1 <= num1;
												end
											else
												if(flag_pose && key_data == 15)//按下退位
													begin
														num1 <= num1/10;
													end
												else								//按下等于；不按
													begin
														num1 <= num1;
														symbol <= symbol;
													end
									end
						
					TWO_NUM	:	begin
										if(flag_pose && key_data <10)//按数字
											num2 <= num2 * 10 + key_data;
										else
											if(flag_pose && key_data >= 10 && key_data <= 13)//内循环，已经计算了一次，
												begin
													case(symbol)
														10	:	begin num1 <= num1 + num2; symbol <= key_data; num2 <= 0; end 
														11	:	begin num1 <= num1 - num2; symbol <= key_data; num2 <= 0; end
														12	:	begin num1 <= num1 * num2; symbol <= key_data; num2 <= 0; end
														13	:	begin num1 <= num1 / num2; symbol <= key_data; num2 <= 0; end
														default	:	;
													endcase
												end
											else
												if(flag_pose && key_data == 15)//退位
													num2 <= num2 / 10;
												else						//不按；按下等于
													num2 <= num2;
									end
					
					RESULT	:	begin
										if(flag_pose && key_data < 10)
											begin
												num1 <= key_data;
												num2 <= 0;
											end
										else
											if(flag_pose && key_data >= 10 && key_data <= 13)
												begin
													num1 <= result;
													num2 <= 0;
													symbol <= key_data;
												end
											else
												begin
													num1 <= num1;
													num2 <= num2;
													symbol <= symbol;
												end
									end
					default	:	begin
										num1 <= 0;
										num2 <= 0;
										symbol <= 0;
									end
				endcase
		end

//根据symbol，给result赋值
	always @ (*)
		begin
			if(!rst_n)
				result = 0;
			else
				case(symbol)
					10	:	result = num1 + num2;
					11	:	result = num1 - num2;
					12	:	result = num1 * num2;
					13 :	result = num1 / num2;
					default	:	result = 0;
				endcase
		end
	
//dout
	always @ (*)
		if(!rst_n)
			begin
				dout = 0;
			end
		else
			case(c_state)
				ONE_NUM	:	dout = num1;
				TWO_NUM	:	begin
									if(flag_pose && key_data < 10)
										dout <= num2;
									else
										if(flag_pose && key_data >= 10 && key_data <= 13)
											dout <= num2;
								end
				RESULT	:	begin
									if(flag_pose && key_data < 10)
										dout <= num1;
									else
										if(flag_pose && key_data >= 10 && key_data <= 13)
											dout <= num2;
										else
											dout <= result;
								end
				default	:	dout = 0;
			endcase

endmodule 