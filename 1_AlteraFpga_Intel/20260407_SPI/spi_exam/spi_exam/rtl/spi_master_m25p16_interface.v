module  spi_master_m25p16_interface
(
		//系统相关
		input			clk,//系统时钟，默认为fclk=2*scl
		input			rst_n,//系统复位，默认低电平有效
		
		//spi  master总线相关，默认CPOL=0,CPHA=0
		output 	reg		scl,//spi同步时钟
		output reg		cs_n,//SPI片选，低电平有效
		output	reg		sdo,//SPI主机数据输出
		input			sdi,//SPI从机数据输出
		
		
		
		//用户通信端口
		input			req,		//当req==1表示spi请求
		output	reg		done,		//当done==1表示当前spi通信完成
		output	reg		load,		//当load==1加载当前spi发送的数据
		input[7:0]		din,		//当前被加载的发送的数据
		output	reg		dout_vld,	//当dout_vld==1表示SPI接收的数据有效
		output reg[7:0]	dout,		//当前SPI通信接收的数据
		input			stop		//当stop==1终止当前SPI通信		
);
reg		[4:0]		cnt;//定义线性序列机的计数器,本质上为状态编码寄存器
//线性序列机计数程序设计(线性序列机的核心的就是线性计数器的设计)///////////////////////////////////
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)
						cnt		<=		5'd0;
					else  case(cnt)
						   0		:if(req)cnt<=cnt  +  1'b1;//当cnt==0表示SPI处于空闲
						   18		:if(stop)
											cnt<=cnt  +  1'b1;//SPI终止
									 else 
											cnt<=  5'd3;//当SPI继续通信，未终止，计数值回到初值2
						   20		:cnt		<=		5'd0;//SPI通信完成，计数值回到初值0
						   default	:cnt<=cnt  +  1'b1;//正常计数
					endcase
					
//load加载信号控制//////////////////////////////////////////////
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)					
						load		<=		1'b0;
					else  case(cnt)
						   1	:	load		<=		1'b1;
						   17	:	if(stop)
										load		<=		1'b0;//SPI终止，不需要发送数据
									else 
										load		<=		1'b1;//SPI未终止，需要发送数据
						default :load		<=		1'b0;
					endcase
						   
//cs_n信号控制//////////////////////////////////////////////
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)
						cs_n			<=   1'b1;
					else case(cnt)
							3		:cs_n			<=   1'b0;
							19		:cs_n			<=   1'b1;
							default :cs_n			<=cs_n;
					endcase
//scl信号控制//////////////////////////////////////////////
/*
reg					scl_tmp;
reg 				scl_en;
assign 				scl		=  scl_en  |   scl_tmp;
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)
						scl_tmp <=  1'b0;
					else 
						scl_tmp <=~scl_tmp;
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)
						scl_en <=0;
					else (cnt>1)
						scl_en <=1;	
					else 
						scl_en <=0;	
*/
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)
							scl   <=  1'b0;
					else  if(cnt>1)
							scl   <=~scl;
					else 
						    scl   <=  1'b0;

//done信号控制//////////////////////////////////////////////
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)
							done <=		1'b0;
					else  if(cnt ==19)
							done <=		1'b1;
					else 
							done <=		1'b0;
//sdo信号控制//////////////////////////////////////////////
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)
							sdo  <=  1'b0;
					else  case(cnt)
							3	:sdo<=din[7];	
							5	:sdo<=din[6];	
							7	:sdo<=din[5];	
							9	:sdo<=din[4];	
							11	:sdo<=din[3];	
							13	:sdo<=din[2];	
							15	:sdo<=din[1];	
							17	:sdo<=din[0];
							default:sdo<=sdo;
					endcase
					
//sdo信号控制//////////////////////////////////////////////
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)
							dout<=8'd0;
					else case(cnt)
							4	:dout[7]<=sdi;
							6	:dout[6]<=sdi;
							8	:dout[5]<=sdi;
							10	:dout[4]<=sdi;
							12	:dout[3]<=sdi;
							14	:dout[2]<=sdi;
							16	:dout[1]<=sdi;
							18	:dout[0]<=sdi;
							default:dout<=dout;
					endcase
//dout_vld信号控制//////////////////////////////////////////////					
always 				@(posedge			clk		or		negedge		rst_n)
					if(~rst_n)		
						dout_vld  <=  1'b0;
					else if(cnt==18)
						dout_vld  <=  1'b1;	
					else 
						dout_vld  <=  1'b0;
							
endmodule 