module buzzer
(
    input clk_in,
	input rst_n,
    output reg out_buzzer
);

//assign out_buzzer = 1'b0;


//1 do  262     (190840)190839.69      偶分频

reg [17:0]  cnt0;
reg clk_out0;

always @(posedge clk_in  or negedge rst_n)
       if(rst_n == 1'b0)
	      cnt0 <= 18'b0;
	   else if(cnt0 == 18'd95419)
	      cnt0 <= 18'b0;
	   else
	      cnt0 <= cnt0 + 1'b1;


always @(posedge clk_in  or negedge rst_n)
       if(rst_n == 1'b0)
	        clk_out0 <= 1'b0;
	   else if(cnt0 == 18'd95419)
	        clk_out0 <= ~clk_out0;

//2 re  294     (170068)170068.027     偶分频

reg [17:0]  cnt1;
reg clk_out1;
always @(posedge clk_in  or negedge rst_n)
       if(rst_n == 1'b0)
	      cnt1 <= 18'b0;
	   else if(cnt1 == 18'd85034)
	      cnt1 <= 18'b0;
	   else
	      cnt1 <= cnt1 + 1'b1;


always @(posedge clk_in  or negedge rst_n)
       if(rst_n == 1'b0)
	        clk_out1 <= 1'b0;
	   else if(cnt1 == 18'd85034)
	        clk_out1 <= ~clk_out1;


//3 mi  330     (151515)151515.1515    奇分频

reg clk2_1,clk2_2;

assign clk_out2 = clk2_1|clk2_2;  //生成门控时钟

reg [17:0] cnt2;

always @(posedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        cnt2  <= 18'b0;
	   else if(cnt2 == 18'd151514)
		    cnt2 <= 18'b0;
	   else
		    cnt2 <= cnt2 + 1'b1;
		 
//产生第一个翻转时钟///////////
always @(posedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        clk2_1  <= 1'b0;
	   else if((cnt2 == 151514) || (cnt2 == 75757))
		    clk2_1 <= ~clk2_1;
			
//产生第二个翻转时钟///////////
always @(negedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        clk2_2  <= 1'b0;
	   else if((cnt2 == 151514) || (cnt2 == 75757))
		    clk2_2 <= ~clk2_2;




//4 fa  350     (142857)142857.14      奇分频

reg clk3_1,clk3_2;

assign clk_out3 = clk3_1|clk3_2;  //生成门控时钟

reg [17:0] cnt3;

always @(posedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        cnt3  <= 18'b0;
	   else if(cnt3 == 18'd142856)
		    cnt3 <= 18'b0;
	   else
		    cnt3 <= cnt3 + 1'b1;
		 
//产生第一个翻转时钟///////////
always @(posedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        clk3_1  <= 1'b0;
	   else if((cnt3 == 142856) || (cnt3 == 71428))
		    clk3_1 <= ~clk3_1;
			
//产生第二个翻转时钟///////////
always @(negedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        clk3_2  <= 1'b0;
	   else if((cnt3 == 142856) || (cnt3 == 71428))
		    clk3_2 <= ~clk3_2;


//5 sol 392     (127551)127551.020     奇分频

reg clk4_1,clk4_2;

assign clk_out4 = clk4_1|clk4_2;  //生成门控时钟

reg [17:0] cnt4;

always @(posedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        cnt4  <= 18'b0;
	   else if(cnt4 == 18'd127550)
		    cnt4 <= 18'b0;
	   else
		    cnt4 <= cnt4 + 1'b1;
		 
//产生第一个翻转时钟///////////
always @(posedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        clk4_1  <= 1'b0;
	   else if((cnt4 == 127550) || (cnt4 == 63775))
		    clk4_1 <= ~clk4_1;
			
//产生第二个翻转时钟///////////
always @(negedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        clk4_2  <= 1'b0;
	   else if((cnt4 == 127550) || (cnt4 == 63775))
		    clk4_2 <= ~clk4_2;


//6 la  440     (113636)113636.3636    偶分频

reg [17:0]  cnt5;
reg clk_out5;
always @(posedge clk_in  or negedge rst_n)
       if(rst_n == 1'b0)
	      cnt5 <= 18'b0;
	   else if(cnt5 == 18'd56818)
	      cnt5 <= 18'b0;
	   else
	      cnt5 <= cnt5 + 1'b1;


always @(posedge clk_in  or negedge rst_n)
       if(rst_n == 1'b0)
	        clk_out5 <= 1'b0;
	   else if(cnt5 == 18'd56818)
	        clk_out5 <= ~clk_out5;



//7 si  494     (101215)101214.57      奇分频
reg clk6_1,clk6_2;

assign clk_out6 = clk6_1|clk6_2;  //生成门控时钟

reg [17:0] cnt6;

always @(posedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        cnt6  <= 18'b0;
	   else if(cnt6 == 18'd101214)
		    cnt6 <= 18'b0;
	   else
		    cnt6 <= cnt6 + 1'b1;
		 
//产生第一个翻转时钟///////////
always @(posedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        clk6_1  <= 1'b0;
	   else if((cnt6 == 101214) || (cnt6 == 50607))
		    clk6_1 <= ~clk6_1;
			
//产生第二个翻转时钟///////////
always @(negedge clk_in or negedge rst_n)
       if(rst_n == 1'b0)
	        clk6_2  <= 1'b0;
	   else if((cnt6 == 101214) || (cnt6 == 50607))
		    clk6_2 <= ~clk6_2;
			

reg [63:0]  total_cnt;

always @(posedge clk_in  or negedge rst_n)
       if(rst_n == 1'b0)
	      total_cnt <= 64'd0;
	   else if(total_cnt == 64'd350000000)
	      total_cnt <= 64'd0;
	   else
	      total_cnt <= total_cnt + 1'b1;

always @(posedge clk_in) begin
   if(total_cnt/50000000 == 0)
       out_buzzer <= clk_out0;
   else if (total_cnt/50000000 == 1)
       out_buzzer <= clk_out1;
   else if (total_cnt/50000000 == 2)
       out_buzzer <= clk_out2;
   else if (total_cnt/50000000 == 3)
       out_buzzer <= clk_out3;
   else if (total_cnt/50000000 == 4)
       out_buzzer <= clk_out4;
   else if (total_cnt/50000000 == 5)
       out_buzzer <= clk_out5;
   else if (total_cnt/50000000 == 6)
       out_buzzer <= clk_out6;
   else
	   out_buzzer <= 1'b1;




end


endmodule