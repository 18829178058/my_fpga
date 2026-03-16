`include "./tryfunct.v"
`timescale 1ns/100ps
`define clk_cycle 50

module tryfunctTop;

	reg clk;
	reg reset;
	reg [3:0] n, i;
	
	initial
		begin
			clk = 0;
			n = 0;
			reset = 1;
			#100 reset = 0;
			#100 reset = 1;
			for(i = 0; i < 15; i = i + 1)
				begin
					#200 n = i;
				end
			#100 $stop;
		end
		
	always #`clk_cycle clk = ~clk;

	wire [31:0] result;

tryfunct tryfunct_inst(
	.clk(clk),
	.reset(reset),
	.n(n),
	.result(result)
);



endmodule