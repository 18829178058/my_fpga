module tryfunct(
	input clk,
	input reset,
	input [3:0]  ,
	output reg [31:0] result
);
	
	always @(posedge clk)				//clk的上升沿触发同步运算
		begin
			if(!reset)					//always中没有包含reset，表示同步复位
				result <= 0;
			else
				begin
					result <= n * factorial(n)/((n * 2) + 1);   	//verilog中整数除法运算结果中不考虑余数
				end
		end
		
	function [31:0] factorial(input [3:0] operand);				//函数定义，返回的是一个32位的数
		reg [3:0] index;										//输入只有一个4位的操作数
		begin													//函数内部计数用中间变量
			factorial = operand ? 1: 0;							//先定义操作数为零时函数的输出为零，不为零时为1
			for(index = 2; index <= operand; index = index + 1)
				factorial = index * factorial;					//表示阶乘的算数迭代运输
		end
	endfunction
endmodule