// LCD12864 三线串行驱动模块（Verilog）
// 适配50MHz系统时钟，串行发送指令/数据，显示"Hello FPGA"
module lcd12864_driver(
    input         clk_50m,    // 50MHz系统时钟
    input         rst_n,      // 全局复位，低有效
    // LCD12864串行接口
    output reg    lcd_cs,     // 片选，低有效
    output reg    lcd_sclk,   // 串行时钟
    output reg    lcd_sid,    // 串行数据
    output reg    lcd_rst     // LCD复位，低有效
);

// 1. 时钟分频：50MHz → 1MHz（周期1us）
reg [5:0] clk_div_cnt;
reg       clk_1m;
always @(posedge clk_50m or negedge rst_n) begin
    if(!rst_n) begin
        clk_div_cnt <= 6'd0;
        clk_1m      <= 1'b0;
    end else begin
        if(clk_div_cnt == 6'd49) begin  // 50MHz/50=1MHz
            clk_div_cnt <= 6'd0;
            clk_1m      <= ~clk_1m;
        end else begin
            clk_div_cnt <= clk_div_cnt + 6'd1;
        end
    end
end

// 2. 状态机定义（串行初始化+显示流程）
localparam S_RST         = 0;  // 复位LCD（1ms）
localparam S_INIT_CMD1   = 1;  // 发送初始化指令1：0x38（显示模式）
localparam S_INIT_CMD2   = 2;  // 发送初始化指令2：0x0C（显示开，光标关）
localparam S_INIT_CMD3   = 3;  // 发送初始化指令3：0x01（清屏）
localparam S_INIT_CMD4   = 4;  // 发送初始化指令4：0x80（起始地址）
localparam S_DISP_DATA   = 5;  // 发送显示数据（Hello FPGA）
localparam S_IDLE        = 6;  // 空闲状态

reg [2:0] curr_state;  // 当前状态
reg [2:0] next_state;  // 下一个状态
reg [15:0] delay_cnt;  // 延时计数器（初始化等待）
reg [3:0] bit_cnt;     // 串行位计数器（0~7，发送8位）
reg [3:0] data_cnt;    // 显示数据计数器（0~7，8个字符）
reg [7:0] send_data;   // 待发送的8位数据（指令/字符）

// 第一段状态机：状态跳转（同步到1MHz时钟）
always @(posedge clk_1m or negedge rst_n) begin
    if(!rst_n) begin
        curr_state <= S_RST;
    end else begin
        curr_state <= next_state;
    end
end

// 第二段状态机：组合逻辑，确定下一个状态
always @(*) begin
    case(curr_state)
        S_RST: next_state = (delay_cnt == 16'd1000) ? S_INIT_CMD1 : S_RST;
        S_INIT_CMD1: next_state = (bit_cnt == 4'd8) ? S_INIT_CMD2 : S_INIT_CMD1;
        S_INIT_CMD2: next_state = (bit_cnt == 4'd8) ? S_INIT_CMD3 : S_INIT_CMD2;
        S_INIT_CMD3: next_state = (bit_cnt == 4'd8) ? S_INIT_CMD4 : S_INIT_CMD3;
        S_INIT_CMD4: next_state = (bit_cnt == 4'd8) ? S_DISP_DATA : S_INIT_CMD4;
        S_DISP_DATA: next_state = (data_cnt == 4'd8 && bit_cnt == 4'd8) ? S_IDLE : S_DISP_DATA;
        S_IDLE: next_state = S_IDLE;
        default: next_state = S_RST;
    endcase
end

// 第三段状态机：时序输出（串行发送+引脚控制）
always @(posedge clk_1m or negedge rst_n) begin
    if(!rst_n) begin
        lcd_cs     <= 1'b1;    // 片选默认拉高（未选中）
        lcd_sclk   <= 1'b0;    // 串行时钟默认低
        lcd_sid    <= 1'b0;    // 数据默认低
        lcd_rst    <= 1'b0;    // 复位低有效
        delay_cnt  <= 16'd0;
        bit_cnt    <= 4'd0;
        data_cnt   <= 4'd0;
        send_data  <= 8'h00;
    end else begin
        case(curr_state)
            S_RST: begin  // 复位阶段：低电平1ms
                lcd_rst <= 1'b0;
                delay_cnt <= delay_cnt + 16'd1;
                if(delay_cnt == 16'd1000) begin
                    lcd_rst <= 1'b1;  // 复位结束
                    delay_cnt <= 16'd0;
                end
            end

            S_INIT_CMD1: begin  // 发送指令0x38（8位模式，2行，5*8点阵）
                lcd_cs <= 1'b0;  // 选中LCD
                send_data <= 8'h38;
                // 串行发送8位（先送D7，bit_cnt=0→D7，bit_cnt=7→D0）
                if(bit_cnt < 4'd8) begin
                    lcd_sclk <= ~lcd_sclk;  // 时钟翻转
                    if(lcd_sclk == 1'b1) begin  // 上升沿锁存数据
                        lcd_sid <= send_data[7 - bit_cnt];  // 发送当前位
                        bit_cnt <= bit_cnt + 4'd1;
                    end
                end else begin  // 8位发送完成
                    lcd_cs <= 1'b1;    // 取消片选
                    lcd_sclk <= 1'b0;  // 时钟复位
                    bit_cnt <= 4'd0;   // 位计数器清零
                end
            end

            S_INIT_CMD2: begin  // 发送指令0x0C（显示开，光标关）
                lcd_cs <= 1'b0;
                send_data <= 8'h0C;
                if(bit_cnt < 4'd8) begin
                    lcd_sclk <= ~lcd_sclk;
                    if(lcd_sclk == 1'b1) begin
                        lcd_sid <= send_data[7 - bit_cnt];
                        bit_cnt <= bit_cnt + 4'd1;
                    end
                end else begin
                    lcd_cs <= 1'b1;
                    lcd_sclk <= 1'b0;
                    bit_cnt <= 4'd0;
                end
            end

            S_INIT_CMD3: begin  // 发送指令0x01（清屏）
                lcd_cs <= 1'b0;
                send_data <= 8'h01;
                if(bit_cnt < 4'd8) begin
                    lcd_sclk <= ~lcd_sclk;
                    if(lcd_sclk == 1'b1) begin
                        lcd_sid <= send_data[7 - bit_cnt];
                        bit_cnt <= bit_cnt + 4'd1;
                    end
                end else begin
                    lcd_cs <= 1'b1;
                    lcd_sclk <= 1'b0;
                    bit_cnt <= 4'd0;
                end
            end

            S_INIT_CMD4: begin  // 发送指令0x80（第一行起始地址）
                lcd_cs <= 1'b0;
                send_data <= 8'h80;
                if(bit_cnt < 4'd8) begin
                    lcd_sclk <= ~lcd_sclk;
                    if(lcd_sclk == 1'b1) begin
                        lcd_sid <= send_data[7 - bit_cnt];
                        bit_cnt <= bit_cnt + 4'd1;
                    end
                end else begin
                    lcd_cs <= 1'b1;
                    lcd_sclk <= 1'b0;
                    bit_cnt <= 4'd0;
                end
            end

            S_DISP_DATA: begin  // 发送显示数据（Hello FPGA，ASCII码）
                lcd_cs <= 1'b0;
                // 选择当前要发送的字符
                case(data_cnt)
                    4'd0: send_data <= 8'h48;  // H
                    4'd1: send_data <= 8'h65;  // e
                    4'd2: send_data <= 8'h6C;  // l
                    4'd3: send_data <= 8'h6C;  // l
                    4'd4: send_data <= 8'h6F;  // o
                    4'd5: send_data <= 8'h46;  // F
                    4'd6: send_data <= 8'h50;  // P
                    4'd7: send_data <= 8'h47;  // G
                    4'd8: send_data <= 8'h41;  // A
                    default: send_data <= 8'h00;
                endcase
                // 串行发送当前字符的8位
                if(bit_cnt < 4'd8) begin
                    lcd_sclk <= ~lcd_sclk;
                    if(lcd_sclk == 1'b1) begin
                        lcd_sid <= send_data[7 - bit_cnt];
                        bit_cnt <= bit_cnt + 4'd1;
                    end
                end else begin  // 单个字符发送完成
                    lcd_cs <= 1'b1;
                    lcd_sclk <= 1'b0;
                    bit_cnt <= 4'd0;
                    data_cnt <= data_cnt + 4'd1;  // 下一个字符
                end
            end

            S_IDLE: begin  // 空闲状态：保持引脚稳定
                lcd_cs <= 1'b1;
                lcd_sclk <= 1'b0;
                lcd_sid <= 1'b0;
            end

            default: begin  // 默认状态：复位
                lcd_cs <= 1'b1;
                lcd_sclk <= 1'b0;
                lcd_sid <= 1'b0;
                lcd_rst <= 1'b0;
            end
        endcase
    end
end

endmodule