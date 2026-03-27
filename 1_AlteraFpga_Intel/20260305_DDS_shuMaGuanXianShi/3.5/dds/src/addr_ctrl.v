module addr_ctrl(clk, rst_n, f_word, wave_sel, addr);

	input clk, rst_n;
	
	input [31:0] f_word;
	
	input [1:0]  wave_sel;
	
	output [9:0] addr;
	
	reg	[31:0]	addr_cnt;
	
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					addr_cnt <= 32'd0;
				end
			else
				addr_cnt <= addr_cnt + f_word;
		end
	
	assign	addr	=	{wave_sel, addr_cnt[31:24]};


endmodule 