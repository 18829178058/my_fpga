module lcd12864_driver (
    input  wire        clk,      // 系统时钟（如 50MHz）
    input  wire        rst_n,    // 异步复位，低有效
    output reg         rs,       // 命令/数据选择
    output reg         cs,       // 片选
    output reg         scl,      // 串行时钟
    output reg         sda,      // 串行数据
    output reg         res       // 复位
);

// 状态定义
localparam IDLE    = 2'b00;
localparam INIT    = 2'b01;
localparam SEND_CMD = 2'b10;
localparam SEND_DATA = 2'b11;

reg [1:0] state;
reg [7:0] cmd_index;
reg [7:0] init_cmds [7:0];
reg [7:0] send_data;
reg [3:0] bit_cnt;
reg [23:0] clk_div;

// 时钟分频器（生成 ~100kHz SCL）
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        clk_div <= 24'd0;
    end else begin
        clk_div <= clk_div + 1;
    end
end

// 主状态机
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        rs <= 1'b0;
        cs <= 1'b1;
        scl <= 1'b0;
        sda <= 1'b1;
        res <= 1'b0;
        cmd_index <= 0;
        bit_cnt <= 0;
    end else begin
        case (state)
            IDLE: begin
                // 复位序列
                res <= 1'b0;
                if (clk_div[19]) res <= 1'b1; // 保持低电平 >1us
                state <= INIT;
            end

            INIT: begin
                if (cmd_index < 5) begin
                    rs <= 1'b0; // 指令模式
                    send_data <= 8'b1111_1111;
                    cs <= 1'b0; // 选中芯片
                    state <= SEND_CMD;
                end else begin
                    rs <= 1'b1; // 数据模式
                    send_data <= 8'h35; // 示例：显示字符 '5'
                    state <= SEND_DATA;
                end
            end

            SEND_CMD, SEND_DATA: begin
                if (bit_cnt == 0) begin
                    scl <= 1'b0;
                    sda <= 1'b0;
                end else if (bit_cnt < 8) begin
                    scl <= 1'b1;
                    #1 scl <= 1'b0; // 简化时序，实际需精确延时
                    sda <= send_data[7 - bit_cnt];
                end else begin
                    bit_cnt <= 0;
                    if (state == SEND_CMD) begin
                        cmd_index <= cmd_index + 1;
                        state <= INIT;
                    end else begin
                        cs <= 1'b1; // 释放片选
                        state <= IDLE;
                    end
                end
                bit_cnt <= bit_cnt + 1;
            end

            default: state <= IDLE;
        endcase
    end
end

endmodule
