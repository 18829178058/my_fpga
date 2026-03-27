module dpram_ctrl
(
	input clk,
	input rst_n,
	output reg [7:0] data,
	output reg wren,
	output reg rden,
	output reg [7:0] wraddr,
	output reg [7:0] rdaddr
);

reg state;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
			data <= 0;
			rdaddr <= 0; 
			rden <= 0;
			wraddr <= 0;
			wren <= 0;
			state <= 0;
			$display("line 24");
		end
	else
	case(state)
		0:	if(wraddr < 255)
				begin
					data <= data + 1;
					rdaddr <= 0; 
					rden <= 0;
					wraddr <= wraddr + 1;
					wren <= 1;
					state <= 0;
					$display("line 35");
				end
			else
				begin
					data <= 0;
					rdaddr <= 0; 
					rden <= 0;
					wraddr <= 0;
					wren <= 0;
					state <= 1;
					$display("line 45");
				end
		1:	if(rdaddr < 255)
				begin
					data <= 0;
					rdaddr <= rdaddr + 1; 
					rden <= 1;
					wraddr <= 0;
					wren <= 0;
					state <= 1;
					$display("line 55");
				end
			else
				begin
					data <= 0;
					rdaddr <= 0; 
					rden <= 0;
					wraddr <= 0;
					wren <= 0;
					state <= 0;
					$display("line 65");
				end
		default:
				begin
					data <= 0;
					rdaddr <= 0; 
					rden <= 0;
					wraddr <= 0;
					wren <= 0;
					state <= 0;
					$display("line 75");
				end
	endcase
end

endmodule