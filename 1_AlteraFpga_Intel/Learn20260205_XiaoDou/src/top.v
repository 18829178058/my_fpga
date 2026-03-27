module  top
(
				//系统相关
				input clk,   //系统时钟，50MHz
				input rst_n, //系统复位，默认低电平有效
				//传感器输入信号
				input s0_i,   //0.5元硬币投币，通过按键模拟
				input s1_i,   //1元硬币投币，通过按键模拟
				//出货找零信号
				output led_sale, //当出货的时候led点亮10s
				output led_z0ps //当找零的时候led点亮10s

);

wire s0_temp_i;   //0.5元硬币投币，通过按键模拟
wire s1_temp_i;   //1元硬币投币，通过按键模拟 

key_delate  key_delate_inst1
(
			.clk(clk),               //系统时钟，默认50MHz
			.rst_n(rst_n),             //系统复位，低电平有效
			.s_i(s0_i),               //按键输入
			.s_o(s0_temp_i)     //按键消抖后输出
);


key_delate  key_delate_inst2
(
			.clk(clk),               //系统时钟，默认50MHz
			.rst_n(rst_n),             //系统复位，低电平有效
			.s_i(s1_i),               //按键输入
			.s_o(s1_temp_i)     //按键消抖后输出
);


sale_auto_3 sale_auto_3
(
				//系统相关
				.clk(clk),   //系统时钟，50MHz
				.rst_n(rst_n), //系统复位，默认低电平有效
				//传感器输入信号
				.s0_i(s0_temp_i),   //0.5元硬币投币，通过按键模拟
				.s1_i(s1_temp_i),   //1元硬币投币，通过按键模拟
				//出货找零信号
				.led_sale(led_sale), //当出货的时候led点亮10s
				.led_z0ps(led_z0ps) //当找零的时候led点亮10s
);
endmodule