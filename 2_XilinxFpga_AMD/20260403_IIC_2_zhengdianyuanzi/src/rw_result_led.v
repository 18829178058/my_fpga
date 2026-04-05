module rw_result_led
#(parameter L_TIME = 17'd125_000
)
(
input clk ,//时钟信号
input rst_n ,//复位信号

input rw_done ,//E2PROM 读写测试完成
input rw_result,//E2PROM 读写测试结果 0:失败 1:成功
 output reg led //LED 灯显示 EEPROM 读写测试结果 闪烁:测试失败 常亮:测试成功
 );

 //reg define
 reg rw_done_flag; //读写测试完成标志
 reg [16:0] led_cnt ; //LED 灯闪烁间隔时间计数器

 //*****************************************************
 //** main code
 //*****************************************************

 //读写测试完成标志
 always @(posedge clk or negedge rst_n) begin
 if(!rst_n)
 rw_done_flag <= 1'b0;
 else if(rw_done)
 rw_done_flag <= 1'b1;
 end

 //E2PROM 读写测试结果为 1 时 LED 常亮，否则 LED 闪烁
 always @(posedge clk or negedge rst_n) begin
 if(!rst_n) begin
 led_cnt <= 17'd0;
 led <= 1'b0;
 end
 else begin
 if(rw_done_flag) begin
 if(rw_result) //读写测试正确
 led <= 1'b1; //LED 灯常亮
 else begin //读写测试错误
 led_cnt <= led_cnt + 17'd1;
 if(led_cnt == (L_TIME - 17'b1)) begin
 led_cnt <= 17'd0;
 led <= ~led; //LED 灯闪烁
 end
 else
 led <= led;
 end
 end
 else
 led <= 1'b0; //读写测试完成之前,LED 灯常暗
 end 
 end
endmodule