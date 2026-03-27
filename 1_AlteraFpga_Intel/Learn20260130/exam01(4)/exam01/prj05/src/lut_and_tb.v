`timescale 1ns/1ns
module					lut_and_tb;
//激励信号
reg						a;//异或门异或信号a
reg						b;//异或门异或信号b
initial					begin
						#200					;
						a					=0	;
						b					=0	;
						#200					;
						a					=1	;
						b					=0	;
						#200					;
						a					=0	;
						b					=1	;
						#200					;
						a					=1	;
						b					=1	;
						#200					;
						$stop					;

end
//响应信号
wire					c; //异或门异或结果输出信号c
lut_and					lut_and_ins//定义元件
//端口映射
(
							.a(a),//异或门异或信号a
							.b(b),//异或门异或信号b
							.c(c) //异或门异或结果输出信号c

);
endmodule 