module fifo_top
(
	input clk, 
	input rst_n, 
	output [7:0] q
);

wire [7:0] data;
wire rd_req, wr_req;
wire rd_empty, rd_full;
wire wr_empty, wr_full;



fifo_wr fifo_wr_inst
(
	.clk(clk),						//更改为写时钟
	.rst_n(rst_n),
	.wr_empty(wr_empty),  			//空满信号
	.wr_full(wr_full),
	.data(data),		//写数据
	.wr_req(wr_req)		//写请求
);

fifo_rd fifo_rd_inst
(
	.clk(clk),						//更改为读时钟
	.rst_n(rst_n),
	.rd_empty(rd_empty),  			//空满信号
	.rd_full(rd_full),
	.rd_req(rd_req)
);



my_fifo my_fifo_inst (
	.data(data),
	.rdclk(clk),
	.rdreq(rd_req),
	.wrclk(clk),
	.wrreq(wr_req),
	.q(q),
	.rdempty(rd_empty),
	.rdfull(rd_full),
	.wrempty(wr_empty),
	.wrfull(wr_full)
);	


endmodule