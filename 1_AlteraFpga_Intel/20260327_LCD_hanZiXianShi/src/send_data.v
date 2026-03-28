module send_data
(
	input lcd_clk,
	input rst_n,
	
	input shift_en,              //移位使能信号，高电平开始发送数据
	input lcd_rs,
	input [7:0] data,
	output reg [3:0] shift_cnt,
	output reg lcd_sda,
	output reg lcd_scl,
	output reg lcd_cs
);

	reg [7:0] temp;//寄存数据

//串行时钟线
	always @ (posedge lcd_clk or negedge rst_n)
		begin
			if(!rst_n)
				lcd_scl <= 1;
			else
				lcd_scl <= ~lcd_scl;	//每个时钟周期翻转一次
		end

//数据并转串，并发送
	always @ (posedge lcd_clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					temp <= 0;
					lcd_sda <= 0;
					lcd_cs <= 0;
					shift_cnt <= 0;
				end
			else
				begin
					lcd_cs <= 0;		//片选有效，表示开始通信
					if(shift_en == 0)	//加载新的数据data进入temp寄存
						temp <= data;
					else
						if(shift_cnt < 8 && lcd_scl == 0 && shift_en == 1)   //数据发送中且scl为低电平（数据可以更改）
								begin
								    lcd_sda <= temp[7];
									temp <= {temp[6:0],temp[7]};  //循环左移
									shift_cnt <= shift_cnt + 1;
								end
						else
							if(shift_cnt == 8)
								begin
									shift_cnt <= 0;
									lcd_cs <= 1;	//片选无效，结束本次通信
								end
				end
		end


endmodule
