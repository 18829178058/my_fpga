//端口定义
module keyboard_state3(clk, rst_n, row, col, key_data, flag);
	
	input clk, rst_n;
	
	input [3:0] row;
	
	output reg [3:0] col;
	
	output reg [3:0] key_data;
	
	output reg 		  flag;
	
//参数
	parameter	CNT_MAX = 25_000;
	parameter	IDLE		=	2'b00,
					SCAN		=	2'b01,
					DOUT		=	2'b10;
					
//变量
	reg	[14:0]	cnt_1ms;
	wire				add_cnt_1ms;
	wire				end_cnt_1ms;
	
	reg				clk_1ms;
	
	reg				c_state, n_state;
	reg	[7:0]		coordinate;
	reg	[3:0]		cnt_filter;
	
	
//1ms计数器
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt_1ms <= 15'd0;
					clk_1ms <= 1'b0;
				end
			else
				if(add_cnt_1ms)
					if(end_cnt_1ms)
						begin
							cnt_1ms <= 15'd0;
							clk_1ms <= ~clk_1ms;
						end
					else
						begin
							cnt_1ms <= cnt_1ms + 1'b1;
							clk_1ms <= clk_1ms;
						end
				else
					begin
						cnt_1ms <= cnt_1ms;
						clk_1ms <= clk_1ms;
					end
		end
	
	assign	add_cnt_1ms = 1;
	assign	end_cnt_1ms = add_cnt_1ms && cnt_1ms == CNT_MAX - 1;
	

//状态机第一段，时序逻辑描述状态转移
	always @ (posedge clk_1ms, negedge rst_n)
		begin
			if(!rst_n)
				begin
					c_state <= IDLE;
				end	
			else
				c_state <= n_state;
		end
	
//状态机第二段，组合逻辑描述状态转移逻辑
	always @ (*)
		begin
			case(c_state)
				IDLE	:	begin
								if(row != 4'b1111)
									if(cnt_filter < 9)
										n_state = IDLE;
									else
										n_state = SCAN;
								else
									n_state = IDLE;
							end
				
				SCAN	:	begin
								if(row == 4'b1111)
									n_state = SCAN;
								else
									n_state = DOUT;
							end
				
				DOUT	:	begin
								if(row == 4'b1111)
									if(cnt_filter < 9)
										n_state = DOUT;
									else
										n_state = IDLE;
							end
				
				default	:	n_state = IDLE;
			endcase
		end

//状态机第三段，时序逻辑描述输出
	always @ (posedge clk_1ms, negedge rst_n)
		begin
			if(!rst_n)
				begin
					col <= 4'b0000;
				end
			else
				case(c_state)
					IDLE	:	begin
									if(row != 4'b1111 && cnt_filter == 9)
										col <= 4'b0111;
									else
										col <= 4'b0000;
								end
					
					SCAN	:	begin
									if(row == 4'b1111)
										col <= {col[2:0], col[3]};
									else
										col <= 4'b0000;
								end
					
					DOUT	:	begin
									col <= 4'b0000;
								end
					default	:	col <= 4'b0000;
					endcase
		end
	
	always @ (posedge clk_1ms, negedge rst_n)
		begin
			if(!rst_n)
				cnt_filter <= 4'd0;
			else
				if((c_state == IDLE && row != 4'b1111) || 
					(c_state == DOUT && row == 4'b1111) && (cnt_filter < 9))
					cnt_filter <= cnt_filter + 1;
				else
					cnt_filter <= 4'd0;
		end
		
	always @ (posedge clk_1ms, negedge rst_n)
		begin
			if(!rst_n)
				begin
					flag <= 0;
				end
			else
				if(c_state == SCAN && row != 4'b1111)//扫描成功
					flag <= 1;
				else
					flag <= 0;
		end
		
	always @ (posedge clk_1ms, negedge rst_n)
		begin
			if(!rst_n)
				begin
					coordinate <= 0;
				end
			else
				if(c_state == SCAN && row != 4'b1111)
					coordinate <= {row, col};
				else
					coordinate <= coordinate;
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