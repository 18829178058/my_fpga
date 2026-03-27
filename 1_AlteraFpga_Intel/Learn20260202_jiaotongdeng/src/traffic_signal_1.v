module traffic_signal
(
    input clk,    //系统时钟,50MHz
	input rst_n,  //系统复位
	output reg [3:0] signal    //输出信号
);

reg [3:0] state;   //状态

localparam  red  			= 4'b0001,
			red2green 		= 4'b0010,
			green           = 4'b0100,
			green2red       = 4'b1000;    //状态变量
			
	reg [32:0] cnt;     //计数器，用来计算时间

//state = sm(s,t)
always   @(posedge clk or negedge rst_n) begin
         $display("state = %b", state);
         if(rst_n == 1'b0) begin
			state <= red;
		 end else case(state)
		    red:    if(cnt == (33'd60)) //60s内显示红灯
                         state <= red2green;//转换到下一个状态，过渡状态黄灯，red->green,显示5s
			red2green:	if(cnt == 33'd65) //
                            state <= green;
			green:      if(cnt == (33'd105)) //显示绿灯40s
                            state <= green2red;
			green2red:   if(cnt == (33'd110-1'b1)) //转换到下一个状态，过渡状态黄灯，green->red,显示5s
                            state <= red;
				   endcase
			end

always   @(posedge clk or negedge rst_n)
         if(rst_n == 1'b0 || cnt ==  33'd110) begin
		    cnt <= 33'd0;
		 end else begin
			cnt = cnt + 1'b1;
			$display("cnt = %d", cnt);
			signal <= state;
	     end

endmodule