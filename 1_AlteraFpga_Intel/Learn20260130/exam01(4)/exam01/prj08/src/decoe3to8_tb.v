`timescale 		1ns/1ns
module			decoe3to8_tb;

//
reg				clk;//译码器采样时钟
reg				rst_n;//译码器复位，低电平有效
initial			begin
				clk   =   1'b0;
				rst_n =   1'b0;
				#53           ;
				rst_n =   1'b1;
end
always 			#2    clk=~clk;

//激励信号
reg[2:0]		code;//译码输入
always 			@(posedge				clk			or	negedge		rst_n)
				if(rst_n==1'b0)
					code      <=   3'd0;
				else  
					code   	  <= code   +   1'b1;
//响应信号
wire[7:0]		decoe;//译码输出
decoe3to8		decoe3to8_ins
(
				//
				.clk(clk),//译码器采样时钟
				.rst_n(rst_n),//译码器复位，低电平有效
				
				//译码器输入
				.code(code),//译码输入
				
				//译码器输出
				.decoe(decoe)//译码输出
);
endmodule 