module	rom_ctrl
(
	input clk,
	input rst_n,
	output reg [7:0] addr
);

	always@(posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			begin
				addr <=	8'b0;
			end
		else
			if(addr < 255)
				addr <= addr + 1'b1;
			else
				addr <=	8'b0;
	end

endmodule