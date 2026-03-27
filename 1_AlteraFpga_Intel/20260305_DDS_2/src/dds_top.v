module dds_top
(
	input clk,
	input key_sel,
	input key_a,
	input key_f_add,
	input key_f_sub,
	output [10:0] wave_data
);


	assign rst_n = key_f_add | key_f_sub;

//---------------------四个按键消抖-----------------------
	wire key_sel_flag, key_a_flag, key_f_add_flag, key_f_sub_flag;

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

	wire [13:0] wave_f;
	wire [2:0]	wave_a;
	wire [1:0]	wave_sel;
	
	adjust_ctrl	adjust_ctrl_inst
	(
		.clk(clk),
		.rst_n(rst_n),
		.key_sel(key_sel_flag),					//波形
		.key_a(key_a_flag),					//幅度
		.key_f_add(key_f_add_flag),				//频率加
		.key_f_sub(key_f_sub_flag),				//频率减
		
		.wave_a(wave_a),		//幅度值
		.wave_f(wave_f),		//频率值		
		.wave_sel(wave_sel)		//当前波形
	
	);
	
	
	dds_ctrl dds_ctrl_inst
	(
		.clk(clk),
		.rst_n(rst_n),
		.wave_f(wave_f),
		.wave_a(wave_a),
		.wave_sel(wave_sel),
		.wave_data(wave_data)
	);





endmodule