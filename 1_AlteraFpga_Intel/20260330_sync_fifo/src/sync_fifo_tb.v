`timescale 1 ns/ 1 ps
	module sync_fifo_tb();
	
	reg clk ;
	reg [7:0] data_in ;
	reg rd_en ;
	reg rst ;
	reg wr_en ;
	// wires 
	
	wire [7:0] data_out ;
	wire empty ;
	wire full ; 
	
	initial begin
		clk=0;
		rst=0;
		rd_en=0;
		wr_en=0;
		data_in=0;
	
		#40
		rst = 1 ;
		#35
		wr_en=1;
		#200
		rd_en=1;
	end
	
	always #20 data_in<=data_in+1;
	
	always #10 clk=~clk;
	
	sync_fifo u_sync_fifo (
		.clk ( clk ),
		.data_in ( data_in ),
		.data_out ( data_out ),
		.empty ( empty ),
		.full ( full ),
		.rd_en ( rd_en ),
		.rst ( rst ),
		.wr_en ( wr_en )
	);
	
	endmodule