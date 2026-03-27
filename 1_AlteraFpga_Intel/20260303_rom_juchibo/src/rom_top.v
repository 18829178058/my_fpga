module	rom_top
(
	input clk,rst_n,
	output [7:0] q
);

wire [7:0] addr;

rom_ctrl	rom_ctrl
(
	.clk(clk),
	.rst_n(rst_n),
	.addr(addr)
);

my_rom my_rom_inst
(
	.address(addr),
	.clock(clk),
	.q(q)
);

endmodule