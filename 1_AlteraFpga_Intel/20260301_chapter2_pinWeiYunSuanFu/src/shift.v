module shift
(
	input clk_in,
	input rst_n,
	output reg [3:0] led_out
);

reg [25:0] cnt;

always@(posedge clk_in or negedge rst_n)//计数器，持续1s
begin
	if(!rst_n)
		cnt <= 1'b0;
	else if(cnt == 'd50_000_000)
		begin
			cnt <= 1'b0;
		end
	else
		cnt <= cnt + 1'b1;
end


always@(posedge clk_in or negedge rst_n)
begin
	if(!rst_n)
		led_out <= 4'b0111;
	else if(cnt == 'd50_000_000)
			led_out <= {led_out[0],led_out[3:1]};
	else
		led_out <= led_out;
end

endmodule