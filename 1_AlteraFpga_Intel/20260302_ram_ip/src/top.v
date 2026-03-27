module top
(		
	input clk,
	input rst_n,
	output [7:0] q
);


wire [7:0] data;
wire wren, rden;
wire [7:0] addr;

ram_ctrl	 ram_ctrl_inst
(
	.clk(clk),
	.rst_n(rst_n),
	.data(data),
	.wren(wren),
	.rden(rden),
	.addr(addr)
);


my_one_prot_ram my_one_prot_ram_inst(
	.address(addr),
	.clock(clk),
	.data(data),
	.rden(rden),
	.wren(wren),
	.q(q));


endmodule 