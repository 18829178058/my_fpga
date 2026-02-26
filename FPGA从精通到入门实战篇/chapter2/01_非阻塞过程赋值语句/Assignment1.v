module Assignment1(clk, rst_n);
	//系统输入
	input clk;				//系统时钟输入
	input rst_n;			//低电平复位信号
	//内部寄存器定义
	reg[1:0] a;				//内部寄存器
	reg[1:0] b;				//内部寄存器
	//赋值语句
	always@(posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					a<=2;		//寄存器赋初值
					b<=1;		//寄存器赋初值
				end
			else
				begin
					a<=b;		//寄存器赋初值
					b<=a;		//寄存器赋初值
				end
		end
endmodule