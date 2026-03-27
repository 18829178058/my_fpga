module Led_LiuShuiDeng
(
    input clk_in,
	input rst_n,
    output reg [3:0] out_led
);

reg [63:0]  total_cnt;

always @(posedge clk_in  or negedge rst_n)
       if(rst_n == 1'b0)
	      total_cnt <= 64'd0;
	   else if(total_cnt == 64'd200000000)
	      total_cnt <= 64'd0;
	   else
	      total_cnt <= total_cnt + 1'b1;

always @(posedge clk_in) begin
   if(total_cnt/50000000 == 0)
       out_led <= 4'b1110;
   else if (total_cnt/50000000 == 1)
       out_led <= 4'b1101;
   else if (total_cnt/50000000 == 2)
       out_led <= 4'b1011;
   else if (total_cnt/50000000 == 3)
       out_led <= 4'b0111;
   else
	   out_led <= 4'b1111;




end

endmodule