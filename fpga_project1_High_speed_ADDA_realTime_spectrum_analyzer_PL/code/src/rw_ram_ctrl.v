module rw_ram_ctrl
(
	 input          clk,
	 input          lcd_clk,
	 input          rst_n,
	 input  [7:0]   fft_data,				//FFT频谱数据
	 input          fft_eop,                //EOP包结束信号
	 input          fft_vaild,              //FFT频谱数据有效信号
	 
	 input          data_req,               //数据请求信号
	 input          fft_point_done,         //FFT当前频谱绘制完成
											
											
	 output   reg [7:0]  fft_point_cnt,    //FFT频谱位置
	 //RAM端口
	 output   [7:0] ram_data_out            //RAM输出有效数据
);

//parameter define 
parameter TRANSFORM_LEN = 256;              //FFT采样点数：256

//reg define
reg [7:0]    ram_raddr;                     //RAM读地址
reg          data_invalid;                  //数据无效标志，高有效
reg [7:0]    ram_waddr;                     //RAM写地址

//wire define
wire         ram_wr_en;                     //RAM写使能
wire [7:0]   ram_wr_data;                   //RAM写数据
wire [7:0]   ram_rd_data;                   //RAM读数据


//=============================code=================================
//产生RAM写使能
assign ram_wr_en = fft_vaild;
//产生RAM写数据
assign ram_wr_data = fft_data;
//在数据无效标志为低的时候将RAM读数据赋值给RAM输出有效数据信号
assign ram_data_out = data_invalid ? 8'd0 : ram_rd_data;


//产生RAM地址
always @ (posedge clk  or negedge rst_n)
    begin
	    if(!rst_n)
		    ram_waddr <= 8'd0;
		else if(fft_eop)
		    ram_waddr <= 8'd0;
		else if(ram_wr_en)
		    ram_waddr <= ram_waddr + 8'd1;
		else
		    ram_waddr <= ram_waddr;
	end

//当前从RAM中读到的第几个点，fft_point_cnt(0~127)
always @ (posedge clk or negedge rst_n)
    begin
	    if(!rst_n)
		    fft_point_cnt <= 8'd0;
		else
		    begin
			    if(fft_point_done)
			        fft_point_cnt <= 8'd0;
				else if(data_req)
				    fft_point_cnt <= fft_point_cnt + 8'b1;
				else
				    fft_point_cnt <= fft_point_cnt;
			end
	end

//产生RAM读地址
always @ (posedge lcd_clk or negedge rst_n)
begin
    if(!rst_n)
	    ram_raddr <= 8'd0;
	else
	    begin
		    if(fft_point_done)
			    ram_raddr <= 8'd0;
			else if(data_req)
			    ram_raddr <= ram_raddr + 8'd1;
			else
			    ram_raddr <= ram_addr;
		end
end

//产生数据无效标志，因为FFT的数据是对称的，所以只要取前一半数据就可以了
always @ (posedge lcd_clk or negedge rst_n)
    begin
	    if(!rst_n)
		    data_invalid <= 1'd0;
		else
		    begin
			    if(fft_point_done)
				    data_invalid <= 1'd0;
				else if(ram_raddr == (TRANSFORM_LEN / 2))
				    data_invalid <= 1'd1;
				else
				    data_invalid <= data_invalid;
			end
	end

ram_256X8 ram_256X8
(
    .clka     (clk),
	.wea      (ram_wr_en),
	.addra    (ram_waddr),
	.dina     (ram_wr_data),
	.clkb     (lcd_clk),
	.addrb    (ram_raddr),
	.doutb    (ram_rd_data)
);

endmodule