`timescale 1ns/1ns
module			cnt_design_tb;
//激励信号
reg				clk;	//系统时钟
reg				rst_n ;//系统复位
initial			begin
				clk   =   1'b0;
				rst_n =  1'b0;
				#53			;
				rst_n =  1'b1;

end
always 			#2 	clk=~clk;
//响应信号
wire[63:0]		cnt0;	//计数器输出，默认64位
wire[63:0]		cnt1;	//计数器输出，默认64位

cnt_design	cnt_design_ins
(

			//系统相关
			.clk(clk),	//系统时钟
			.rst_n(rst_n),//系统复位
			//计数器输出
			.cnt0(cnt0),	//计数器输出，默认64位
			.cnt1(cnt1)	//计数器输出，默认64位


);
endmodule 