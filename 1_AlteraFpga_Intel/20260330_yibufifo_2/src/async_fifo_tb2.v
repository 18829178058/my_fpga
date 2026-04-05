`timescale 1 ns/ 1 ps
module async_fifo_tb();
	reg rclk;
	reg rinc;
	reg rrst_n;
	reg wclk;
	reg [7:0] wdata;
	reg winc;
	reg wrst_n; 
	wire [7:0] rdata;
	wire rempty;
	wire wfull; 
	
	initial
		begin
			rrst_n = 0;
			wrst_n = 0;
			rclk = 0;
			wclk = 0;
			winc = 0;
			rinc = 0;
			#20 rrst_n = 1;
			wrst_n =1 ;
		end
	
	initial begin
		rclk = 'b0 ;
		wclk = 'b0 ;
	end
	
	always #10 rclk = ~ rclk;
	always #10 wclk = ~ wclk;
	
	always @(posedge rclk)
		rinc <= {$random} % 2;
	always @(posedge wclk)
		winc <= {$random} % 2;
	
	always @(negedge wclk)
		wdata <= {$random} % 256;
	
AsyncFIFO U0_AsyncFIFO (
	.rclk(rclk),
	.rdata(rdata),
	.rempty(rempty),
	.rinc(rinc),
	.rrst_n(rrst_n),
	.wclk(wclk),
	.wdata(wdata),
	.wfull(wfull),
	.winc(winc),
	.wrst_n(wrst_n)
	);
	
endmodule