//****************************************Copyright (c)***********************************//
//原子哥在线教学平台：www.yuanzige.com
//技术支持：http://www.openedv.com/forum.php
//淘宝店铺：https://zhengdianyuanzi.tmall.com
//关注微信公众平台微信号："正点原子"，免费获取ZYNQ & FPGA & STM32 & LINUX资料。
//版权所有，盗版必究。
//Copyright(C) 正点原子 2023-2033
//All rights reserved   
//----------------------------------------------------------------------------------------
// File name:           lcd_rgb_top
// Last modified Date:  2023/05/28 20:28:08
// Last Version:        V1.0
// Descriptions:        LCD显示顶层模块
//                      
//----------------------------------------------------------------------------------------
//****************************************************************************************//
module lcd_rgb_top(
    input                clk           ,  //时钟
    input                rst_n         ,  //复位 
    //RGB LCD接口   
    output               lcd_de        ,  //LCD 数据使能信号
    output               lcd_hs        ,  //LCD 行同步信号
    output               lcd_vs        ,  //LCD 场同步信号
    output               lcd_clk       ,  //LCD 像素时钟
    inout        [23:0]  lcd_rgb       ,  //LCD RGB565颜色数据
    output               lcd_rst       ,  //LCD 复位
    output               lcd_bl        ,  //LCD 背光                   
    //用户接口
    input        [7:0]   fft_point_cnt ,  //FFT频谱位置
    input        [7:0]   fft_data      ,  //FFT频率幅值
    output               fft_point_done,  //FFT当前频谱绘制完成
    output               data_req      ,  //请求数据信号     
    output               out_vsync        //帧复位，高有效 
    );                                                      

wire  [15:0]  lcd_id    ;    //LCD屏ID
wire          lcd_pclk  ;    //LCD像素时钟              
wire  [10:0]  pixel_xpos;    //当前像素点横坐标
wire  [10:0]  pixel_ypos;    //当前像素点纵坐标
wire  [10:0]  h_disp    ;    //LCD屏水平分辨率
wire  [10:0]  v_disp    ;    //LCD屏垂直分辨率
wire  [23:0]  pixel_data;    //像素数据
wire  [23:0]  lcd_rgb_o ;    //输出的像素数据
wire  [23:0]  lcd_rgb_i ;    //输入的像素数据

//*****************************************************
//**                    main code
//*****************************************************

//像素数据方向切换
assign lcd_rgb   = lcd_de ?  lcd_rgb_o :  {24{1'bz}};
assign lcd_rgb_i = lcd_rgb;  

//读LCD ID模块
rd_id u_rd_id(
    .clk            (clk            ),
    .rst_n          (rst_n          ),
    .lcd_rgb        (lcd_rgb_i      ),
    .lcd_id         (lcd_id         )
    );    

//时钟分频模块    
clk_div u_clk_div(
    .clk            (clk            ),
    .rst_n          (rst_n          ),
    .lcd_id         (lcd_id         ),
    .lcd_pclk       (lcd_pclk       )
    );    

//LCD显示模块    
lcd_display u_lcd_display(
    .lcd_pclk       (lcd_pclk       ),
    .rst_n          (rst_n          ),
    .lcd_id         (lcd_id         ),
    .pixel_xpos     (pixel_xpos     ),
    .pixel_ypos     (pixel_ypos     ),
    .h_disp         (h_disp         ),
    .v_disp         (v_disp         ),
    .pixel_data     (pixel_data     ),
    
    .fft_point_cnt  (fft_point_cnt  ),
    .fft_data       (fft_data       ),
    .fft_point_done (fft_point_done ),
    .data_req       (data_req       )    
    );    

//LCD驱动模块
lcd_driver u_lcd_driver(
    .lcd_pclk       (lcd_pclk       ),
    .rst_n          (rst_n          ),
    .lcd_id         (lcd_id         ),
    .pixel_data     (pixel_data     ),
    .pixel_xpos     (pixel_xpos     ),
    .pixel_ypos     (pixel_ypos     ),
    .h_disp         (h_disp         ),
    .v_disp         (v_disp         ),
    
    .out_vsync      (out_vsync      ),
    .lcd_de         (lcd_de         ),
    .lcd_hs         (lcd_hs         ),
    .lcd_vs         (lcd_vs         ),   
    .lcd_clk        (lcd_clk        ),
    .lcd_rgb        (lcd_rgb_o      ),
    .lcd_rst        (lcd_rst        ),
    .lcd_bl         (lcd_bl         )
    );  

endmodule
