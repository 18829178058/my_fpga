module top_ad_da_fft_lcd
(
	input 				sys_clk,			//系统时钟
	input 				sys_rst_n,			//系统复位，低电平有效
	input 				key,				//按键KEY0
	
	//DA芯片接口
	output 				da_clk,             //DA驱动时钟，最大支持125MHz时钟
	output [7:0]  		da_data,            //输出给DA数据

	//AD芯片接口                            
	input [7:0] 		ad_data,            //AD输入数据
	
	//模拟输入电压超出量程标志（本次实验未用到）
	input 				ad_otr,             //1：超出量程 0：在量程范围内
	output 				ad_clk,             //AD驱动时钟，最大支持32MHz时钟
											
	output 				lcd_de,             //LCD数据使能信号
	output 				lcd_hs,             //LCD行同步信号
	output 				lcd_vs,             //LCD场同步信号
	output 				lcd_clk,            //LCD像素时钟
	inout  [23:0]		lcd_rgb,            //LCD RGB8888颜色数据
	output 				lcd_rst,            //LCD复位，低电平有效
	output 				lcd_b1              //LCD背光控制信号
);

//wire defune
wire			clk_100m;                             //100m时钟
wire			clk_50m;                              //50m时钟
wire			clk_25m;                              //25m时钟
wire			clk_25m_deg;                          //相位偏移后的25m时钟
wire			locked;                               //PLL输出稳定信号
wire			rst_n;                                //复位信号，低电平有效
wire  [7:0]		ad_data_out;                          //采集后的ADC输出数据
wire			ad_data_out_en;                       //采集后的ADC输出数据使能
wire  [31:0]	s_axis_data_tdata;                    //FFT数据通道的输入数据
wire			s_axis_data_tvaild;                   //FFT数据通道的输入数据有效使能
wire			s_axis_data_traedy;                   //FFT数据通道准备完成信号
wire			s_axis_data_tlast                     //FFT数据通道接收最后一个数据标志信号
wire			m_axis_data_tvalid;                   //FFT数据通道的输出数据有效使能
wire  [31:0]    m_axis_data_tdata;                    //FFT数据通道的输出数据
wire			m_axis_data_tlast;                    //FFT数据通道发送随后一个数据标志信号
wire  [15:0]	m_axis_data_tuser;                    //FFT数据通道输出数据的状态信息
wire			fft_eop;                              //取模后输出的终止信号
wire			fft_vaild;                            //取模后的数据有效信号
wire  [15:0]	fft_data;                             //取模后的有效信号
wire			out_vsync;                            //帧复位，高有效
wire  [7:0]		xk_index;                             //输出数据索引
wire  [4:0]     blk_exp'                              //输出数据缩放量

//==========================code============================

//待时钟锁定后产生结束复位信号
assign rst_n = sys_rst_n && locked;

//将PLL产生的25M时钟赋给AD的驱动时钟
assign as_clk = clk_25m;

