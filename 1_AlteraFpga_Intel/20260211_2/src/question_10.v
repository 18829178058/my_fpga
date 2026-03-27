module question_10
(
	input [4:0] ADDRESS,
	output reg A,
	output reg B
);

always @(*) begin
	A = 0;
	B = 0;
	$display(" ADDRESS = %b", ADDRESS);
	casex(ADDRESS)
		5'b00???: begin
						A=1;
						$display(" 5'b00??? A=1");
					 end
		5'b01???: begin
						B=1;
						$display(" 5'b01??? B=1");
					 end
		5'b10?00, 5'b11?00:
					begin
						A = 1;
						B = 1;
					end
	endcase
	$display("A = %d, B = %d", A, B);
end
endmodule