module   key_delate
(
			input clk,               //系统时钟，默认50MHz
			input rst_n,             //系统复位，低电平有效
			input s_i,               //按键输入
			output reg s_o      //按键消抖后输出
);
localparam  T_SYS      =     20;//系统时钟20ns
localparam  T_DJ       =     20_000_000;//系统时时间，20ms


///////////////状态编码声明/////////////////
reg  [1:0]   state;
localparam   PRESS_KEY       = 2'd0,  //按键刚被按下
             PRESS_KEY_DJ    = 2'd1,  //按下抖动时期
			 PRESS           = 2'd2,  //按键稳定被按下
			 UP_KEY          = 2'd3;  //按键刚被抬起以及抖动时期

///////////////第一段状态寄存与转移/////////////////
reg      [19:0]   cnt;
always   @(posedge clk  or negedge rst_n)
			if(rst_n == 1'b0)
			    state <= PRESS_KEY;
			else case(state)
			     PRESS_KEY      	:if(s_i == 1'b0)  
										state <= PRESS_KEY_DJ;
								     else 
										state <= PRESS_KEY;
                 PRESS_KEY_DJ   	:if(s_i == 1'b1)  
										state <= PRESS_KEY;
									 else  begin
										   if(cnt == (T_DJ/T_SYS)-1'b1)
											  state <= PRESS;
									       end
			     PRESS          	:if(s_i == 1'b1)  
										state <= UP_KEY;
									 else 
										state <= PRESS;
                 UP_KEY         	:if(s_i == 1'b0)  
										state <= PRESS;
									 else begin
										if(cnt == (T_DJ/T_SYS)-1'b1)
											 state <= PRESS_KEY;
										end
				default         	:state <= PRESS_KEY;
endcase



always   @(posedge clk  or negedge rst_n)
			if(rst_n == 1'b0)
			    cnt <= 20'd0;
			else case(state)
					PRESS_KEY_DJ : if(s_i == 1'b0) begin
					                      if(cnt == (T_DJ/T_SYS)-1'b1)
										       cnt <= 20'd0;
										  else
										       cnt <= cnt + 1'b1;
					               end else
								           cnt <= 20'd0;
			        UP_KEY       : if(s_i == 1'b1) begin
					                      if(cnt == (T_DJ/T_SYS)-1'b1)
										       cnt <= 20'd0;
										  else
										       cnt <= cnt + 1'b1;
					               end else
								           cnt <= 20'd0;
			        default:      cnt <= 20'd0;
			endcase

always    @(posedge clk or negedge rst_n)
            if(rst_n == 1'b0)
			    s_o <= 1'b1;
			else case(state)
			     PRESS:       s_o  <=  1'b0;
				 PRESS_KEY:   s_o  <=  1'b1;
                 default:     s_o  <=  s_o;
			endcase
endmodule