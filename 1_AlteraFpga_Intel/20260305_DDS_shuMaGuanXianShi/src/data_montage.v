module	data_montage(
	input [2:0]	wave_a,
	input [16:0] wave_f,
	input [1:0]	wave_sel,

	output [23:0] data
);

	wire [11:0] wave_f_r;
	
	wire [11:0] wave_f_bcd;
	
	assign wave_f_r = wave_f/100;
	
	bin_bcd bin_bcd_inst
	(
		.bin(wave_f_r),
		.bcd(wave_f_bcd)
	);

	assign data = {2'b00, wave_sel, 1'b0, wave_a, 4'b0, wave_f_bcd};

endmodule