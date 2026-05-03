//LCD顶层模块
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module lcd_top(
    input                clk_100m   ,
    input                clk_50m    ,    
    input                rst_n      ,    
    //RGB LCD接口
    output               lcd_de     ,  //LCD 数据使能信号
    output               lcd_hs     ,  //LCD 行同步信号
    output               lcd_vs     ,  //LCD 场同步信号
    output               lcd_clk    ,  //LCD 像素时钟
    inout        [23:0]  lcd_rgb    ,  //LCD RGB888颜色数据
    output               lcd_rst    ,
    output               lcd_bl     ,
    //用户接口              
    input         [7:0]  fft_data   ,  //FFT频谱数据
    input                fft_eop    ,  //EOP包结束信号
    input                fft_valid  ,  //FFT频谱数据有效信号
    output               out_vsync     //帧复位，高有效 
    );

//wire define
wire [7:0]  ram_data_out   ;  //RAM读数据
wire [7:0]  fft_point_cnt  ;  //FFT频谱位置
wire        fft_point_done ;  //FFT当前频谱绘制完成
wire        data_req       ;  //请求数据信号

//*****************************************************
//**                    main code
//***************************************************** 

//RAM读写控制模块
rw_ram_ctrl u_rw_ram_ctrl(
    .clk            (clk_100m        ),
    .lcd_clk        (lcd_clk         ),
    .rst_n          (rst_n           ),
        
    .fft_data       (fft_data        ),
    .fft_eop        (fft_eop         ),
    .fft_valid      (fft_valid       ),
    
    .data_req       (data_req        ), //请求数据信号
    .fft_point_done (fft_point_done  ), //FFT当前频谱绘制完成
    .fft_point_cnt  (fft_point_cnt   ), //FFT频谱位置
    
    .ram_data_out   (ram_data_out    )  //RAM读数据
);

//LCD显示顶层模块
lcd_rgb_top  u_lcd_rgb_top(
    .clk            (clk_50m         ),
    .rst_n          (rst_n           ),
    
    .lcd_hs         (lcd_hs          ),
    .lcd_vs         (lcd_vs),
    .lcd_de         (lcd_de          ),
    .lcd_rgb        (lcd_rgb         ),
    .lcd_bl         (lcd_bl          ),
    .lcd_rst        (lcd_rst         ),
    .lcd_clk        (lcd_clk         ),
    
    .fft_point_cnt  (fft_point_cnt   ),
    .fft_data       (ram_data_out    ), //频谱的幅度
    .fft_point_done (fft_point_done  ),
    .data_req       (data_req        ), //请求频谱数据输入
    .out_vsync      (out_vsync       )
    
    );
      
endmodule 
