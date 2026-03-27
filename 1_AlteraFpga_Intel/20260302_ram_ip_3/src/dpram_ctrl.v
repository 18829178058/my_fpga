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

//将数据写入RAM
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
			data <= 0;
			wraddr <= 0;
			wren <= 0;
		end
	else if(wraddr < 255)
		begin
			data <= data + 1;
			wraddr <= wraddr + 1;
			wren <= 1;
		end
	else
		begin
			data <= 0;
			wraddr <= 0;
			wren <= 0;
		end
end


//将数据从RAM读出
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
		begin
			rdaddr <= 0; 
			rden <= 0;
		end
	else if(0 < wraddr && wraddr < 255)
		begin
			rdaddr <= wraddr - 1; 
			rden <= 1;
		end
	else
		begin
			rdaddr <= 0; 
			rden <= 0;
		end
end

endmodule