module				id_m25p16_read
(	
					//系统相关
					input			clk,//系统时钟，默认为fclk=2*scl
					input			rst_n,//系统复位，默认低电平有效
	
	
					//用户通信端口
					output	reg		req,		//当req==1表示spi请求
					input			done,		//当done==1表示当前spi通信完成
					input			load,		//当load==1加载当前spi发送的数据
					output reg[7:0]	din,		//当前被加载的发送的数据
					input			dout_vld,	//当dout_vld==1表示SPI接收的数据有效
					input[7:0]		dout,		//当前SPI通信接收的数据
					output	reg		stop,		//当stop==1终止当前SPI通信
					//FIFO写有关	
					output			wr_clk,
					output	reg		wr_en,
					output reg[7:0]	wrdata,
					input [9:0]		wrnum//默认FIFO深度depth =1024
);

reg 	[4:0]		cnt;//master 数据加载次数计数器
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)	
							cnt <=5'd0;
					else if(load )
							if(cnt==5'd20)
								cnt <=5'd0;	
							else 
								cnt<=cnt+1'b1;
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)	
							stop  <=  1'b0;
					else  if(load & (cnt==20) )
							stop  <=  1'b1;	
					else   if(done)
							stop  <=  1'b0;	

always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)
								req <= 1'b0;
					else    if(wrnum< (1024-20))
								req <= 1'b1;
					else 
								req <= 1'b0;
					
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)
							din<=  8'd0;
					else if(load)
							if(cnt==0)
								din<=  8'h9F;
							else 
								din<=  8'd0;


//FIFO写
assign				wr_clk   =  clk;
reg		[4:0]		cnt_rv;//接收数据个数计数器
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)
							cnt_rv  <=5'd0;
					else    if(dout_vld)
							if(cnt_rv == 5'd20)
								cnt_rv  <=5'd0;	
							else 
								cnt_rv  <= cnt_rv  + 1'b1;

always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)begin	
							wr_en  <=  1'b0;
							wrdata	<=	8'd0;
					end  else  begin
							wrdata <=	dout;
							wr_en  <=  (cnt_rv!=0) & dout_vld ;end
								
endmodule 