`timescale 1ns/1ns
module				sum_tb;
				
//激励信号
reg  [7:0]			a;//加法器运算数a[7:0]
reg  [7:0]			b;//加法器运算数b[7:0]
reg					si;//加法器初始进位
initial				begin
					si		=0;
					#200					;
					a		={$random}%256	;
					b		={$random}%256	;
					
					#200					;
					a		={$random}%256	;
					b		={$random}%256	;
					#200					;
					a		={$random}%256	;
					b		={$random}%256	;
					#200					;
					a		={$random}%256	;
					b		={$random}%256	;
					#200					;
					a		={$random}%256	;
					b		={$random}%256	;
					#200					;
					a		={$random}%256	;
					b		={$random}%256	;
					#200					;
					a		={$random}%256	;
					b		={$random}%256	;
					#200					;
					a		={$random}%256	;
					b		={$random}%256	;
					#200					;
					a		={$random}%256	;
					b		={$random}%256	;
					#200					;
					a		={$random}%256	;
					b		={$random}%256	;
					#200					;
					$stop					;
					
end
				
//响应信号
wire [7:0]			sum;//加法器运算结果b[7:0]
wire 				so;//加法器运算结进位输出
sum					sum_ins
(	
					.a(a),//加法器运算数a[7:0]
					.b(b),//加法器运算数b[7:0]
					.si(si),//加法器初始进位
					
					
					.sum(sum),//加法器运算结果b[7:0]
					.so(so)//加法器运算结进位输出
);
endmodule 