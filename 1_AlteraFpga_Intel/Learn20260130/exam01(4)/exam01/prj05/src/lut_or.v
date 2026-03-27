module 		lut_or
(
			//与门输入
			input				a,	/*与门输入信号
			0：按下
			1：未被按下*/
			input				b,	/*与门输入信号
			0：按下
			1：未被按下*/
			//与门输出
			output				c	//与门输出
);
///////////////lut2构建与门//////////////////////////////////
reg 		[3:0] 				lut2;//定义lut
wire		[1:0]				addr;//定义lut输入
assign 					    	addr    = 	{b,a};
//always 							@(*)	
initial						lut2    =    4'b1110;
assign 							c		=  	 lut2[addr];
/*真值表//////////////////////////////////////////////////////
a					b					c
0					0					0
0					1					1
1					0					1
1					1					1

*/
endmodule 