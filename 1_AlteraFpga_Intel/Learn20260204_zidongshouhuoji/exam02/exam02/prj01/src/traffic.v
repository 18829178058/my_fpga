module			traffic
(
				//系统相关
				input			clk,	//系统时钟，默认mhz
				input			rst_n,	//系统复位，低电平有效
				//交通灯
				output reg[2:0]	led	/*交通控制灯
				led[2]：绿灯
				led[1]：黄灯
				led[0]：红灯*/

);
//定义状态变量寄存器
reg		[3:0]	state;
//状态编码///////////////////////////////////
localparam		RED_ON			=4'b0001,
				YELLOW_R2G		=4'b0010,
				YELLOW_G2R		=4'b0100,
				GREEN_ON		=4'b1000;

reg [31:0]		cnt;
///////state  =  sm(s,t)/////////////////////////////////

always 			@(posedge		clk	or			negedge			rst_n)
				if(rst_n==1'b0)
					state	   <=  	RED_ON;
				else case(state)
					RED_ON		:if(cnt==32'd1999999999 ) 
										state  <=  YELLOW_R2G;
								 
					YELLOW_R2G	:if(cnt==32'd249999999 ) 
										state  <=  GREEN_ON;	
					GREEN_ON	:if(cnt==32'd2999999999 ) 
										state  <=  YELLOW_G2R;
					YELLOW_G2R	:if(cnt==32'd249999999 ) 
										state  <=  RED_ON;
					default		:state	   <=  	RED_ON;
				endcase

always 			@(posedge		clk	or			negedge			rst_n)
				if(rst_n==1'b0)	
						cnt		<=	32'd0;
				else case(state)
						RED_ON	:if(cnt==32'd1999999999 ) 
									cnt		<=	32'd0;	
								 else 
									cnt		<=	cnt		+   1'b1;
						GREEN_ON:if(cnt==32'd2999999999 ) 
									cnt		<=	32'd0;	
								 else 
									cnt		<=	cnt		+   1'b1;
						YELLOW_R2G:if(cnt==32'd249999999 ) 
									cnt		<=	32'd0;	
								  else 
									cnt		<=	cnt		+   1'b1;
						YELLOW_G2R:if(cnt==32'd249999999 ) 
									cnt		<=	32'd0;	
								  else 
									cnt		<=	cnt		+   1'b1;
						default   :cnt		<=	32'd0;
				endcase				
//////////////R	  =  FSM(s,state)///////////////////////////////////
always 			@(posedge		clk	or			negedge			rst_n)
				if(rst_n==1'b0)	
						led     <=   3'b000;
				else case(state)
						RED_ON		:led     <=   3'b001;//红灯
						GREEN_ON	:led     <=   3'b100;//绿灯
						YELLOW_R2G	:led     <=   3'b010;//绿灯
						YELLOW_G2R	:led     <=   3'b010;//黄灯
						default		:led     <=   3'b000;
				endcase
endmodule 