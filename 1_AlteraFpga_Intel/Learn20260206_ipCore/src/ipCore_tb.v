`timescale 1ns/1ps


module ipCore_tb;
	
reg clk,rst_n;
	
initial begin
	clk = 0; 
	rst_n = 1;
	#100 rst_n = 0;


end

always #10 clk = ~clk;
	
	
wire clk_out;



ipCore ipCore_inst(
							.clk(clk), 
							.rst_n(rst_n), 
							.clk_out(clk_out)
						);


endmodule