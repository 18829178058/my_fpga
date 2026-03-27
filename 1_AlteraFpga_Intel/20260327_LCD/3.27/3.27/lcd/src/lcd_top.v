//lcd屏幕显示，显示黑白条
module lcd_top(clk, rst_n, lcd_rs, lcd_cs, lcd_res, lcd_sda, lcd_scl);
	
	input clk, rst_n;
	
	output lcd_rs;			//命令控制，0为命令，1为数据
	output lcd_res;		//lcd复位指令，软复位
	output lcd_cs;			//片选信号
	
	output lcd_sda;		//串行数据线
	output lcd_scl;		//串行时钟线
	
	wire	lcd_clk;
	
	lcd_pll p1(
				.inclk0(clk),
				.c0(lcd_clk));
				
	wire	[7:0]	data;
	wire	[3:0]	shift_cnt;
	wire	shift_en;
				
	lcd_command	c1(
							.lcd_clk(lcd_clk), 
							.rst_n(rst_n), 
							.shift_cnt(shift_cnt),
							.data(data), 
							.lcd_rs(lcd_rs), 
							.lcd_res(lcd_res),
							.shift_en(shift_en)
						);
	
	send_data  s1(
							.lcd_clk(lcd_clk), 
							.rst_n(rst_n), 
							.data(data), 
							.shift_en(shift_en),
							.shift_cnt(shift_cnt), 
							.lcd_rs(lcd_rs), 
							.lcd_sda(lcd_sda),
							.lcd_scl(lcd_scl), 
							.lcd_cs(lcd_cs)
						);


endmodule 