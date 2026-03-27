module top(clk, rst_n, row, col, sel, seg);

	input clk, rst_n;
	
	input [3:0] row;
	
	output [3:0] col;
	
	output [2:0] sel;
	
	output [7:0] seg;
	
	wire	[3:0] key_data;
	
	wire	flag;

	keyboard k1(
						.clk(clk), 
						.rst_n(rst_n), 
						.row(row), 
						.col(col), 
						.key_data(key_data), 
						.flag(flag)
					);
	
	wire	[19:0] dout;
	
	cal c1(
				.clk(clk), 
				.rst_n(rst_n),
				.key_data(key_data),
				.flag(flag), 
				.dout(dout)
			);
	
	wire	[23:0] dout_bcd;
	
	bin_bcd	#(.BIN_WIDTH(20),
				.BCD_WIDTH(24))
						(.bin(dout), .bcd(dout_bcd));
	
	seg_driver s1(
							.clk(clk), 
							.rst_n(rst_n), 
							.data(dout_bcd), 
							.sel(sel), 
							.seg(seg)
						);

							
endmodule 