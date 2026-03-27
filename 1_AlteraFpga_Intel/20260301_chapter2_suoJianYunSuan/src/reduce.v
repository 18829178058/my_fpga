module reduce
(
	input clk,			//系统时钟输入
	input rst_n,		//系统复位
	output reg c		//输出寄存器
);

	reg	[3:0] B;		//内部定义寄存器

	always@ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			begin
				c<=0;
				B<=4'b1111;
			end
		else
			begin
				c<=&B;
			end
	end
endmodule