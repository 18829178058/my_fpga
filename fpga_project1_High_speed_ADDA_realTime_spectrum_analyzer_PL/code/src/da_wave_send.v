module da_wave_send
(
	input	clk,								//时钟
	input	rst_n,								//复位信号，低电平有效
	input	key,								//按键
	input	[7:0]	rd_data_0,					//ROM0读出的数据
	input	[7:0]	rd_data_1,					//ROM1读出的数据
	
	output reg [7:0]	rd_addr,				//读ROM地址
	output	da_clk,								//驱动时钟，最大支持125MHz
	output	reg [7:0]	da_data					//输出给DA的数据
);

	parameter FREQ_ADJ = 8'd0;					//频率调节，FREQ_ADJ越大，最终输出的频率越低，范围0~255

	//reg define
	reg [7:0]	freq_cnt;						//频率调节计数器
	reg [8:0]	addsub_data;					//波形累加信号
	reg [1:0]	cnt_key_flag;					//按键次数计数器

//wire_define
	wire	key_value;							//消抖后的按键值
	wire	key_flag;							//消抖后的按键有效标志

/********************************************************************/

assign da_clk = ~clk;

//频率调节计数器
always @ (posedge clk or negedge rst_n)
	begin
		if(rst_n == 1'b0)
			freq_cnt <= 8'd0;
		else if(freq == FREQ_ADJ)
			freq_cnt <= 8'd0;
		else
			freq_cnt <= freq_cnt + 8'd1;
	end
	
	
//读ROM地址
always @ (posedge clk or negedge rst_n)
	begin
		if(rst_n == 1'b0)
			rd_addr <= 10'd0;
		else 
			begin
				if(freq_cnt == FREQ_ADJ)
					rd_addr <= rd_addr + 8'd1;
				else
					rd_addr <= rd_addr;
			end
	end
	
	
//产生波形累加信号
always @ (posedge clk or negedge rst_n)
	begin
		if(rst_n == 1'b0)
			addsub_data <= 9'd0;
		else
			addsub_data <= rd_data_0 + rd_data_1;
	end
	
//根据按键次数来切换波形数据
always @ (posedge clk or negedge rst_n)
	begin
		if(rst_n == 1'b0)
			da_data <= 8'd0;
		else
			begin
				if(cnt_key_flag == 0)
					da_data <= addsub_data/2;
				else
					if(cnt_key_flag == 1)
						da_data <= rd_data_0;
					else
						da_data <= rd_data_1;
			end
	
	
	end
	
//对按键次数进行计数
always @(posedge clk or negedge rst_n)
	begin
		if(rst_n == 1'b0)
			cnt_key_flag <= 2'd0;
		else
			begin
				if(cnt_key_flag == 2 &&key_flag && ~key_value)
					cnt_key_flag <= 2'd0;
				else
					if(key_flag && ~key_value)
						cnt_key_flag <= cnt_key_flag + 2'd1;
					else
					;
			end
	end
	
//按键消抖
	key_debounce key_debounce_inst
	(
		.sys_clk(clk),
		.sys_rst_n(rst_n),
		
		.key(key),							//外部输入的按键值
		.key_value(key_value),				//消抖后的按键值
		.key_flag(key_flag)					//消抖后的按键有效标志
	);
	
endmodule