module question_13
(
	input clk_in,
	output clk_out
);

integer I;
reg [3:0]	A;
reg [3:0]	B;

initial
	begin
		I = -1;
		A = I;
		B = A;
		$display("%b", B);
		A = A/2;
		$display("%b", A);
		B = A + 14;
		$display("%b", B);
		A = A + 14;
		$display("%b", A);
		A  = -2; I= A/2;
		$display("%b", I);
	end

endmodule
