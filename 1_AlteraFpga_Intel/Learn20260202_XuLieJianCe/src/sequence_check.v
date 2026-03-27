module  sequence_check
(
      input clk,        //系统时钟，默访50MHz
      input rst_n,      //系统复位，低电平有效
      //随机序列输入
      input seq_i,      //随机待检测序刿
      output reg seq_o      //当检测到1011的时候程序输出一个clk周期的高电平，其余为低电广
      //本序列检测为聚合棿浿
);

reg [1:0] state;//定义状濁变量，默认自然二进制数砿

//状濁编砿

localparam s_1 		= 		2'd0,
		   s_10 	= 		2'd1,
		   s_101 	= 		2'd2,
		   s_1011 	= 		2'd3;


//state = sm(s,t)
always @(posedge clk or negedge rst_n)
	        if(rst_n == 1'b0)
				state <= s_1;
			else case(state)
			     s_1          :if(seq_i == 1'b1)state<=s_10;
				 s_10         :if(seq_i == 1'b0)state<=s_101;
				 s_101        :if(seq_i == 1'b1)
				                       state<=s_1011;
							   else
							 		   state <= s_1;
					          
					          
				 s_1011       :if(seq_i == 1'b1)
				                       state<=s_10;
							   else
                                       state<=s_101;
            endcase

//R = FSM(s,state)
always     @(posedge clk or negedge rst_n)
            if(rst_n == 1'b0)
                seq_o <= 1'b0;
            else if((state == s_1011) & (seq_i == 1'b1))
			    seq_o <= 1'b1;
			else
			    seq_o <= 1'b0;
endmodule