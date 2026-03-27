module 	f_word_cal
(
	input [16:0] wave_f,
	output [31:0]  f_word
);

	wire [63:0] b_word;
	
	assign b_word = (wave_f * (2 ** 32))/50_000_000;
	assign f_word = b_word[31:0];

endmodule