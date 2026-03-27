module			clk_gen_5
(
				//系统有关
				input				clk_in	,//分频器源时钟，默认50mhz
				input				rst_n	,//系统复位，默认低电平有效
				//分频器输出
				output				clk_out	//分频器输出，默认10mhz，默认为门控时钟
);
reg				clk1,clk2;//产生2个翻转时钟
assign 			clk_out				=		clk1  	|   clk2;//生成门控时钟
//K=50MHZ/10mhz=5   k-1=4
reg		[2:0]	cnt;
always			@(posedge			clk_in			or		negedge			rst_n)
				if(rst_n==1'b0)
						cnt		<=		3'd0;
				else 	if(cnt==3'd4)
						cnt		<=		3'd0;
				else 
						cnt     <=  cnt  +   1'b1;

//产生第1个翻转时钟////////////////////////////////////
always			@(posedge			clk_in			or		negedge			rst_n)
				if(rst_n==1'b0)
						clk1		<=		1'b0;
				else 	if((cnt==4)   |  (cnt==2) )
						clk1		<=      ~clk1;					
//产生第2个翻转时钟////////////////////////////////////
always			@(negedge			clk_in			or		negedge			rst_n)
				if(rst_n==1'b0)
						clk2		<=		1'b0;
				else 	if((cnt==4)   |  (cnt==2) )
						clk2		<=      ~clk2;						
endmodule 