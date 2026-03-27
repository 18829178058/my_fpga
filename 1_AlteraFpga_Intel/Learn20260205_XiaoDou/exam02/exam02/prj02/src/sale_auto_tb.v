`timescale 1ns/1ns
module				sale_auto_tb;
//系统相关
reg					clk;	//系统时钟，默认100mhz
reg					rst_n;	//系统复位，默认低电平有效
initial				begin
					clk		=0;
					rst_n	=0;
					#53		rst_n	=1;

end
always 				#2		clk=~clk;


//传感器输入信号
reg				  s0;	//0.5元硬币投币 ，默认通过按键模拟
reg				  s1;	//1元硬币投币，默认通过按键模拟
initial				begin
					s0		=		1;
					s1		=		1;
					
					#				200;
					s0		=		0;
					s1		=		1;
					#               100;
					s0		=		1;
					s1		=		1;
					
						
					#200              ;
					s0		=		0;
					s1		=		1;
					#               100;
					s0		=		1;
					s1		=		1;
					
					
					
					
					#200              ;
					s0		=		0;
					s1		=		1;
					#               100;
					s0		=		1;
					s1		=		1;
					
					
					
					#200              ;
					s0		=		0;
					s1		=		1;
					#               100;
					s0		=		1;
					s1		=		1;
					
					
					
					#200              ;
					s0		=		1;
					s1		=		0;
					#               100;
					s0		=		1;
					s1		=		1;
					
					
					
					#200              ;
					s0		=		1;
					s1		=		0;
					#               100;
					s0		=		1;
					s1		=		1;
					
					
					
					#200              ;
					s0		=		1;
					s1		=		0;
					#               100;
					s0		=		1;
					s1		=		1;
					
					#200              ;
end

//出货找零
wire				led_sale;	//当出货的时候led点亮10s
wire				led_z0p5;	//当找零的时候led点亮10s

sale_auto1		sale_auto1_ins
(
				//系统相关
				.clk(clk),	//系统时钟，默认100mhz
				.rst_n(rst_n),	//系统复位，默认低电平有效
				//传感器输入信号
				.s0_i(s0),	//0.5元硬币投币 ，默认通过按键模拟
				.s1_i(s1),	//1元硬币投币，默认通过按键模拟
				//出货找零
				.led_sale(led_sale),	//当出货的时候led点亮10s
				.led_z0p5(led_z0p5)	//当找零的时候led点亮10s
);
endmodule 