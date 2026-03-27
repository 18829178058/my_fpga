module	rom_top
(
	input clk,
	input rst_n,
	output [7:0] q1,
	output [7:0] q2,
	output [7:0] q3,
	output [7:0] q4
);

wire [7:0] addr;

rom_ctrl	rom_ctrl
(
	.clk(clk),
	.rst_n(rst_n),
	.addr(addr)
);

fangbo fangbo_inst
(
	.address(addr),
	.clock(clk),
	.q(q1)
);

juchibo juchibo_inst
(
	.address(addr),
	.clock(clk),
	.q(q2)
);

sanjiao_rom sanjiao_rom_inst
(
	.address(addr),
	.clock(clk),
	.q(q3)
);

zhengxuan_rom zhengxuan_rom_inst
(
	.address(addr),
	.clock(clk),
	.q(q4)
);

endmodule