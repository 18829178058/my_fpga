`timescale 1ns/1ns
module async_fifo_tb();
 
parameter   DATA_WIDTH = 8  ;		//FIFO位宽
parameter   DATA_DEPTH = 9 ;		//FIFO深度
 
reg							wr_clk		;				//写时钟
//reg							wr_rst_n	;       		//低电平有效的写复位信号
reg							wr_en		;       		//写使能信号，高电平有效	
reg	[DATA_WIDTH-1:0]		data_in		;       		//写入的数据
 
reg							rd_clk		;				//读时钟
reg							fifo_rst	;       		//低电平有效的读复位信号
reg							rd_en		;				//读使能信号，高电平有效						                                        
wire[DATA_WIDTH-1:0]		data_out	;				//输出的数据					
wire						empty		;				//空标志，高电平表示FIFO已被写满
wire						full		;               //满标志，高电平表示FIFO已被读空
 
 
//------------<设置初始测试条件>----------------------------------------
initial begin
	rd_clk = 1'b0;					//初始时钟为0
	wr_clk = 1'b0;					//初始时钟为0
	fifo_rst <= 1'b0;				//初始复位
	//rd_rst_n <= 1'b0;				//初始复位
	wr_en <= 1'b0;
	rd_en <= 1'b0;	
	data_in <= 'd0;
	#5
	fifo_rst <= 1'b1;				
	//rd_rst_n <= 1'b1;					
//重复DATA_DEPTH次写操作，让FIFO写满 	
	repeat(DATA_DEPTH) begin
		@(negedge wr_clk)begin		
			wr_en <= 1'b1;
			data_in <= $random;	//生成8位随机数
		end
	end
//拉低写使能	
	@(negedge wr_clk)	wr_en <= 1'b0;
	
//重复DATA_DEPTH次读操作，让FIFO读空 	
	repeat(DATA_DEPTH) begin
		@(negedge rd_clk)rd_en <= 1'd1;		
	end
//拉低读使能
	@(negedge rd_clk)rd_en <= 1'd0;		
//重复4次写操作，写入4个随机数据	
	repeat(4) begin
		@(negedge wr_clk)begin		
			wr_en <= 1'b1;
			data_in <= $random;	//生成8位随机数
		end
	end
//持续同时对FIFO读
	@(negedge rd_clk)rd_en <= 1'b1;
//持续同时对FIFO写，写入数据为随机数据	
	forever begin
		@(negedge wr_clk)begin		
			wr_en <= 1'b1;
			data_in <= $random;	//生成8位随机数
		end
	end	
 
end
 
//------------<设置时钟>----------------------------------------------
always #10 rd_clk = ~rd_clk;			//读时钟周期20ns
always #20 wr_clk = ~wr_clk;			//写时钟周期40ns
 
AsyncFIFO#(
	.DSIZE(DATA_WIDTH),
	.ASIZE(DATA_DEPTH)
)
AsyncFIFO_inst
(
	.rrst_n(fifo_rst),
	.wrst_n(fifo_rst),
	.rclk(rd_clk),
	.wclk(wr_clk),
	.rinc(rd_en),
	.winc(wr_en),
	.wdata(data_in),
	.rdata(data_out),
	.wfull(full),
	.rempty(empty)
);



endmodule