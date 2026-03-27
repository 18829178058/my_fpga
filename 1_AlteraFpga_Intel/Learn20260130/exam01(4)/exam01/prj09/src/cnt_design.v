module		cnt_design
(

			//系统相关
			input				clk,	//系统时钟
			input				rst_n,//系统复位
			//计数器输出
			output reg[63:0]	cnt0,	//计数器输出，默认64位
			output[63:0]		cnt1	//计数器输出，默认64位


);
//普通计数///////////////////////////
always 		@(posedge			clk	or		negedge			rst_n)
			if(rst_n==1'b0)
					cnt0			<=		64'd0;
			else   if(cnt0		==		64'HFFFFFFFFFFFFFFFF)
					cnt0			<=		64'd0;
			else 
					cnt0			<=  	cnt0   +  1'b1;

//预定标计数///////////////////////////
reg	[3:0]	cnt_l  ;
reg [63:4]	cnt_h;
always 		@(posedge			clk	or		negedge			rst_n)
			if(rst_n==1'b0)
					cnt_l  		<=		4'd0;
			else 	
					cnt_l  		<=		cnt_l  +   1'b1;					
always 		@(posedge			clk	or		negedge			rst_n)
			if(rst_n==1'b0)
				cnt_h			<=   60'd0;
			else if(cnt_l      ==   4'hF)		
				cnt_h			<=cnt_h			+1'b1;	
					
					
assign 			cnt1  =    {cnt_h[63:4],cnt_l[3:0]};



endmodule 