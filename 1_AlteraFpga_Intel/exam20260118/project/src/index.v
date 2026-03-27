module			index
(
				//减法器参数输入
				input[3:0]			a,	//连续输入4个二进制数
				output reg	y	//四个数全为1，输出1，否则输出0



);

always 			@(*)
				 my_task(a, y);
/////////////////任务定义///////////////////////////////////
task      my_task ;
//参数定义
input    [3:0] a_tmp;//定义任务输入参数a_tmp
output   y_tmp;//定义输出任务参数y_tmp	
begin
y_tmp = a[0] & a[1] & a[2] & a[3];
end
endtask


endmodule 