module					sale_top
(
						//系统相关
						input				clk,	//系统时钟，默认50mhz
						input				rst_n,	//系统复位，低电平有效

						//按键输入
						input				s0_i,
						input				s1_i,
						
						//售货机传感器输出信号led显示
						output				led_sale,	//当出货的时候led点亮10s
					    output				led_z0p5	//当找零的时候led点亮10s

);
//按键输出
wire										s0_o;
wire										s1_o; 

key_delet				key_delet0_ins
(
						//系统相关
						.clk(clk),	//系统时钟，默认50mhz
						.rst_n(rst_n),	//系统复位，低电平有效
						//独立按键检测电平输入
						.s_i(s0_i),	//独立按键检测电平，低电平按下，有抖动
						//独立按键检测电平输出
						.s_o(s0_o)	//独立按键检测电平，低电平按下，无抖动

);

key_delet				key_delet1_ins
(
						//系统相关
						.clk(clk),	//系统时钟，默认mhz
						.rst_n(rst_n),	//系统复位，低电平有效
						//独立按键检测电平输入
						.s_i(s1_i),	//独立按键检测电平，低电平按下，有抖动
						//独立按键检测电平输出
						.s_o(s1_o)	//独立按键检测电平，低电平按下，无抖动
 
);


sale_auto				sale_auto_ins
(
						//系统相关
						.clk(clk),	//系统时钟，默认100mhz
						.rst_n(rst_n),	//系统复位，默认低电平有效
						//传感器输入信号
						.s0_o(s0_o),	//0.5元硬币投币 ，默认通过按键模拟
						.s1_o(s1_o),	//1元硬币投币，默认通过按键模拟
						//出货找零
						.led_sale(led_sale),	//当出货的时候led点亮10s
						.led_z0p5(led_z0p5)	//当找零的时候led点亮10s
);

endmodule 