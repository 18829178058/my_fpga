module				clk_gen
(
					//系统相关
					input				rst_n,	//系统复位，低电平复位
					input				clk_in,	//源时钟，默认50mhz
					//输出生成时钟
					output	reg			clk_12p5mhz,	//生成时钟，12.5mhz
					output	reg			clk_10mhz	//生成时钟，10mhz
);
//生成clk_12p5mhz时钟///////////////////////////////////////////////////////
//k=50mhz/12.5mhz =  4
reg	[1:0]			cnt0;
always 				@(posedge			clk_in				or				negedge		rst_n)
					if(rst_n==1'b0)
						  cnt0			<=		2'd0;
					else  if(cnt0  ==  2'd3 )
						  cnt0			<=		2'd0;
					else 
						  cnt0  		<=       cnt0   +     1'b1;					  
always 				@(posedge			clk_in				or				negedge		rst_n)
					if(rst_n==1'b0)	
							clk_12p5mhz  <=  1'b0;
					else  if(cnt0 ==  2'd0)
							clk_12p5mhz  <=  1'b0;
					else  if(cnt0 ==  2'd2)
							clk_12p5mhz  <=  1'b1;
							
							
//生成clk_12p5mhz时钟///////////////////////////////////////////////////////
//K= 50mhz/10mhz  =  5		
reg		[2:0]		cnt1;
always 				@(posedge			clk_in				or				negedge		rst_n)
					if(rst_n==1'b0)
							cnt1		<=   3'd0;
					else    if(cnt1 ==  3'd4)
							cnt1		<=   3'd0;
					else 	
							cnt1		<=   cnt1			+   1'b1;
							
always 				@(posedge			clk_in				or				negedge		rst_n)
					if(rst_n==1'b0)
							clk_10mhz   <=   1'b0;
					else if(cnt1 ==  2'd0)
							clk_10mhz   <=   1'b0;
					else if(cnt1 ==  2'd2)
							clk_10mhz   <=   1'b1;
endmodule 