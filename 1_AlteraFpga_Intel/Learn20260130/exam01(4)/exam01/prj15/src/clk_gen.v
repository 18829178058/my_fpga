module			clk_gen
(
				//系统有关
				input				clk_in,	//系统时钟，默认50mhz
				input				rst_n,	//系统复位，低电平有效
				//输出生成时钟
				output				clk_out	//生成时钟，12.5mhz，默认为门控时钟



);
//生成12.5mhz的生成时钟/////////////////////////////////
//K=50mhz/12.5mhz=4，K/2-1=  1
reg				clk_12p5mhz;
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
								clk_12p5mhz   <=  1'b0;
				else  if(cnt==2'd1)
								clk_12p5mhz   <=  ~clk_12p5mhz;

//一级门控////////////////////////////////////////////////
reg				gate_en;//门控信号,每100ns产生8个周期的12.5mhz的时钟
reg		[5:0]	gate_cnt;//门控计数，总时间T=  100ns  +  8*80ns  = 740ns
always			@(posedge			clk_in		or		negedge				rst_n)
				if(rst_n==1'b0)
					gate_cnt	<=   	6'd0;
				else  if(gate_cnt  ==   6'd36)
					gate_cnt  	<=   	6'd0;
				else 
					gate_cnt   <=  gate_cnt  +  1'b1;
					
always			@(posedge			clk_in		or		negedge				rst_n)
				if(rst_n==1'b0)
					gate_en  <=  1'b1;
				else  if(gate_cnt>4) 
						gate_en <=  1'b0;
				else 
						gate_en  <=  1'b1;


//assign 			gate_en  = (gate_cnt>4)    ?    1'b0 :  1'b1;					



//生成门控时钟////////////////////////////////////////
assign			clk_out  =  gate_en  |  clk_12p5mhz  ;
endmodule 