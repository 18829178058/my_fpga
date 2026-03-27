module	bin_bcd #(parameter BIN_WIDTH = 6,
				  parameter BCD_WIDTH = 8)
(
	input [BIN_WIDTH - 1:0] bin,
	output [BCD_WIDTH - 1:0]  bcd
);

	wire [BIN_WIDTH + BCD_WIDTH - 1:0]	temp[BIN_WIDTH:0];
	
	assign temp[0] = {{BCD_WIDTH{1'b0}}, bin};
	
	genvar i;
	
	generate 
		for(i = 0;	i < BIN_WIDTH; i = i + 1)
			begin:M
				move #(.BIN_WIDTH(6), .BCD_WIDTH(8))	move_inst
				(
					.move_in(temp[i]),
					.move_out(temp[i + 1])
				);
			
			end
	
	
	endgenerate

	assign bcd = temp[BIN_WIDTH][BIN_WIDTH + BCD_WIDTH - 1:BIN_WIDTH];// temp[12][23:12]

endmodule