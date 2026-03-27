`timescale 1ns/1ns

module Led_LiuShuiDeng_tb;


reg clk_in;
reg rst_n;
	
	
initial begin
     clk_in   =  0;
	 rst_n    =  0;
	 #53
	 rst_n    =  1;
end 

always        #10 clk_in = ~clk_in;//产生50MHz的时钟测试激励信号


	
wire [3:0] out_led;


Led_LiuShuiDeng  Led_LiuShuiDeng_inst
(
    .clk_in(clk_in),
	.rst_n(rst_n),
    .out_led(out_led)
);

endmodule