module shift
(
	input clk_in,		//系统时钟
	input rst_n,		//系统复位
	output reg [3:0] a,
	output reg [3:0] b
);

always@(posedge clk_in or negedge rst_n)
begin
	if(!rst_n)
		begin
			a<=1;
			b<=4;
		end
	else
		begin
			a<=(a<<1);
			b<=(b>>1);
		end
end
endmodule