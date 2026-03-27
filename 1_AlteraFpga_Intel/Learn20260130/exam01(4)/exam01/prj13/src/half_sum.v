module		half_sum
(
			input		a,//半加器运算数a
			input		b,//半加器运算数b
			
			output		s,//半加器进位输出
			output		sum//半加器加法输出


);

assign 					sum  =  a  ^ b;
assign 					s    =  a  & b;

endmodule 