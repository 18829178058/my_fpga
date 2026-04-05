module sync_fifo
(
	input clk ,
	input rst ,
	input wr_en ,
	input rd_en ,
	input [7:0] data_in ,
	output reg [7:0] data_out ,
	output reg empty ,
	output reg full
);
	
	reg [3:0] wr_addr ;
	reg [3:0] rd_addr ;
	reg [4:0] count ;
	
	parameter max_count = 5'b10000 ;
	parameter max1_count = 5'b01111 ;
	
	reg [7:0] fifo [0:max_count] ; // 定义一个二维的 RAM，实际设计中根据 RAM 深度 //和宽度可能会采用 Vedor 提供的 RAM
	
	//读操作
	always @ (posedge clk or negedge rst) begin
		if (rst == 1'b0)
			data_out <=0;
		else if (rd_en && empty==0)
			data_out<=fifo[rd_addr];
		end
	
	//写操作
	always @ (posedge clk ) begin
		if (wr_en==1&&full==0)
			fifo[wr_addr]<=data_in;
		end
	
	//更新读地址
	always @ (posedge clk or negedge rst) begin
		if (rst == 1'b0)
			rd_addr<=4'b0000;
		else if (empty==0&&rd_en==1)
			rd_addr<=rd_addr+1;
		end
	
	//更新写地址
	always @ (posedge clk or negedge rst) begin
		if (rst == 1'b0)
			wr_addr<=4'b0000;
		else if (full==0&&wr_en==1)
			wr_addr<=wr_addr+1;
		else
			wr_addr<=4'b0000;
		end
	
	//更新标志位
	always @ (posedge clk or negedge rst) begin
		if (rst == 1'b0)
			count<=0;
		else begin
			case({wr_en,rd_en})
				2'b00	:	count<=count;
				2'b01	:	if(count!==5'b00000)
								count<=count-1;
				2'b10	:	if(count!== max1_count) 
								count<=count+1;
				2'b11	:	count<=count;
			endcase
		end
	end
	
	always @(count) begin
		if(count==5'b00000)
			empty = 1;
		else
			empty = 0;
		end
	
	always @(count) begin
		if (count== max_count)
			full = 1;
		else
			full = 0; 
	end
	
endmodule