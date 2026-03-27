module				seq_check
(
					//系统相关
					input				clk,	//系统时钟，默认50mhz
					input				rst_n,	//系统复位，低电平有效
					//随机序列输入
					input				seq_i,	//随机待检测的序列
					//输出检测标志
					output	reg			seq_o	//当检测到“1011”的时候程序一个clk周期的高电平，其余为低电平
					//Note:本序列检测为聚合检测
);
reg [1:0]			state;//定义状态变量，默认自然二进制数码
//状态编码
localparam			S_1					=2'd0,
					S_10				=2'd1,
					S_101				=2'd2,
					S_1011				=2'd3;

//state  =  sm(s,t)
always 				@(posedge			clk			or			negedge			rst_n)
					if(rst_n==1'b0)
						state			<=  	S_1;
					else case(state)
						 S_1			:if(seq_i==1'b1)state<=S_10;
						 S_10			:if(seq_i==1'b0)state<=S_101;
						 S_101			:if(seq_i==1'b1)
													state<=S_1011;
										 else 
													state<=S_1;
						
						S_1011			:if(seq_i==1'b1)
													state<=	S_10;
										 else 
													state<=	S_101;
						default			:state			<=  	S_1;
					endcase
					
//R	  =  FSM(s,state)
always 				@(posedge			clk			or			negedge			rst_n)
					if(rst_n==1'b0)
						seq_o			<=		1'b0;
					else  if(  (state==S_1011) & (seq_i==1'b1) )
						seq_o			<=		1'b1;
					else 
						seq_o			<=		1'b0;
endmodule 