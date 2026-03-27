`timescale   1ns/1ns
module   sale_auto_3_tb;


reg clk;
reg rst_n;
reg s0;
reg s1;


initial begin
        clk = 1'b0;
		rst_n = 1'b0;
		#53;
		rst_n = 1'b1;
end

always #2 clk= ~clk;

initial begin
		s0     =   1;
		s1     =   1;
		#         200;
        s0     =   0;
		s1     =   1;
		#         100;
		s0     =   1;
		s1     =   1;
		
		#         200;
        s0     =   0;
		s1     =   1;
		#         100;
		s0     =   1;
		s1     =   1;
		
		#         200;
        s0     =   0;
		s1     =   1;
		#         100;
		s0     =   1;
		s1     =   1;
		
		#         200;
        s0     =   0;
		s1     =   1;
		#         100;
		s0     =   1;
		s1     =   1;
		
		#         200;
        s0     =   1;
		s1     =   0;
		#         100;
		s0     =   1;
		s1     =   1;
		
		#         200;
        s0     =   1;
		s1     =   0;
		#         100;
		s0     =   1;
		s1     =   1;
		
		#         200;
        s0     =   1;
		s1     =   0;
		#         100;
		s0     =   1;
		s1     =   1;

end



wire led_sale;
wire led_z0ps;


sale_auto_3   sale_auto_3_inst
(
			.clk(clk),   //系统时钟，50MHz
			.rst_n(rst_n), //系统复位，默认低电平有效
			.s0_i(s0),   //0.5元硬币投币，通过按键模拟
			.s1_i(s1),   //1元硬币投币，通过按键模拟
			.led_sale(led_sale), //当出货的时候led点亮10s
			.led_z0ps(led_z0ps) //当找零的时候led点亮10s
);
endmodule