//将采集后的ADC输出数据补0赋给FFT的输入数据
assign s_axis_data_tdata = {24'b0, ad_data_out[7:0]};

//将采集后的ADC输出数据有效使能赋给FFT的输入数据有效使能
assign s_axis_data_tvaild = ad_data_out_en;


//FFT输出数据的状态信息
assign xk_index = m_axis_data_tuser[7:0];    //输出数据索引
assign blk_exp = m_axis_data_tuser[12:8]     //输出数据缩放量


//例化 pll 模块 
 pll u_pll(
 .clk_out1 (clk_100m ), 
 .clk_out2 (clk_50m ), 
 .clk_out3 (clk_25m ), 
 .clk_out4 (clk_25m_deg ), 
 // Status and control signals
 .resetn (sys_rst_n ),
 .locked (locked ), 
 // Clock in ports
 .clk_in1 (sys_clk ) 
 ); 
 
 //例化高速 DA 模块
 hs_da u_hs_da(
 .sys_clk (clk_50m ), //50m 时钟
 .sys_rst_n (rst_n ), //复位信号，低电平有效
 .key (key ), //输入按键 
 //DA 芯片接口
 //DA 驱动时钟,最大支持 125MHz 时钟
 .da_clk (da_clk ),
 .da_data (da_data ) //输出给 DA 的数据
 
 );
 
 //例化 FIFO 控制模块
fifo_ctrl u_fifo_ctrl(
.axi_clk (clk_100m ), //50m 时钟
.sys_rst_n (rst_n ), //复位信号，低电平有效
.in_vsync (out_vsync ), //帧同步，高有效
.ad_clk (clk_25m_deg ), //相位偏移后的 25m 时钟
.ad_data_in (ad_data ), //AD 输入数据

 .s_axis_data_tready (s_axis_data_tready ), //FFT 数据通道准备完成信号
 //FFT 数据通道接收最后一个数据标志信号
 .s_axis_data_tlast (s_axis_data_tlast ),

 .ad_data_out (ad_data_out ), //采集后的 ADC 输出数据
 .ad_data_out_en (ad_data_out_en ) //采集后的 ADC 输出数据使能
 ); 

 //例化 FFT 模块
 xfft_0 xfft_0 (
 .aclk (clk_100m ), //100m 时钟 
 .aresetn (rst_n ), //复位信号，低电平有效 
 //配置通道的输入数据，1：FFT 0：IFFT
 .s_axis_config_tdata (8'b1 ),
 //配置通道的输入数据有效使能
 .s_axis_config_tvalid (1'b1 ),
 //外部模块准备接收配置通道数据
 .s_axis_config_tready ( ),
 
 .s_axis_data_tdata (s_axis_data_tdata ), //FFT 数据通道的输入数据
 //FFT 数据通道的输入数据有效使能 
 .s_axis_data_tvalid (s_axis_data_tvalid ),
 .s_axis_data_tready (s_axis_data_tready ), //FFT 数据通道准备完成信号
 //FFT 数据通道接收最后一个数据标志信号 
 .s_axis_data_tlast (s_axis_data_tlast ),
 
 .m_axis_data_tdata (m_axis_data_tdata ), //FFT 数据通道的输出数据
 //FFT 数据通道输出数据的状态信息 
 .m_axis_data_tuser (m_axis_data_tuser ), 
 //FFT 数据通道的输出数据有效使能 
 .m_axis_data_tvalid (m_axis_data_tvalid ), 
 //外部模块准备接收数据通道数据
 .m_axis_data_tready (1'b1 ),
 //FFT 数据通道发送最后一个数据标志信号 
 .m_axis_data_tlast (m_axis_data_tlast ),
.m_axis_status_tdata ( ), //FFT 状态数据通道输出数据
 //FFT 状态数据通道输出数据有效使能
 .m_axis_status_tvalid ( ),
 .m_axis_status_tready (1'b1 ), //外部模块准备接收状态数据
 .event_frame_started ( ), 
 .event_tlast_unexpected ( ), 
 .event_tlast_missing ( ), 
 .event_status_channel_halt ( ), 
 .event_data_in_channel_halt ( ),
 .event_data_out_channel_halt ( )
 ); 

 //例化数据取模模块
 data_modulus u_data_modulus(
 .clk (clk_100m ),
 .rst_n (rst_n ),
 
 .source_real (m_axis_data_tdata[8:0] ), //实部 有符号数
 .source_imag (m_axis_data_tdata[24:16] ), //虚部 有符号数
 //FFT 数据通道接收最后一个数据标志信号
 .source_eop (m_axis_data_tlast ),
 //输出有效信号，FFT 变换完成后，此信号置高，开始输出数据
 .source_valid (m_axis_data_tvalid ),
 //取模运算后的数据接口 
 .data_modulus (fft_data ), //取模后的数据
 .data_eop (fft_eop ), //取模后输出的终止信号
 .data_valid (fft_valid ) //取模后的数据有效信号
 ); 

 //例化 LCD 顶层模块
 lcd_top u_lcd_top(
 .clk_50m (clk_50m ), 
 .clk_100m (clk_100m ), 
 .rst_n (rst_n ),
 
 .lcd_hs (lcd_hs ), //LCD 行同步信号
 .lcd_vs (lcd_vs ), //LCD 场同步信号
 .lcd_de (lcd_de ), //LCD 数据使能信号
 .lcd_rgb (lcd_rgb ), //LCD RGB888 颜色数据
 .lcd_bl (lcd_bl ), //LCD 背光控制信号
 .lcd_rst (lcd_rst ), //LCD 复位,低电平有效
.lcd_clk (lcd_clk ), //LCD 像素时钟
 
 .fft_data (fft_data[7:0] ), //取模后的数据
 .fft_eop (fft_eop ), //取模后输出的终止信号
 .fft_valid (fft_valid ), //取模后的数据有效信号
 .out_vsync (out_vsync ) //帧同步，高有效
 );
 
 endmodule






















endmodule