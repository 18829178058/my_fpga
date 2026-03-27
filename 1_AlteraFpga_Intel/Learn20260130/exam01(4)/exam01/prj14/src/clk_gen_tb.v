`timescale 1ns/1ns
module				clk_gen_tb;
//激励信号	
reg					rst_n;	//系统复位，低电平复位
reg					clk_in;	//源时钟，默认50mhz
initial				begin//{
					rst_n	=		0;
					clk_in	=		0;
					#53				 ;
					rst_n	=		1'b1;

end//}
always				#10  clk_in  =~clk_in;//源时钟为50mhz,T=20NS		

//响应
wire				clk_12p5mhz;	//生成时钟，12.5mhz
wire				clk_10mhz;	//生成时钟，10mhz


clk_gen				clk_gen_ins
(
					//系统相关
					.rst_n(rst_n),	//系统复位，低电平复位
					.clk_in(clk_in),	//源时钟，默认50mhz
					//输出生成时钟
					.clk_12p5mhz(clk_12p5mhz),	//生成时钟，12.5mhz
					.clk_10mhz(clk_10mhz)	//生成时钟，10mhz
);
endmodule 