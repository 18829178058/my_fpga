module top(clk, rst_n, row, col, sel, seg);
	
	input clk, rst_n;
	
	input [3:0] row;
	
	output [3:0] col;
	
	output [2:0] sel;
	
	output [7:0] seg;
	
	wire	[3:0]	key_data;
	
	keyboard_state3 k1(
								.clk(clk), 
								.rst_n(rst_n), 
								.row(row), 
								.col(col), 
								.key_data(key_data), 
								.flag()
							);
	
	seg_driver s1(
							.clk(clk), 
							.rst_n(rst_n), 
							.data({16'd0,key_data_bcd}), 
							.sel(sel), 
							.seg(seg)
						);
						
	wire	[7:0] key_data_bcd;
	
	bin_bcd	#(	.BIN_WIDTH(4),
					.BCD_WIDTH(8))
						b1(.bin(key_data), .bcd(key_data_bcd));



endmodule 