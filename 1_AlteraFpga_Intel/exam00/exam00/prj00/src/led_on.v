module			led_on//定义电路模块
(
				output [3:0]   led//定义端口信号，用于控制4个led灯
);
assign          led    =   4'b0101;
endmodule 