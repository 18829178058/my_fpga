`timescale 1ns/1ns
module				clk_gen_tb;
//激励信号
reg					clk_in;//系统时钟，默认50mhz
reg					rst_n;	//系统复位，低电平有效
initial				begin
					clk_in  =   1'b0;
					rst_n   =   1'b0;
					#53				;
					rst_n   =   1'b1;

end
always 				#10    clk_in  =~clk_in;//产生50mhz时钟，T=20ns


//响应信号
wire				clk_out;	//生成时钟，12.5mhz，默认为门控时钟







clk_gen			clk_gen_ins
(
				//系统有关
				.clk_in(clk_in),	//系统时钟，默认50mhz
				.rst_n(rst_n),	//系统复位，低电平有效
				//输出生成时钟
				.clk_out(clk_out)	//生成时钟，12.5mhz，默认为门控时钟



);
endmodule 