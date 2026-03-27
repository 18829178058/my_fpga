module			sale_auto
(
				//系统相关
				input			clk,	//系统时钟，默认100mhz
				input			rst_n,	//系统复位，默认低电平有效
				//传感器输入信号
				input			s0_o,	//0.5元硬币投币 ，默认通过按键模拟
				input			s1_o,	//1元硬币投币，默认通过按键模拟
				//出货找零
				output			led_sale,	//当出货的时候led点亮10s
				output			led_z0p5	//当找零的时候led点亮10s
);
/*
total:
001:0.5元
010:1元
011:1.5元
100：2


*/
////////////边沿检测///////////////////////////////////////////
reg				s0_o1,	s0_o2;
always 			@(posedge		clk)begin
				s0_o1  <=s0_o;
				s0_o2  <=s0_o1;	
end
wire			f_s0_o;
assign 			f_s0_o  =   ({s0_o2,s0_o1}==2'b10)  ? 1'b1:1'b0;

reg				s1_o1,	s1_o2 ;	
always 			@(posedge		clk)begin
				s1_o1 <= s1_o;
				s1_o2 <= s1_o1;
end		

wire			f_s1_o;
assign 			f_s1_o  =   ({s1_o2,s1_o1}==2'b10) ? 1'b1:1'b0;

		
localparam		ML_INPUT		=2'd0,
				ML_0P5			=2'd1,
				ML_1			=2'd2;
reg 	[1:0]	state;
//第1段//////////////////////////////////////////////////////////////////
always 			@(posedge		clk	or			negedge			rst_n)
				if(rst_n==1'b0)
					state		<=  ML_INPUT;
				else case(state)
					ML_INPUT		:case({f_s1_o,f_s0_o})
										 2'b01:state		<=  ML_0P5;	
										 2'b10:state		<=  ML_1;	
										 default:state		<=state;
									 endcase
					ML_0P5			:case({f_s1_o,f_s0_o})
										 2'b01:state		<=  ML_1;	
										 2'b10:state		<=  ML_INPUT;	
										 default:state		<=state;
									 endcase
					ML_1			:
									case({f_s1_o,f_s0_o})
										 2'b01:state		<=  ML_INPUT;	
										 2'b10:state		<=  ML_INPUT;	
										 default:state		<=state;
									 endcase
					default			:state		<=  ML_INPUT;
				endcase
					


reg 			led_sale_tmp,led_z0p5_tmp;
always 			@(posedge		clk	or			negedge			rst_n)
				if(rst_n==1'b0)begin
					led_sale_tmp  <=  1'b0;
					led_z0p5_tmp  <=  1'b0;end
				else case(state)
					 ML_0P5 :if({f_s1_o,f_s0_o} ==  2'b10)begin
									led_sale_tmp  <=  1'b1;
									led_z0p5_tmp  <=  1'b0;end
							 else  begin
									led_sale_tmp  <=  1'b0;
									led_z0p5_tmp  <=  1'b0;end
					 ML_1   :case({f_s1_o,f_s0_o})
									2'b01:begin
											led_sale_tmp  <=  1'b1;
											led_z0p5_tmp  <=  1'b0;end
									2'b10:begin
											led_sale_tmp  <=  1'b1;
											led_z0p5_tmp  <=  1'b1;end
									default :begin
											led_sale_tmp  <=  1'b0;
											led_z0p5_tmp  <=  1'b0;end
							endcase
					default :begin
											led_sale_tmp  <=  1'b0;
											led_z0p5_tmp  <=  1'b0;end
				endcase					 							
/////////////////点亮led灯///////////////////////////////////////////////////////////
reg	[29:0]		 cnt0,cnt1;
always 			@(posedge		clk	or			negedge			rst_n)
				if(rst_n==1'b0)
						cnt0 <=  30'd0;
				else  if(cnt0 ==  30'd1000000000)
						cnt0 <=  30'd0;
				else  if(cnt0==0)begin
				            if(led_sale_tmp==1'b1)
				                    cnt0 <=cnt0 +  1'b1;
				            else 
		                              cnt0 <=  30'd0;
				end else 
				                    cnt0 <=cnt0 +  1'b1;
always 			@(posedge		clk	or			negedge			rst_n)
				if(rst_n==1'b0)
						cnt1 <=  30'd0;
				else  if(cnt1 ==  30'd1000000000)
						cnt1 <=  30'd0;
				else  if(cnt1==0)begin
				      if(led_z0p5_tmp == 1'b1)
				            cnt1 <=cnt1 +  1'b1;
				      else 
				              cnt1 <=  30'd0; 
				end else     
				        cnt1 <=cnt1 +  1'b1;

assign 			led_sale= cnt0>1  ?  1'b0:1'b1; 
assign 			led_z0p5= cnt1>1  ?  1'b0:1'b1; 
endmodule 