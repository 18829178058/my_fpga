module	key_ctrl
(
	input clk,
	input rst_n,
	input [3:0] key_in,   			//key_in[3]代表上；key_in[2]代表下； key_in[1]代表左； key_in[0]代表右；
	output reg [3:0] direction		//direction[3]代表上；direction[2]代表下； direction[1]代表左； direction[0]代表右；
);

//direction
	always @ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				direction <= 0;
			else
				if(key_in > 0)
					if(2'b1 == key_in[3] + key_in[2] + key_in[1] + key_in[0])
						direction <= key_in;
					else
						direction <= 0;
				else
					direction <= direction;
		end
endmodule