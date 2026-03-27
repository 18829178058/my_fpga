module 		mux
(
			input  wire	  [7:0]  	a,
 			input  wire   [7:0]  	b,
			input  wire   [7:0]  	c,
			input  wire	  [1:0]		sel,
			output reg   [7:0]  	d0,
			output reg   [7:0]  	d1,
			output reg   [7:0]  	d2			

);
//第1种组合电路行为建模/////////////////////////////
always 	 	@(a,b,c,sel)//敏感信号列表
			if(sel==2'b00)
					d0  =     a;
			else  if(sel==2'b01)
					d0  =     b;
			else 
					d0  =     c;
//第2种组合电路行为建模/////////////////////////////
always 	 	@(*)//敏感信号列表，*表示该always下所描述信号之间关系所有敏感信号
			if(sel==2'b00)
					d1  =     a;
			else  if(sel==2'b01)
					d1  =     b;
			else 
					d1  =     c;
//第3种组合电路行为建模/////////////////////////////
always 	 	@*//敏感信号列表，*表示该always下所描述信号之间关系所有敏感信号
			if(sel==2'b00)
					d2  =     a;
			else  if(sel==2'b01)
					d2  =     b;
			else 
					d2  =     c;
endmodule 