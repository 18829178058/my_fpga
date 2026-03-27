module 		and_lut
(
			//与门输入
			input				sw0,	/*与门输入信号sw0，利用按键触发，按键状态如下：
			0：按下
			1：未被按下*/
			input				sw1,	/*与门输入信号sw1，利用按键触发，按键状态如下：
			0：按下
			1：未被按下*/
			//与门输出
			output	[1:0]	led	/*与门输出，利用led检测结果是够正确，默认低电平亮
			只要有任何一个按键按下，led都是亮*/
);
///////////////lut2构建与门//////////////////////////////////
reg 		[3:0] 			lut2;//定义lut
wire		    [1:0]		addr;//定义lut输入
wire							y1;//定义lut输出
assign 					    addr    = {sw1,sw0};
always 						@(*)	lut2   =     4'b1000;
assign 						y1=  	 lut2[addr];


///////////////综合构建与门//////////////////////////////////
wire							y0;
assign 						y0=  sw0   &  sw1;  



assign 						led  =  {y1,y0};
endmodule 