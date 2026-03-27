`timescale 1ns/1ns
module mypll_tb;

reg clk, rst_n;

initial 
	begin
		clk = 0;
		rst_n = 1;
		#51 rst_n = 0;
	end

always #10 clk = ~clk;

wire clk_out;

my_pll my_pll_inst (
					.areset(rst_n),
					.inclk0(clk),
					.c0(clk_out),
					.locked()
					);


endmodule