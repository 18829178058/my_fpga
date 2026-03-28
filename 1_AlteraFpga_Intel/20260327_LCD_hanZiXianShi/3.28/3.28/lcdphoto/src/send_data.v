module send_data(lcd_clk, rst_n, data, shift_en, shift_cnt, lcd_rs, lcd_sda, lcd_scl, lcd_cs);
	
	input lcd_clk, rst_n;
	
	input shift_en;			//移位使能信号，高电平时开始发送数据
	
	input lcd_rs;				//
	
	input [7:0] data;			//模块发送过来的数据
	
	output reg	[3:0]	shift_cnt;			//并转串后发送数据计数
	
	output reg	lcd_sda;						//串行数据线
	
	output reg	lcd_scl;						//串行时钟线
	
	output reg	lcd_cs;						
	
	
	reg	[7:0]	temp;//寄存数据
	
	//串行时钟线
	always @ (posedge lcd_clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					lcd_scl <= 1;
				end
			else
				lcd_scl <= ~lcd_scl;	//每个时钟周期翻转一次
		end
		
	//数据并转串转换并发送
	always @ (posedge lcd_clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					temp <= 0;			//data寄存器
					lcd_sda <= 0;		//串行数据线
					lcd_cs <= 0;		//片选信号，选定通信方向，是否拉低代表通信是否开始
					shift_cnt <= 0;	
				end
			else
				begin
					lcd_cs <= 0;			//片选有效，表示开始通信
					if(shift_en == 0)		//加载新的数据data进入temp寄存,与shift_cnt==8是串联的
						temp <= data;		//可以接收新的数据
					else
						if(shift_cnt < 8 && lcd_scl == 0 && shift_en == 1)		//数据发送中且scl为低电平（数据可以更改）
							begin
								temp	<=	{temp[6:0], temp[7]};	//循环左移
								lcd_sda <= temp[7];					//发送最高位
								shift_cnt <= shift_cnt + 1;		//按位一次发送，移位计数器
							end
						else
							if(shift_cnt == 8)
								begin
									shift_cnt <= 0;	
									lcd_cs <= 1;		//片选无效，结束本次通信
								end
				end
		end
	
endmodule 