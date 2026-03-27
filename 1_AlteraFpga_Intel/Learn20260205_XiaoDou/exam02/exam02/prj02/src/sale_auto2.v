module			sale_auto2
(
				//系统相关
				input			clk,	//系统时钟，默认100mhz
				input			rst_n,	//系统复位，默认低电平有效
				//传感器输入信号
				input			s0_i,	//0.5元硬币投币 ，默认通过按键模拟
				input			s1_i,	//1元硬币投币，默认通过按键模拟
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
wire            s0,s1;
assign          s0=~s0_i;
assign          s1=~s1_i; 
reg [2:0]       total;
			
localparam		ML_INPUT		=2'd0,
				ML_INPUT_OFF	=2'd1,
				ML_0P5			=2'd2,
				ML_1			=2'd3;
reg 	[1:0]	state_cs,state_ns;
//第1段//////////////////////////////////////////////////////////////////
always 			@(posedge		clk	or			negedge			rst_n)
				if(rst_n==1'b0)
					state_cs		<=  ML_INPUT;
				else 
					state_cs		<=	state_ns;
//第2段//////////////////////////////////////////////////////////////////					
always 			@(*)begin
				state_ns			=	ML_INPUT;
				case(state_cs)
					ML_INPUT		:if(s0|s1)
											state_ns =   ML_INPUT_OFF;
									 else 
											state_ns =   ML_INPUT ;
					
					ML_0P5			:if(s0|s1)
											state_ns =   ML_INPUT_OFF;
									 else 
											state_ns =   ML_0P5;
					ML_1			:if(s0|s1)
											state_ns =   ML_INPUT_OFF;
									 else 
											state_ns =   ML_1;
					ML_INPUT_OFF	:if({s1,s0}==2'b00)
										case(total)
											3'b001:state_ns =  ML_0P5;
											3'b010:state_ns =  ML_1;
											3'b011:state_ns =  ML_INPUT;
											3'b100:state_ns =  ML_INPUT;
											default:state_ns=  ML_INPUT;
										endcase
									else 
											state_ns  =   	ML_INPUT_OFF;
					default 		:state_ns			=	ML_INPUT;
				endcase
end
always 			@(posedge		clk	or			negedge			rst_n)
				if(rst_n==1'b0)
						total<=		3'b000;
				else case(state_cs)
						ML_INPUT	:case({s1,s0})
										 2'b01:total<=		3'b001;
										 2'b10:total<=		3'b010;
										 default:total<=	3'b000;
									 endcase
						ML_0P5		:case({s1,s0})
										 2'b01:total<=		3'b010;
										 2'b10:total<=		3'b011;
										 default:total<=	total;
									 endcase
						ML_1		:case({s1,s0})
										 2'b01:total<=		3'b011;
										 2'b10:total<=		3'b100;
										 default:total<=	total;
									 endcase
						default		:total<=total;
				endcase

reg 			led_sale_tmp,led_z0p5_tmp;
always 			@(*)
				if((state_cs==ML_INPUT_OFF)&({s1,s0}==2'b00))
						case(total)
							3'b011:begin  led_sale_tmp<=1'b1;led_z0p5_tmp<=1'b0;end
							3'b100:begin  led_sale_tmp<=1'b1;led_z0p5_tmp<=1'b1;end
							default:begin  led_sale_tmp<=1'b0;led_z0p5_tmp<=1'b0;end
						endcase
				else begin
						led_sale_tmp<=1'b0;
						led_z0p5_tmp<=1'b0;end
						
								
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