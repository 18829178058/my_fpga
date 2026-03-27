module clk_gen_5
(
     input     clk_in,   //分频器原时钟50MHz
	 input     rst_n,    //系统复位，默认低电平有效
	 output    clk_out   //分频器输出时钟10MHz，默认为门控时钟
);

reg clk1,clk2;

assign clk_out = clk1|clk2;  //生成门控时钟

reg [2:0] cnt;

always @(posedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        cnt  <= 3'b0;
	   else if(cnt == 3'd4) //K-1
		    cnt <= 3'd0;
	   else
		    cnt <= cnt + 1'b1;
		 
//产生第一个翻转时钟///////////
always @(posedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        clk1  <= 1'b0;
	   else if((cnt == 4) || (cnt == 2)) //K-1 || (K-1)/2
		    clk1 <= ~clk1;
			
//产生第二个翻转时钟///////////
always @(negedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        clk2  <= 1'b0;
	   else if((cnt == 4) || (cnt == 2)) //K-1 || (K-1)/2
		    clk2 <= ~clk2;
endmodule