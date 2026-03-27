module Led_LiuShuiDeng
(
    input clk_in,
	input rst_n,
    output reg [3:0] out_led
);

reg [63:0]  total_cnt;

always @(posedge clk_in  or negedge rst_n)
       if(rst_n == 1'b0) begin
	      total_cnt <= 64'd0;
		  out_led <= 4'b0111;
	   end else if(total_cnt == (64'd9)) begin
	       total_cnt <= 64'd0;
		   out_led <= {out_led[0],out_led[3:1]};
	   end else
	       total_cnt <= total_cnt + 1'b1;

endmodule