module dds_rom_top
(
	input clk,
	input rst_n,
	input key,
	output [7:0]q
);

wire [9:0] addr;

my_rom my_rom 
(
	.address(addr),
	.clock(clk),
	.q(q)
);

dds_rom_ctrl dds_rom_ctrl
(
	.clk(clk),
	.rst_n(rst_n),
	.key(key),
	.addr(addr)
);

endmodule