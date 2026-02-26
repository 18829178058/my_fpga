`timescale 1ns/1ns
module clk_gen_5_tb;

     //激励信号
     reg clk_in;
     reg rst_n;
	 
	 //响应信号
	 wire clk_out;

initial begin
     clk_in   =  0;
	 rst_n    =  0;
	 #53
	 rst_n    =  1;
end 

always        #10 clk_in = ~clk_in;//产生50MHz的时钟测试激励信号

clk_gen_5  clk_gen_5_inst
(
     .clk_in(clk_in),
	 .rst_n(rst_n),
	 .clk_out(clk_out)
);

endmodule