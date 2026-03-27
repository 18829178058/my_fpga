module			lut_not
(
				input			a,//非门输入信号
				output			c//非门输出信号


);
///////////////lut1构建与门//////////////////////////////////
reg 		[1:0] 				lut1;//定义lut
wire		[1:0]				addr;//定义lut输入
assign 					   addr    = 	a;
//always 							@(*)	

initial						lut1    =   2'b01;
/*
a								c
0								1
1								0


*/															
assign 							c		=  	 lut1[addr];
endmodule 