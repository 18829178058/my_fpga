module dds_ctrl(clk, rst_n, wave_f, wave_a, wave_sel, wave_data);
	
	input clk, rst_n;
	
	input [13:0] wave_f;
	
	input [2:0] wave_a;
	
	input [1:0] wave_sel;
	
	output [10:0]	wave_data;
	
	wire	[31:0]	f_word;		//频率控制字
	
	f_word_cal f1(.wave_f(wave_f), .f_word(f_word));	//计算出addr_cnt
	
	wire	[9:0]	addr;
	
	addr_ctrl a1(
						.clk(clk), 
						.rst_n(rst_n), 
						.f_word(f_word), 
						.wave_sel(wave_sel), 
						.addr(addr)
					);
	
	wire	[7:0] q;
	
	dds_rom d1(
					.address(addr),
					.clock(clk),
					.q(q)
				);
	
	assign	wave_data	=	q * wave_a;

endmodule 