`timescale  1ns/1ns                // 定义仿真时间单位1ns和仿真时间精度为1ns

module  tb_top_ad_da_fir_lcd;               // 测试模块

//parameter  define
parameter  T = 20;                 // 时钟周期为10ns

//reg define
reg  sys_rst_n;                    // 复位信号
reg  clk_50m  ; 
reg  key      ; 


//wire define
wire  [23:0] lcd_rgb ;
wire         lcd_de  ;
wire  [7:0]  da_data ;

//*****************************************************
//**                    main code
//*****************************************************

assign  lcd_rgb = lcd_de ? 24'hz : 24'h8000;

//给输入信号初始值
initial begin
    clk_50m            = 1'b0;  
    key                = 1'b1;
    sys_rst_n          = 1'b0;     // 复位
    #(T+1)  sys_rst_n  = 1'b1;     // 在第21ns的时候复位信号信号拉高

end

//50Mhz的时钟，周期则为1/50Mhz=20ns,所以每10ns，电平取反一次            
always #(T/2) clk_50m = ~clk_50m;

top_ad_da_fir_lcd u_top_ad_da_fir_lcd(
    .sys_clk            (clk_50m) ,         //系统时钟
    .sys_rst_n          (sys_rst_n) ,       //系统复位，低电平有效
    .key                (key)     ,         //输入按键    
    //DA芯片接口
    .da_clk             () ,                //DA驱动时钟,最大支持125Mhz时钟
    .da_data            (da_data) ,         //输出给DA的数据
    //AD芯片接口
    .ad_data            (da_data) ,         //AD输入数据
    //模拟输入电压超出量程标志(本次试验未用到)
    .ad_otr             (1'b0) ,            //0:在量程范围 1:超出量程
    .ad_clk             () ,                //AD驱动时钟,最大支持32Mhz时钟 
    
    .lcd_de             (lcd_de),           //LCD 数据使能信号
    .lcd_hs             (),                 //LCD 行同步信号
    .lcd_vs             (),                 //LCD 场同步信号
    .lcd_clk            (),                 //LCD 像素时钟
    .lcd_rgb            (lcd_rgb),          //LCD RGB888颜色数据
    .lcd_rst            (),                 //LCD 复位,低电平有效 
    .lcd_bl             ()                  //LCD 背光控制信号
    );
    
endmodule