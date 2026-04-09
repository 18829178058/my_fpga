//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：http://www.openedv.com/forum.php
//淘宝店铺：https://zhengdianyuanzi.tmall.com
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2023-2033
//All rights reserved      
//----------------------------------------------------------------------------------------
// File name:           fifo_ctrl
// Last modified Date:  2020/05/28 20:28:08
// Last Version:        V1.0
// Descriptions:        fifo控制模块
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module fifo_ctrl(
    input           axi_clk            ,  //输入时钟，100m
    input           sys_rst_n          ,  //复位信号，低电平有效
    input           in_vsync           ,  //帧同步，高有效 
    input           ad_clk             ,  //AD采样时钟
    input  [7:0]    ad_data_in         ,  //AD输入数据
    
    input           s_axis_data_tready ,  //FFT数据通道准备完成信号 
    output          s_axis_data_tlast  ,  //FFT数据通道接收最后一个数据标志信号
    
    output [7:0]    ad_data_out        ,  //采集后的ADC输出数据
    output          ad_data_out_en        //采集后的ADC输出数据使能
    
    );

//reg define    
reg  [8:0]  cnt_rd_en      ;  //读使能计数器
reg         rd_en          ;  //读有效使能
reg         in_vsync_t     ;  //帧同步打拍信号
reg         in_vsync_t0    ;        
reg         in_vsync_t1    ;        
reg  [8:0]  cnt_fifo_wr_en ;  //FIFO写使能计数器
reg         fifo_wr_en     ;  //FIFO写使能
reg  [7:0]  ad_data_in_d0  ;  //AD输入数据打拍信号
reg  [7:0]  ad_data_in_d1  ; 

reg	[8:0]	rd_data_count_temp;//寄存

//wire define    
wire [7:0]  rd_data_count  ;  //读端FIFO剩余数据量
wire        fifo_rd_en     ;  //FIFO读使能

//*****************************************************
//**                    main code
//*****************************************************

//在读有效使能为高并且FFT数据通道准备完成信号有效的时候去读出数据
//以此保证读出的数据全部写入FFT模块
assign fifo_rd_en = rd_en && s_axis_data_tready;

//FIFO的模式设为FWFT模式，读使能可以是数据有效使能
assign ad_data_out_en = fifo_rd_en; 

//当读出最后一个数据时，拉高FFT数据通道接收最后一个数据标志信号
assign s_axis_data_tlast = ( (cnt_rd_en[8:0] == 255) && ad_data_out_en ) ? 1'b1 : 1'b0; 

//对输入数据进行时钟域同步
always @(posedge ad_clk or negedge sys_rst_n) begin
    if(sys_rst_n      == 1'b0)begin
        in_vsync_t    <= 1'b0;
        in_vsync_t0   <= 1'b0; 
        in_vsync_t1   <= 1'b0;
        ad_data_in_d0 <= 8'd0;     
        ad_data_in_d1 <= 8'd0;                         
    end    
    else begin
        in_vsync_t    <= in_vsync;
        in_vsync_t0   <= in_vsync_t; 
        in_vsync_t1   <= in_vsync_t0;
        ad_data_in_d0 <= ad_data_in;     
        ad_data_in_d1 <= ad_data_in_d0;                    
    end    
end 

//产生FIFO的写使能
always @(posedge ad_clk or negedge sys_rst_n) begin
    if(sys_rst_n == 1'b0)
       fifo_wr_en <= 1'b0;                   
    else if(in_vsync_t0 && ~in_vsync_t1) //在场同步上升沿到来时写入数据
         fifo_wr_en <= 1'b1;
    else if(cnt_fifo_wr_en >= 9'd255)  
         fifo_wr_en <= 1'b0;              
    else
         fifo_wr_en <= fifo_wr_en;     
end 

//产生FIFO写使能计数器
always @(posedge ad_clk or negedge sys_rst_n) begin
    if(sys_rst_n == 1'b0)
        cnt_fifo_wr_en <= 9'd0;                   
    else if(fifo_wr_en)  
        cnt_fifo_wr_en <= cnt_fifo_wr_en + 9'd1;              
    else
        cnt_fifo_wr_en <= 9'd0;     
end 

//产生读有效使能
always @(posedge axi_clk or negedge sys_rst_n) begin
    if(sys_rst_n == 1'b0)
        rd_en <= 1'b0;
    else if(cnt_rd_en >= 11'd255)
        rd_en <= 1'b0;     
    else if(rd_data_count >= 8'd127) 
        rd_en <= 1'b1;
    else
        rd_en <= rd_en; 
end  

//产生读使能计数器
always @(posedge axi_clk or negedge sys_rst_n) begin
    if(sys_rst_n == 1'b0)
        cnt_rd_en <= 11'd0;
    else if(s_axis_data_tlast)
        cnt_rd_en <= 11'd0;        
    else if(fifo_rd_en)
        cnt_rd_en <= cnt_rd_en + 11'd1;
    else
        cnt_rd_en <= cnt_rd_en;     
end 
    
//例化fifo
fifo_512X8 u_fifo_512x8 (
    .wr_clk         (ad_clk       ),             
    .rd_clk         (axi_clk      ),               
    .din            (ad_data_in_d1),                  
    .wr_en          (fifo_wr_en   ),           
    .rd_en          (fifo_rd_en   ),                
    .dout           (ad_data_out  ),           
    .full           (             ),                  
    .empty          (             ),                
    .rd_data_count  (rd_data_count)
);  
    
endmodule
