module dds_top(clk, key_sel, key_a, key_f_add, key_f_sub, wave_data);

	input clk;
	
	input key_sel, key_a, key_f_add, key_f_sub;
	
	output [10:0] wave_data;
	
	wire	rst_n;
	
	assign rst_n	= key_f_add	| key_f_sub;
	
	wire	key_sel_flag, key_a_flag, key_f_add_flag, key_f_sub_flag;//四个按键的消抖后信号
	
	key_filter k1(
							.clk(clk), 
							.rst_n(rst_n), 
							.key_in(key_sel), 
							.key_pose(), 
							.key_nege(key_sel_flag)
						);
	
	key_filter k2(
							.clk(clk), 
							.rst_n(rst_n), 
							.key_in(key_a), 
							.key_pose(), 
							.key_nege(key_a_flag)
						);
	
	key_filter k3(
							.clk(clk), 
							.rst_n(rst_n), 
							.key_in(key_f_add), 
							.key_pose(), 
							.key_nege(key_f_add_flag)
						);
	
	key_filter k4(
							.clk(clk), 
							.rst_n(rst_n), 
							.key_in(key_f_sub), 
							.key_pose(), 
							.key_nege(key_f_sub_flag)
						);
						
	wire	[13:0]	wave_f;
	wire	[2:0]		wave_a;
	wire	[1:0]		wave_sel;
	

	adjust_ctrl a1(
							.clk(clk), 
							.rst_n(rst_n), 
							.key_sel(key_sel_flag), 
							.key_a(key_a_flag), 
							.key_f_add(key_f_add_flag), 
							.key_f_sub(key_f_sub_flag), 
							.wave_f(wave_f), 
							.wave_a(wave_a), 
							.wave_sel(wave_sel)
						);
						
	dds_ctrl d1(
						.clk(clk), 
						.rst_n(rst_n), 
						.wave_f(wave_f), 
						.wave_a(wave_a), 
						.wave_sel(wave_sel), 
						.wave_data(wave_data)
					);
	


endmodule 