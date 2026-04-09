module spi_master_m25p16_interface
(
	//系统相关
	input clk,			//系统时钟，默认为fclk = 2*scl
	input rst_n,		//系统复位，默认低电平有效
	
	//总线
	input sdi,			//SPI从机输入
	output cs_n,		//片选，低电平有效
	output scl,			//SPI同步
	output sdo,
	
	//端口
	input req,			//
	input [7:0] din,
	input stop,
	output done,
	output load,
	output [7:0] dout,
	output dout_vld

);

	reg	[4:0]	cnt;										//定义先行序列机的时序计数器，本质上为状态编码寄存器
	

//spi周期计数
always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			cnt <= 1'b0;
		else 
			case(cnt)
				0	:	if(req) cnt <= cnt + 1'b1;
				17	:	if(stop)
							cnt <= cnt + 1'b1;
						else
							cnt <= 5'd3;
				
				20	:	cnt <= 5'd0;
				default : cnt <= cnt + 1'b1;
			endcase
	end

//load信号
always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			load <= 1'b0;
		else
			case(cnt)
				1	:	load <= 1'b1;
				17	:	if(stop)
							load <= 1'b0;
						else
							load <= 1'b1;
				default :	load <= 1'b0;
	end
	
	
always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			cs_n <= 1'b1;
		else
			if(cnt > 5'd3 && cnt < 5'b20)
				cs_n <= 1'b0;
			else
				cs_n <= 1'b1;
	end

//门控时钟

	
always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			scl <= 1'b0;
		else
			if(cnt > 1)
				scl <= ~scl;
			else
				scl <= 1'b0;
	end	


always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			done <= 1'b0;
		else
			if(cnt == 5'd19)
				done <= 1'b1;
			else
				done <= 1'b0;
	end
	
always @ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			sdo <= 1'b0;
		else
			case(cnt)
				3 : sdo <= din[7];
				5 : sdo <= din[6];
				7 : sdo <= din[5];
				9 : sdo <= din[4];
				11 : sdo <= din[3];
				13 : sdo <= din[2];
				15 : sdo <= din[1];
				17 : sdo <= din[0];
				default : sdo <= sdo;
			endcase
	end
	
	
	
	
	
always @ (negedge clk or negedge rst_n)
	begin
		if(!rst_n)
			dout <= 8'b0;
		else
			case(cnt)
				4 : dout[7] <= sdi;
				6 : dout[6] <= sdi;
				8 : dout[5] <= sdi;
				10: dout[4] <= sdi;
				12: dout[3] <= sdi;
				14: dout[2] <= sdi;
				16: dout[1] <= sdi;
				18: dout[0] <= sdi;
				default dout <= dout;
			endcase
	end
	
always @ (negedge clk or negedge rst_n)
	begin
		if(!rst_n)
			dout_vld <= 1'b0;
		else if(cnt == 18)
			dout_vld <= 1'b1;
		else
			dout_vld <= 1'b0;
	
endmodule