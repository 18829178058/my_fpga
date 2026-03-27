module	key_debounce
(
	input sys_clk,
	input sys_rst_n,
	
	input key,					//外部输入的按键值
	output reg key_filter		//按键消抖后的值
);


//parameter	define
	parameter CNT_MAX = 20'd100_0000;	//消抖时间20ms
	

//reg define
	reg [19:0]	cnt;
	reg		key_d0;			//将按键信号延迟一个时钟周期
	reg 	key_d1;			//将按键信号延迟两个时钟周期
	

/*********************************************/
//对按键端口的数据延迟两个时钟周期
always @ (posedge sys_clk or negedge sys_rst_n)
	begin
		if(!sys_rst_n)
			begin
				key_d0 <= 1'b1;
				key_d1 <= 1'b1;
			end
		else
			begin
				key_d0 <= key;
				key_d1 <= key_d0;
			end
	end
	
//按键值消抖
always @ (posedge sys_clk or negedge sys_rst_n)
	begin
		if(!sys_rst_n)
			cnt <= 10'd0;
		else
			begin
				if(key_d1 != key_d0)			//检测到按键状态发生改变
					cnt <= CNT_MAX;				//则开始20ms倒计时
				else	
					begin
						if(cnt > 20'd0)
							cnt <= cnt - 20'd1;
						else
							cnt <= 20'd0;
					end
			end
	end

//将消抖后最终的按键值送出去
always @ (posedge sys_clk or negedge sys_rst_n)
	begin
		if(!sys_rst_n)
			key_filter <= 1'b1;
		else
			if(cnt == 10'd1)
				key_filter <= key_d1;
			else
				key_filter <= key_filter;
	end

endmodule