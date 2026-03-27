module			d_ff
(
				input			clk,//D触发器的采样时钟
				input			rst_n,//D触发器的清零端
				
				input			en,//D触发器的使能端
				input  			d,//D触发器的数据输入端
				output	reg		q//D触发器的数据输出端

);
always			@(posedge		clk			or		negedge			rst_n)
				if(rst_n==1'b0)//rst_n==0作为D触发器的清零端。
							q<=   1'b0;
				else  	if(en)//en作为D触发器的使能端信号
							q<=d;//当en==1的时候数据寄存
endmodule 