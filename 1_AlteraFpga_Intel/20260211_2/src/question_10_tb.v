module question_10_tb;

reg [4:0] ADDRESS;
	
initial 	ADDRESS = 5'b0X000;
	
wire A;
wire B;

question_10		question_10_inst
(
	.ADDRESS(ADDRESS),
	.A(A),
	.B(B)
);

endmodule



