module ram_ctrl
(
	input clk,
	input rst_n,
	output reg [7:0] data,
	output reg wren,
	output reg rden,
	output reg [7:0] addr
);

reg state;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
			wren <= 0;
		    data <= 0;
			addr <= 0; 
			state <= 0;
			rden <= 0;
		end
	else
	case(state)
		0:	if(addr < 255)
				begin
					wren <= 1;
					addr <= addr + 1;
					data <= data + 1;
					rden <= 0;
					state <= 0;
				end
			else
				begin
					wren <= 0;
					addr <= 0;
					data <= 0;
					rden <= 0;
					state <= 1;
				end
		1:	if(addr < 255)
				begin
					wren <= 0;
					addr <= addr + 1;
					data <= 0;
					rden <= 1;
					state <= 1;
				end
			else
				begin
					wren <= 0;
					addr <= 0;
					data <= 0;
					rden <= 0;
					state <= 0;
				end
		default:
				begin
					wren <= 0;
					data <= 0;
					addr <= 0; 
					state <= 0;
					rden <= 0;
				end
	endcase
end




endmodule