module			sub
(
				//减法器参数输入
				input[7:0]			a,	//加法器参数a[7:0]
				input[7:0]			b,	//加法器参数b[7:0]
				input[7:0]			c,	//加法器参数c[7:0]
				//减法器输出结果
				output reg[7:0]	y	//减法器运算结果输出



);

always 			@(*)
				 my_task(a,b,c,y);
/////////////////任务定义///////////////////////////////////
task      my_task ;
//参数定义
input    [7:0] a_tmp;//定义任务输入参数a_tmp
input    [7:0] b_tmp;//定义任务输入参数b_tmp
input    [7:0] c_tmp;//定义任务输入参数b_tmp
output   [7:0]  y_tmp;//定义输出任务参数y_tmp	
reg  	  [8:0]  sum;
begin
sum   		=     a+b;
y_tmp       =     sum  -c;
end
endtask


endmodule 