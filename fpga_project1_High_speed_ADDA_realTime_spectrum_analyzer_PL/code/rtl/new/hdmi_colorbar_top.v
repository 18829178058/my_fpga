//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：http://www.openedv.com/forum.php
//淘宝店铺：https://zhengdianyuanzi.tmall.com
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2023-2033
//All rights reserved                                  
//----------------------------------------------------------------------------------------
// File name:           hdmi_colorbar_top
// Created by:          正点原子
// Created date:        2025年10月16日14:20:02
// Version:             V1.0
// Descriptions:        HDMI彩条显示实验顶层模块
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module  hdmi_colorbar_top(
    input        sys_clk,
    input        sys_rst_n,
    
    input        pixel_clk,
    input        clk_100m,
    input        pixel_clk_5x,
    
    //HDMI接口   
    output       tmds_clk_p,    // TMDS 时钟通道
    output       tmds_clk_n,
    output [2:0] tmds_data_p,   // TMDS 数据通道
    output [2:0] tmds_data_n,
    
    //用户接口              
    input         [7:0]  fft_data   ,  //FFT频谱数据
    input                fft_eop    ,  //EOP包结束信号
    input                fft_valid  ,  //FFT频谱数据有效信号
    output               out_vsync     //帧复位，高有效 
);

//wire define
wire          clk_locked;

wire  [10:0]  pixel_xpos_w;
wire  [10:0]  pixel_ypos_w;
wire  [23:0]  pixel_data_w;

wire          video_hs;
wire          video_vs;
wire          video_de;
wire  [23:0]  video_rgb;

//wire define
wire [7:0]  ram_data_out   ;  //RAM读数据
wire [7:0]  fft_point_cnt  ;  //FFT频谱位置
wire        fft_point_done ;  //FFT当前频谱绘制完成
wire        data_req       ;  //请求数据信号

//*****************************************************
//**                    main code
//*****************************************************

//例化MMCM/PLL IP核
/*
clk_wiz_0  clk_wiz_0(
    .clk_in1        (sys_clk),
    .clk_out1       (pixel_clk),        //像素时钟
    .clk_out2       (pixel_clk_5x),     //5倍像素时钟
    
    .reset          (~sys_rst_n), 
    .locked         (clk_locked)
);
*/

//RAM读写控制模块
rw_ram_ctrl u_rw_ram_ctrl(
    .clk            (clk_100m        ),
    .lcd_clk        (sys_clk         ),
    .rst_n          (rst_n           ),
        
    .fft_data       (fft_data        ),
    .fft_eop        (fft_eop         ),
    .fft_valid      (fft_valid       ),
    
    .data_req       (data_req        ), //请求数据信号
    .fft_point_done (fft_point_done  ), //FFT当前频谱绘制完成
    .fft_point_cnt  (fft_point_cnt   ), //FFT频谱位置
    
    .ram_data_out   (ram_data_out    )  //RAM读数据
);

//例化视频显示驱动模块
video_driver  u_video_driver(
    .pixel_clk      ( pixel_clk ),
    .sys_rst_n      ( sys_rst_n ),

    .video_hs       ( video_hs ),
    .video_vs       ( video_vs ),
    .video_de       ( video_de ),
    .video_rgb      ( video_rgb ),
	.data_req		(),

    .pixel_xpos     ( pixel_xpos_w ),
    .pixel_ypos     ( pixel_ypos_w ),
	.pixel_data     ( pixel_data_w )
);

//例化视频显示模块
video_display  u_video_display(
    .sys_clk    (sys_clk),
    .lcd_pclk      (pixel_clk),
    .rst_n      (sys_rst_n),

    .pixel_xpos     (pixel_xpos_w),
    .pixel_ypos     (pixel_ypos_w),
    .pixel_data     (pixel_data_w),
    
    
    .fft_point_cnt(fft_point_cnt)  ,  //FFT频谱位置
    .fft_data(fft_data)       ,  //FFT频率幅值
    .fft_point_done(fft_point_done) ,  //FFT当前频谱绘制完成
     .data_req(data_req)          //请求数据信号
    
    );

//例化HDMI驱动模块
dvi_transmitter_top u_rgb2dvi_0(
    .pclk           (pixel_clk),
    .pclk_x5        (pixel_clk_5x),
    .reset_n        (sys_rst_n),
                
    .video_din      (video_rgb),
    .video_hsync    (video_hs), 
    .video_vsync    (video_vs),
    .video_de       (video_de),
                
    .tmds_clk_p     (tmds_clk_p),
    .tmds_clk_n     (tmds_clk_n),
    .tmds_data_p    (tmds_data_p),
    .tmds_data_n    (tmds_data_n), 
    .tmds_oen       ()                        //预留的端口，本次实验未用到
    );

endmodule 