`timescale 1ns/1ns
module dds_top_tb;
	
	reg clk;
	//reg rst_n;
	reg key_sel;
	reg key_a;
	reg key_f_add;
	reg key_f_sub;
	
	
	initial begin
		clk =0; key_sel = 1; key_a =1; key_f_add = 1; key_f_sub = 1;
		#10 key_f_add = 0; key_f_sub = 0;
		#50 key_f_add = 1; key_f_sub = 1;
		
		
		#1000000 key_sel = 0; key_f_add = 0; key_a = 0;
		#2000000 key_sel = 1; key_f_add = 1; key_a = 1;

		#1000000 key_sel = 0; key_f_add = 0; key_a = 0;
		#2000000 key_sel = 1; key_f_add = 1; key_a = 1;
		
	end

	defparam	dds_top_inst.k1.CNT_MAX = 100000;
	defparam	dds_top_inst.k2.CNT_MAX = 100000;
	defparam	dds_top_inst.k3.CNT_MAX = 100000;
	defparam	dds_top_inst.k4.CNT_MAX = 100000;

	always #10 clk = ~clk;
	
wire [10:0] wave_data;

dds_top dds_top_inst
(
	.clk(clk),
	.key_sel(key_sel),
	.key_a(key_a),
	.key_f_add(key_f_add),
	.key_f_sub(key_f_sub),
	.wave_data(wave_data)
);
endmodule