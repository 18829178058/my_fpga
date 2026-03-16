`timescale 1ns/100ps
module	sort4_tb;

	reg [3:0] a, b, c, d;
	
	initial
		begin
			a = 0;
			b = 0;
			c = 0;
			d = 0;
		repeat(5)
			begin
				#100	a = {$random} % 15;
						b = {$random} % 15;
						c = {$random} % 15;
						d = {$random} % 15;
			end
		
		end

	wire [3:0] ra, rb, rc, rd;

sort4	sort4_inst
(
	.a(a), 
	.b(b), 
	.c(c), 
	.d(d),
	.ra(ra), 
	.rb(rb), 
	.rc(rc), 
	.rd(rd)
);


endmodule