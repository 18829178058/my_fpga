`timescale 1ns/1ns
module spi_master_m25p16_interface_tb;
		//系统相关
		reg			clk;//系统时钟，默认为fclk=2*scl
		reg			rst_n ;//系统复位，默认低电平有效
		initial		begin
					clk  	=  1'b0;
					rst_n	=  1'b0;
					#53  rst_n	=  1'b1;
		end
		always 		#10  clk=~clk;
		
		//spi  master总线相关，默认CPOL=0,CPHA=0
		wire		scl;//spi同步时钟
		wire		cs_n;//SPI片选，低电平有效
		wire		sdo;//SPI主机数据输出
		reg			sdi;//SPI从机数据输出
		reg [3:0]	sdi_rdm;
always 				@(negedge			scl		or		negedge		rst_n)
					if(~rst_n)begin
							sdi_rdm<={$random}%16;
							sdi  <=  1'b0;
					end else begin
							sdi_rdm<={$random}%16;
							sdi  <= sdi_rdm[3];end				
		wire	tx;
				
top top_inst
(
		//系统相关
		.clk(clk),//系统时钟，默认为fclk=2*scl
		.rst_n(rst_n),//系统复位，默认低电平有效
		
		//spi  master总线相关，默认CPOL=0,CPHA=0
		.scl(scl),//spi同步时钟
		.cs_n(cs_n),//SPI片选，低电平有效
		.sdo(sdo),//SPI主机数据输出
		.sdi(sdi),//SPI从机数据输出
		
		
		
		//用户通信端口
		.tx(tx)	//当req==1表示spi请求	
);
endmodule 