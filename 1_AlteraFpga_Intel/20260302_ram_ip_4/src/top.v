module top
(		
	input clk,
	input rst_n,
	output [7:0] q
);


wire [7:0] data;
wire wren, rden;
wire [7:0] wraddr, rdaddr;
wire frequency_double;

my_pll my_pll_inst(
	.areset(~rst_n),
	.inclk0(clk),
	.c0(frequency_double),
	.locked()
);

dpram_ctrl dpram_ctrl_inst
(
	.clk(clk),
	.rst_n(rst_n),
	.data(data),
	.wren(wren),
	.rden(rden),
	.wraddr(wraddr),
	.rdaddr(rdaddr)
);


my_two_port_ram my_two_port_ram_inst(
	.data(data),
	.rd_aclr(aclr),
	.rdaddress(rdaddr),
	.rdclock(clk),
	.rden(rden),
	.wraddress(wraddr),
	.wrclock(frequency_double),
	.wren(wren),
	.q(q)
);

endmodule 