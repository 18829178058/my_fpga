`timescale 1ns/1ps

module  vga_tb;

	reg clk, rst_n;
	
	reg key;
	
	wire hsync, vsync;
	
	wire [7:0] rgb;
	
	top  dut(
					.clk(clk), 
					.rst_n(rst_n), 
					.key(key), 
					.hsync(hsync), 
					.vsync(vsync), 
					.rgb(rgb)
				);
				
	initial begin
		clk = 0; rst_n = 0; key = 1;
		#100 rst_n = 1;
	end
	
	always #10 clk = ~clk;

endmodule 