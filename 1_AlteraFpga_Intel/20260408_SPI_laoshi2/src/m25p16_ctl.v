module m25p16_ctl
(
	//系统相关
	input				clk,
	input				rst_n,
			
	input				rq,
	input				we,
	input	[23:0]		laddr,
	output				rddata,
	output				rddata_vld,
	input				[7:0] wrdata,
	output				ld,
	input				[23:0] byte_cnt,
	
	output				req,
	input				done,
	output				[7:0] din,
	input				load,
	input 				[7:0]dout,
	input				dout_vld,
	output				stop
);

//==================状态定义==================
localparam		IDLE		=	4'd0;
				WEN_SNT		=	4'd1;
				WIP_0       =   4'd2;
				EAR_SNT     =   4'd3;
				WIP_1       =   4'd4;
				PG_SNT      =   4'd5;
				DSWEN_SNT   =   4'd6;
				WIP_2       =   4'd7;
				READ_DATA   =   4'd8;

endmodule

reg  [3:0]		c_state, n_state;

//状态寄存
always @(posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			c_state <= IDLE；
		else
			c_state <= n_state;
	end
	
//状态转移条件写转态转移
always	@	(*)
	begin
		case(c_state)
			IDLE		:	if(req)	
								if(we)
									n_state = WEN_SNT;
								else
									n_state	= DSWEN_SNT;
							else
								n_state = n_state;
								
	        WEN_SNT		:	if(done)
								n_state = WIP_0;
							else
								n_state = n_state;
								
	        WIP_0   	:	if(done	& (~dout[0])) 
								n_state = EAR_SNT;
							else
								n_state = n_state;
								
			EAR_SNT  	:	if(done)
								n_state = WIP_1;
							else
								n_state = n_state;
								
            WIP_1    	:	if(done	& (~dout[0])) 
								n_state = PG_SNT;
							else
								n_state = n_state;
								
            PG_SNT   	:	if(done)
								n_state = IDLE;
							else
								n_state = n_state;
			
            DSWEN_SNT	:	if(done)
								n_state = WIP_2;
							else
								n_state = n_state;
								
            WIP_2    	:	if(done	& (~dout[0])) 
								n_state = READ_DATA;
							else
								n_state = n_state;
							
            READ_DATA	:	if(done)
								n_state = IDLE;
							else
								n_state = n_state;
								
			default	:	n_state = IDLE;	
			
		endcase
	end
	
	
//状态输出
always	@ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			begin
				rddata <= 8'b0;
				rddata_vld <= 1'b0;
				ld <=  1'b0;
				req <= 1'b0;
				din	<= 8'b0;
				stop <= 1'b0;
			end
		else case(n_state)
			IDLE		:	begin
								rddata <= 8'b0;
								rddata_vld <= 1'b0;
								ld <=  1'b0;
								req <= 1'b0;
								din	<= 8'b0;
								stop <= 1'b0;
							end
					
			WEN_SNT		:	begin
								if(done)
									req<=0;
								else 
									req<=1;
									
								if(load)
									din<=8’h06;
									
								if(done)
									stop<=0;
								else
									if(load)
										stop<=1;
							end
					
					
					
			WIP_0   	:	begin
								if(done)
									req<=0;
								else 
									req<=1;
									
								if(load)
									din<=8’h05;
									
								if(load)
									if(cnt==1)
										cnt<=0;
									else
										cnt<=cnt+1;
										
								if(done)
									stop<=0;
								else
									if(load & cnt==1)
										stop<=1;

							end
					
					
					
					
			EAR_SNT  	:begin
							if(done)
								req<=0;
							else 
								req<=1;
								
							if(load)
								din<=8’hC7;
								
							if(done)
								stop<=0;
							else
								if(load)
									stop<=1;
						end
					
					
					
					
			WIP_1    :	begin
								if(done)
									req<=0;
								else 
									req<=1;
									
								if(load)
									din<=8’h05;
									
								if(load)
									if(cnt==1)
										cnt<=0;
									else
										cnt<=cnt+1;
										
								if(done)
									stop<=0;
								else
									if(load & cnt==1)
										stop<=1;

							end
					
					
					
					
			PG_SNT   	:	begin
								if(done)
									req<=0;
								else 
									req<=1;
									
								if(load)
									din<=8’h05;
									
								if(load)
									if(cnt==259)
										cnt<=0;
									else
										cnt<=cnt+1;
										
								if(done)
									stop<=0;
								else
									if(load & cnt==259)
										stop<=1;
							end
					
			DSWEN_SNT	:	begin
								if(done)
									req<=0;
								else 
									req<=1;
									
								if(load)
									din<=8’h04
									
								if(done)
									stop<=0;
								else
									if(load)
										stop<=1;
							end
					
					
					
					
			WIP_2    :	begin
								if(done)
									req<=0;
								else 
									req<=1;
									
								if(load)
									din<=8’h05;
									
								if(load)
									if(cnt==1)
										cnt<=0;
									else
										cnt<=cnt+1;
										
								if(done)
									stop<=0;
								else
									if(load & cnt==1)
										stop<=1;

							end
					
					
					
					
			READ_DATA	:	begin
								if(done)
									req<=0;
								else 
									req<=1;
									
								if(load)
									din<=8’h05;
									
								if(load)
									if(cnt==bye_cnt+4-1)
										cnt<=0;
									else
										cnt<=cnt+1;
										
								if(done)
									stop<=0;
								else
									if(load & cnt==byte_cnt+4-1)
										stop<=1;
							end
			default: ;
		endcase
	end