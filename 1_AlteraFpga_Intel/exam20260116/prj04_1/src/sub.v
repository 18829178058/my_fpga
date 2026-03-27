module  sub
(
				//加法器参数输入
				input[7:0]			a,	//加法器参数a[7:0]
				input[7:0]			b,	//加法器参数b[7:0]
				input[7:0]			c,	//加法器参数c[7:0]
				//加法器输出结果
				output reg[9:0]	y	//加法器运算结果输出
);

/////////////////任务定义///////////////////////////////////
task      my_task ;
//参数定义
input    [7:0] a_tmp;//定义任务输入参数a_tmp
input    [7:0] b_tmp;//定义任务输入参数b_tmp
input    [7:0] c_tmp;//定义任务输入参数c_tmp
output   [9:0]  y_tmp;//定义输出任务参数y_tmp	
reg  	  [8:0]  sum;
begin
sum   		=     a+b;
y_tmp       =     sum  + c;
end
endtask


/////////////////函数定义/////////////////////////////// ////
function [9:0]my_func;
//参数定义
input    [7:0] a_tmp;//定义函数输入参数a_tmp
input    [7:0] b_tmp;//定义函数输入参数b_tmp
input    [7:0] c_tmp;//定义函数输入参数c_tmp
reg  	  [9:0]  sum;
begin
sum   		=     a+b;
my_func       =     sum  - c;
end

endfunction

reg    [9:0]  y0, y1;

always @* 
begin
        y1 = my_func(a, b, c);
		$display("function: input=%0d, %0d, %0d, output=%0d", a, b, c, y1);
end

always @* begin
        my_task(a, b, c, y0);  
	    $display(" task: input=%0d, %0d, %0d, output=%0d", a, b, c, y0);
end


always @* 
begin
        y = y0 + y1;
		$display(" toatl : y=%0d, y0 = %0d, y1 = %0d", y, y0, y1);
end

endmodule 