module  		clk_gen_4
(
				//系统有关
				input				clk_in,	//分频器源时钟，默认50mhz
				input				rst_n,	//系统复位，默认低电平有效
				//分频器输出
				output	reg			clk_out	//分频器输出，默认12.5mhz
);
//K=50mhz/12.5mhz=4，K/2-1=  1
reg  [1:0]		cnt;
always 			@(posedge			clk_in			or		negedge			rst_n)
				if(rst_n==1'b0)
					cnt 			<=		2'd0;
				else  if(cnt==2'd1)
					cnt 			<=		2'd0;	
				else 
					cnt				<=   cnt   +   1'b1;



always 			@(posedge			clk_in			or		negedge			rst_n)
				if(rst_n==1'b0)
								clk_out   <=  1'b0;
				else  if(cnt==2'd1)
								clk_out   <=  ~clk_out;
endmodule 