module	move #(parameter BIN_WIDTH = 6,
			   parameter BCD_WIDTH = 8)
(
	input [BIN_WIDTH + BCD_WIDTH - 1:0] move_in,
	output [BIN_WIDTH + BCD_WIDTH - 1:0] move_out
);

	wire [BIN_WIDTH + BCD_WIDTH - 1:0] temp;
	
	genvar i;//声明一个循环块变量
	
	generate 
		for(i = 0; i< BCD_WIDTH/4; i = i + 1)
			begin: A
				adjust adjust_inst(.adjust_in(move_in[(BIN_WIDTH + BCD_WIDTH - 1 -4*i):(BIN_WIDTH + BCD_WIDTH - 4 -4*i)]),
								   .adjust_out(temp[(BIN_WIDTH + BCD_WIDTH - 1 -4*i):(BIN_WIDTH + BCD_WIDTH - 4 -4*i)]));
			end
	endgenerate
	
	
	assign temp[BIN_WIDTH - 1:0] = move_in[BIN_WIDTH - 1:0];
	assign move_out = temp << 1;
	
endmodule