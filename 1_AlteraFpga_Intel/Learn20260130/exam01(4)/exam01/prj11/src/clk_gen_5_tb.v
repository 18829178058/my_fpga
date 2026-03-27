`timescale 1ns/1ns
module					clk_gen_5_tb;
//系统有关
reg						clk_in	;//分频器源时钟，默认50mhz
reg						rst_n	;//系统复位，默认低电平有效
initial					begin
						clk_in		=  0;
						rst_n		=  0;
						#53				;
						rst_n		=  1;

end
always 					#10 	clk_in =~clk_in;//产生50mhz的时钟测试激励信号
//分频器输出
wire					clk_out	;//分频器输出，默认10mhz，默认为门控时钟
clk_gen_5				clk_gen_5_ins
(		
						//系统有关
						.clk_in(clk_in)	,//分频器源时钟，默认50mhz
						.rst_n(rst_n)	,//系统复位，默认低电平有效
						//分频器输出
						.clk_out(clk_out)	//分频器输出，默认10mhz，默认为门控时钟
);
endmodule 