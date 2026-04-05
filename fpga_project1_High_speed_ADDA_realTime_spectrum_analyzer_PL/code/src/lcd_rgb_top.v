module lcd_rgb_top
(
    input              clk,                //时钟
	input              rst_n,              //复位
										   
	output             lcd_de,             //LCD数据使能信号
	output             lcd_hs,             //LCD行同步信号
	output             lcd_vs,             //LCD场同步信号
	output             lcd_clk,            //LCD像素时钟
	inout   [23:0]     lcd_rgb,            //LCD RGB565 颜色数据
	output             lcd_rst,            //LCD复位
	output             lcd_bl,             //LCD 背光
										   
	input   [7:0]      fft_point_cnt,      //FFT 频谱位置
	input   [7:0]      fft_data,           //FFT 频率幅度
	output             fft_point_done,     //FFT 当前频谱绘制完成
	output             data_req,           //请求数据信号
	output             out_vsync           //帧复位，高有效
);

wire [15:0]  lcd_id;						//LCD屏ID		
wire         lcd_pclk;                      //LCD像素时钟
wire [10:0]  pixel_xpos;                    //当前像素点横坐标
wire [10:0]  pixel_ypos;                    //当前像素点纵坐标
wire [10:0]  h_disp;                        //LCD屏水平分辨率
wire [10:0]  v_disp;                        //LCD屏垂直分辨率
wire [23:0]  pixel_data;                    //像素数据
wire [23:0]  lcd_rgb_o;                     //输出的像素数据
wire [23:0]  lcd_rgb_i;                     //输入的像素数据

//=================================================================
assign lcd_rgb = lcd_de ? lcd_rgb_o : {24{1'bz}};
assign lcd_rgb_i = lcd_rgb;


//读LCD ID 模块
rd_id rd_id_inst
(
    .clk           (clk),
	.rst_n         (rst_n),
	.lcd_rgb       (lcd_rgb_i),
	.lcd_id        (lcd_id)
);

//时钟分频模块
clk_div clk_div_inst
(
    .clk           (clk),
	.rst_n         (rst_n),
	.lcd_id        (lcd_id),
	.lcd_pclk      (lcd_pclk)
);

//LCD显示模块
lcd_display lcd_display_inst
(
    .lcd_pclk              (lcd_pclk),       
	.rst_n                 (rst_n),
	.lcd_id                (lcd_id),
	.pixel_xpos            (pixel_xpos),
	.pixel_ypos            (pixel_ypos),
	.h_disp                (h_disp),
	.v_disp                (v_disp),
	.pixel_data            (pixel_data),

	.fft_point_cnt         (fft_point_cnt),
	.fft_data              (fft_data),
	.fft_point_done        (fft_point_done),
	.data_req              (data_req)
);

//LCD驱动模块
lcd_driver lcd_driver_inst
(
    .lcd_pclk          (lcd_pclk),
	.rst_n             (rst_n),
	.lcd_id            (lcd_id),
	.pixel_data        (pixel_data),
	.pixel_xpos        (pixel_xpos),
	.pixel_ypos        (pixel_ypos),
	.h_disp            (h_disp),
	.v_disp            (v_disp),

	.out_vsync         (out_vsync),
	.lcd_de            (lcd_de),
	.lcd_hs            (lcd_hs),
	.lcd_vs            (lcd_vs),
	.lcd_clk           (lcd_clk),
	.lcd_rgb           (lcd_rgb_o),
	.lcd_rst           (lcd_rst),
	.lcd_bl            (lcd_bl)
);

endmodule