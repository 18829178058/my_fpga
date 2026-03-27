`timescale 1ns/1ns
module				seq_check_tb;
//系统相关
reg					clk;	//系统时钟，默认50mhz
reg					rst_n;	//系统复位，低电平有效
initial				begin
					clk		=1'b0;
					rst_n	=1'b0;
					#53  rst_n	=1'b1;
end	
always 				#2 	clk  =~clk;
//随机序列输入	
wire				seq_i;	//随机待检测的序列
reg		[7:0]		data_radim;
assign 				seq_i = data_radim[6]  ^  data_radim[2];
	
	
always 				@(posedge		clk			or		negedge			rst_n)
					if(rst_n==1'b0)
						data_radim		<=		8'd0;
					else 
						data_radim		<={$random}%256;	
//输出检测标志
wire				seq_o;	//当检测到“1011”的时候程序一个clk周期的高电平，其余为低电平
//Note:本序列检测为聚合检测
seq_check			seq_check_ins
(
					//系统相关
					.clk(clk),	//系统时钟，默认50mhz
					.rst_n(rst_n),	//系统复位，低电平有效
					//随机序列输入
					.seq_i(seq_i),	//随机待检测的序列
					//输出检测标志
					.seq_o(seq_o)	//当检测到“1011”的时候程序一个clk周期的高电平，其余为低电平
					//Note:本序列检测为聚合检测
);
endmodule 