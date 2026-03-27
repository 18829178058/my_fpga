/*============端口定义================*/
module  led_breadth(clk, rst_n, led);

	input clk,rst_n;
    output  led;

/*============参数定义================*/

parameter CNT_MAX_2US = 100,
		   CNT_MAX_2MS = 1000,
          CNT_MAX_2S = 1000;

/*============内部变量================*/
reg [6:0] cnt_2us;
reg [9:0] cnt_2ms;
reg [9:0] cnt_2s;


always  @(posedge clk or negedge rst_n)
		begin
			if(rst_n == 1'b0)
				begin
					cnt_2us <=7'b0;
				end
			else
				if(cnt_2us < CNT_MAX_2US - 1)
				   begin
					cnt_2us <= cnt_2us + 1'b1;
				   end
				else
				   begin
					cnt_2us <= 0;
				   end
		end

wire flag_2us;
assign flag_2us = (cnt_2us == CNT_MAX_2US - 1) ? 1'b1:1'b0;

//cnt_2ms
always  @(posedge clk, negedge rst_n)
begin
			if(rst_n == 1'b0)
				begin
					cnt_2ms <=10'b0;
				end
			else
				if(cnt_2ms < CNT_MAX_2MS - 1 && flag_2us == 1)
				   begin
					cnt_2ms <= cnt_2ms + 1'b1;
				   end
				else
				   if(cnt_2ms == CNT_MAX_2MS - 1 && flag_2us == 1)
						begin
							cnt_2ms <= 0;
						end
				   else 
				        begin
							cnt_2ms <= cnt_2ms;
						end
				    
		end

wire flag_2ms;
assign flag_2ms = (cnt_2ms == CNT_MAX_2MS - 1 && flag_2us == 1) ? 1'b1:1'b0;

//cnt_2s
always  @(posedge clk, negedge rst_n)
begin
			if(rst_n == 1'b0)
				begin
					cnt_2s <=10'b0;
				end
			else
				if(cnt_2s < CNT_MAX_2S - 1 && flag_2ms == 1)
				   begin
					cnt_2s <= cnt_2s + 1'b1;
				   end
				else
				   if(cnt_2s == CNT_MAX_2S - 1 && flag_2ms == 1)
						begin
							cnt_2s <= 0;
						end
				   else 
				        begin
							cnt_2s <= cnt_2s;
						end
				    
		end

wire led_signal;
assign led_signal = (cnt_2ms < cnt_2s) ? 1'b0:1'b1;

reg change_en;//控制呼或吸

always  @(posedge clk, negedge rst_n)
         begin
			if(rst_n == 1'b0)
				begin
					change_en <=1'b0;
				end
			else
			    if(cnt_2s == CNT_MAX_2S - 1 && flag_2ms == 1)
				begin
                      change_en <= ~change_en;
				end
            else
			    begin
                      change_en <= change_en;
				end
			end	
assign  led  = (change_en == 0) ? led_signal : (~led_signal);
endmodule  