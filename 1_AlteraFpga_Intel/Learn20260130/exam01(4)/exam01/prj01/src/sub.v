module			sub
(
				//减法器参数输入
				input[7:0]			a,	//加法器参数a[7:0]
				input[7:0]			b,	//加法器参数b[7:0]
				input[7:0]			c,	//加法器参数c[7:0]
				//减法器输出结果
				output [7:0]		y	//减法器运算结果输出
);

reg	[8:0]		    y0;
reg    [7:0]		y1;
////////////任务调用////////////////////////////////////////////
always 			@(*)
				   my_task(a,b,c,y0,y1);				 
assign  		   y    =    y0  +  y1;	



			 			
//////////////计算子任务////////////////////////////////
task  		   my_task  ;
//参数定义
input    [7:0] a_tmp;//定义任务输入参数a_tmp
input    [7:0] b_tmp;//定义任务输入参数b_tmp
input    [7:0] c_tmp;//定义任务输入参数b_tmp
output	 [8:0] sum_result;//返回求和的结果
output	 [7:0] sub_result;//返回求差的结果   
begin
sum_result	  =  a_tmp  +   b_tmp   +  c_tmp;
sub_result	  =  a_tmp  +   b_tmp   -  c_tmp;
end
endtask	


			 				 
endmodule 