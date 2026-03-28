`timescale 1ns/1ps

module lcd_top_tb;
	
	reg clk, rst_n;
	
	wire lcd_rs;			//命令控制，0为命令，1为数据
	wire lcd_res;		//lcd复位指令，软复位
	wire lcd_cs;			//片选信号

	wire lcd_sda;		//串行数据线
	wire lcd_scl;		//串行时钟线
	
	lcd_top dut(
							.clk(clk), 
							.rst_n(rst_n), 
							.lcd_rs(lcd_rs), 
							.lcd_cs(lcd_cs), 
							.lcd_res(lcd_res), 
							.lcd_sda(lcd_sda), 
							.lcd_scl(lcd_scl)
						);
	
	initial	begin
		clk = 0; rst_n = 0;
		#100 rst_n = 1;
	end
	
	always #10 clk = ~clk;

endmodule 