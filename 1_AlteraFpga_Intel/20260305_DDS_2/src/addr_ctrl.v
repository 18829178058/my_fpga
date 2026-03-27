module addr_ctrl
(
	input clk,
	input rst_n,
	input [31:0] f_word,
	input [1:0] wave_sel,
	output [9:0]  addr
);

	reg [31:0] addr_cnt;
	always@ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			addr_cnt <= 0;
		else
			addr_cnt <= addr_cnt + f_word;
	end

	assign addr = {wave_sel, addr_cnt[31:24]};

endmodule