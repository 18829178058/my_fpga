module fifo_rd(
	input 					clk, 
	input 					rst_n, 
	input 	[7:0]	 		data_rd, 		//iic读出来的数据
	input 					done_rd, 		//iic读数据操作结束
	input 					done_iic, 		//清空fifo
	input 					done_tx, 
	input 					worr_iic, 
	output  reg 			start_tx, 
	output	[7:0] 			data_tx
);

	wire		[8:0]	usedw;
	wire				full;
	wire				empty;
	
	always @ (posedge clk , negedge rst_n)
		begin
			if(!rst_n)
				begin
					start_tx <= 0;
				end
			else
				if((done_iic && worr_iic)||(done_tx && !empty))
					begin
						start_tx <= 1;
					end
				else
					start_tx	<=	0;
		end

	rfifo rfifo_inst(
							.aclr(!rst_n),
							.clock(clk),
							.data(data_rd),
							.rdreq(done_iic || (done_tx && !empty)),
							.wrreq(done_rd),
							.empty(empty),
							.full(full),
							.q(data_tx),
							.usedw(usedw)
					);

endmodule 