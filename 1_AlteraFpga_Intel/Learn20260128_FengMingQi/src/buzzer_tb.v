`timescale 1ns/1ns
module buzzer_tb;
     //激励信号
     reg clk_in;
     reg rst_n;
	 
	 //响应信号
	 wire out_buzzer;

initial begin
     clk_in   =  0;
	 rst_n    =  0;
	 #53
	 rst_n    =  1;
end 

always        #10 clk_in = ~clk_in;//产生50MHz的时钟测试激励信号

buzzer buzzer
(
     .clk_in(clk_in),
     .rst_n(rst_n),
	 .out_buzzer(out_buzzer)
);

endmodule