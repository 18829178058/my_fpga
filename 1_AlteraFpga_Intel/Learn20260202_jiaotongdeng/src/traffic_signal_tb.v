`timescale 1ns/1ns
module traffic_signal_tb;

    reg clk;        //系统时钟,50MHz
	reg rst_n;      //系统复位
	
	
initial begin
    clk = 1'b0;
    rst_n = 1'b0;
	#53;
	rst_n = 1'b1;
end
	
always #10  clk = ~clk;
	
wire [3:0] signal;    //输出信号


traffic_signal  traffic_signal_inst
(
     .clk(clk),    //系统时钟,50MHz
	 .rst_n(rst_n),  //系统复位
	 .signal(signal)    //输出信号
);

endmodule