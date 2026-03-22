module	da_wave_send
(
	input 				clk,		//时钟
	input 				rst_n,		//复位信号，低电平有效
	input [7:0] 		rd_data,	//ROM读取的数捿
	output reg [7:0]	rd_addr,	//读ROM地址
	//DA芯片接口
	output 				da_clk,		//DAC驱动时钟
	output [7:0]   		da_data		//输出给DA的数捿
);

//parameter
//频率调制
	parameter FREQ_ADJ = 8'd5;		//频率调节，FREQ_AD越大，最终输出的频率越低，范囿0~255
	
//reg define
	reg [7:0] freq_cnt ;				//频率调节计数噿
	
/*--------------------------------------------------------*/

	assign da_clk = ~clk;
	assign da_data = rd_data;			//将读到的ROM数据赋忼给DA数据端口
//频率调节计数噿
always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			freq_cnt <= 8'd0;
		else
			begin
				if(freq_cnt == FREQ_ADJ)
					freq_cnt <= 8'd0;
				else 
					freq_cnt <= freq_cnt + 8'd1;
			end
	end
	
//读ROM地址
always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			rd_addr <= 8'd0;
		else
			begin
				if((freq_cnt == FREQ_ADJ) && (rd_addr < 8'd255))
					rd_addr <= rd_addr + 8'd1;
				else 
					if((freq_cnt == FREQ_ADJ) && (rd_addr == 8'd255))
						rd_addr <= 8'd0;
					else
						rd_addr <= rd_addr;
			end
	
	end


endmodule