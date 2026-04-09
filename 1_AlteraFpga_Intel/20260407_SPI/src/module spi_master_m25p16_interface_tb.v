`timescale 1ns/1ns
module spi_master_m25p16_interface_tb();
(
	reg clk;
	reg rst_n;
	reg req;
	reg [7:0] din;
	reg stop;
	reg sdi;
	
	
	initial 
		begin
			clk = 1'b0;
			rst_n = 1'b0;
			req = 1'b0;
			din = 7'b00000000;
			stop = 1'b0;
			sdi = 1'b0;
			
			#53 rst_n = 1'b1;
				req = 1'b1;
				din = 7'b01010101;
			
			#40  sdi = 1'b1;
			#40  sdi = 1'b0;
			#40  sdi = 1'b1;
			#40  sdi = 1'b0;
			#40  sdi = 1'b1;
			#40  sdi = 1'b0;
			#40  sdi = 1'b1;
			#40  sdi = 1'b1;
				
			#40 stop = 1'b1;
		end



always #10 clk = ~clk;

always @ (negedge scl or negedge rst_n)
		if(!rst_n)
			begin
				sdi_rdm <= {$random}%16;
				sdi <= 1'b0;
				
			
			end


	wire done;
	wire load;
	wire [7:0] dout;
	wire cs_n;
	wire scl;
	wire sdo;
	wire dout_vld;

spi_master_m25p16_interface spi_master_m25p16_interface_inst
(
	.clk(clk),
	.rst_n(rst_n),
	.req(req),
	.din(din),
	.stop(stop),
	.sdi(sdi),
	
	.done(done),
	.load(load),
	.dout(dout),
	.cs_n(cs_n),
	.scl(scl),
	.sdo(sdo),
	.dout_vld(dout_vld)
);


endmodule