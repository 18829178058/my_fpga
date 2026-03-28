`timescale 1ns/1ns
module lcd_top_tb();

    reg clk;
	reg rst_n;
	
	initial 
		begin
		clk = 0;
		rst_n = 0;
		#53 rst_n = 1;
		
		end
	
	
	always #50 clk = ~clk;
	
	wire lcd_rs;           //命令控制，0为命令，1为控制
	wire lcd_cs;           //片选信号
	wire lcd_res;          //lcd复位指令，软复位
	wire lcd_sda;          //串行数据线
	wire lcd_scl;            //串行时钟线
	
lcd_top lcd_top_inst
(
    .clk(clk),
	.rst_n(rst_n),
	.lcd_rs(lcd_rs),            //命令控制，0为命令，1为控制
	.lcd_cs(lcd_cs),            //片选信号
	.lcd_res(lcd_res),           //lcd复位指令，软复位
	.lcd_sda(lcd_sda),           //串行数据线
	.lcd_scl(lcd_scl)            //串行时钟线
);


endmodule