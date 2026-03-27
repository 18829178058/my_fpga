module			full_sum
(
				input			a,
				input			b,
				input			si,
				
				
				output 			sum  ,
				output			so




);
wire			s_half,sum_half;
half_sum		half_sum_ins
(
				.a(a),//半加器运算数a
				.b(b),//半加器运算数b
				
				.s(s_half),//半加器进位输出
				.sum(sum_half)//半加器加法输出


);



assign 			sum 		=sum_half 	  ^   si;
assign 			so			=s_half  |   (a&si)	  |  (b&si);
endmodule 