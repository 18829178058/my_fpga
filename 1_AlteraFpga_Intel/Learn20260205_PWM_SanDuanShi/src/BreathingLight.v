module   BreathingLight  //呼吸灯模块周期2s
(
          input           clk,         //系统时钟，50MHz
          input           rst_n,       //系统复位，低电平有效
          output          led_out      //pwm输出，控制led，呈现呼吸效果
);

/////////////////////////5分频//////////////////////////////

reg  clk1,clk2;
wire clk3;

reg [2:0] cnt1;

assign clk3 = clk1 | clk2;

always @(posedge clk or negedge rst_n)
			if(rst_n == 1'b0)
			   cnt1 <= 3'b0;
			else if(cnt1 == 4)
			   cnt1 <= 3'b0;
			else
               cnt1 <= cnt1 + 1;

always @(posedge clk or negedge rst_n)
			if(rst_n == 1'b0)
			   clk1 <= 1'b0;
			else if(cnt1 == 4 || cnt1 ==2)
			   clk1 <= ~clk1;

always @(negedge clk or negedge rst_n)
			if(rst_n == 1'b0)
			   clk2 <= 1'b0;
			else if(cnt1 == 4 || cnt1 ==2)
			   clk2 <= ~clk2;

reg [14:0] cnt2, cnt3, cnt4;

reg [1:0] state;
localparam hu = 2'b00,
           xi = 2'b01;

always @(posedge clk3 or negedge rst_n)
			if(rst_n == 1'b0) begin
				cnt2 <= 15'd0;
				cnt3 <= 15'd0;
				state <= hu;
			end else case(state)
			    hu: if(cnt2 < 15'd1000)
			            if(cnt3 < 15'd1000) begin
				            if(cnt3 < cnt2)
								cnt4 <= 1'b1;
					        else 
						        cnt4 <= 1'b0;
							cnt3 <= cnt3 + 1'b1;
						end else begin
						     cnt2 <= cnt2 + 1'b1;
							 cnt3 <= 1'b0;
							 cnt4 <= 1'b0;
							 
					    end
					else begin
					    cnt2 <= 15'd0;
						state <= xi;
					end
			    xi:if(cnt2 < 15'd1000)
			            if(cnt3 < 15'd1000) begin
				            if(cnt3 < cnt2)
								cnt4 <= 1'b0;
					        else 
						        cnt4 <= 1'b1;
							cnt3 <= cnt3 + 1'b1;
						end else begin
						     cnt2 <= cnt2 + 1'b1;
							 cnt3 <= 1'b0;
							 cnt4 <= 1'b0;
							 
						end
					else begin
					    cnt2 <= 15'd0;
					    state <= hu;
					end
			    default:begin
                             cnt2 <= 15'd0;
				             cnt3 <= 15'd0;
				             cnt4 <= 1'b0;
				             state <= xi;
			            end	
			    endcase							 

assign led_out = cnt4? 1'b0 : 1'b1;

endmodule