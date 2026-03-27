module buzzer1
(
    input clk_in,
	input rst_n,
    output reg clk_out0
);

reg [17:0]  cnt0;
always @(posedge clk_in  or negedge rst_n)

       if(rst_n == 1'b0)
	      cnt0 <= 18'd0;
	   else if(cnt0 == 18'd95419)
	      cnt0 <= 18'd0;
	   else
	      cnt0 <= cnt0 + 1'b1;


always @(posedge clk_in  or negedge rst_n)
       if(rst_n == 1'b0)
	        clk_out0 <= 1'b0;
	   else if(cnt0 == 18'd95419)
	        clk_out0 <= ~clk_out0;

endmodule