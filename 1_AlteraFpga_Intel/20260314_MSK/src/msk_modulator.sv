module msk_modulator
#(
    parameter CLK_FREQ    = 100_000_000,  // 系统时钟频率（100MHz）
    parameter SYMBOL_RATE = 100_000,      // 码元速率（100kbps）
    parameter CARRIER_FREQ = 500_000      // 载波频率（500kHz）
)
(
    input  wire         clk,             // 系统时钟
    input  wire         rst_n,           // 低电平复位
    input  wire         din,             // 输入二进制码元（0/1）
    input  wire         din_valid,       // 输入码元有效标志
    output reg  [15:0]  msk_out,         // MSK输出（16位量化）
    output reg          msk_out_valid    // MSK输出有效标志
);

// 本地参数定义
localparam SYMBOL_PERIOD = CLK_FREQ / SYMBOL_RATE;       // 码元周期（时钟数）
localparam CARRIER_PERIOD = CLK_FREQ / CARRIER_FREQ;     // 载波周期（时钟数）
localparam PHASE_STEP = 360 * CARRIER_FREQ / CLK_FREQ;   // 每个时钟相位增量（度）

// 内部寄存器
reg [31:0] symbol_cnt;       // 码元周期计数器
reg [31:0] carrier_cnt;      // 载波周期计数器
reg [9:0]  phase_i;          // 同相支路相位（0-359度）
reg [9:0]  phase_q;          // 正交支路相位（0-359度）
reg        symbol_reg;       // 码元缓存
reg        symbol_flag;      // 码元半周期标志（用于Q支路延迟）

// 查找表：正弦波量化值（0-359度，16位有符号）
reg [15:0] sin_lut [0:359];

// 初始化正弦波LUT（仿真/综合均可）
initial begin
    integer i;
    for(i=0; i<360; i=i+1) begin
        sin_lut[i] = $rtoi(32767 * $sin(i * 3.1415926 / 180));
    end
end

// 1. 码元周期计数
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        symbol_cnt <= 32'd0;
        symbol_flag <= 1'b0;
    end else if(din_valid) begin
        if(symbol_cnt == SYMBOL_PERIOD - 1) begin
            symbol_cnt <= 32'd0;
            symbol_flag <= 1'b0;
        end else begin
            symbol_cnt <= symbol_cnt + 1'b1;
            // 码元半周期标志（Q支路延迟半个码元）
            symbol_flag <= (symbol_cnt == SYMBOL_PERIOD/2 - 1) ? 1'b1 : symbol_flag;
        end
    end else begin
        symbol_cnt <= 32'd0;
        symbol_flag <= 1'b0;
    end
end

// 2. 码元缓存（保持一个码元周期）
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        symbol_reg <= 1'b0;
    end else if(din_valid && symbol_cnt == 32'd0) begin
        symbol_reg <= din;
    end
end

// 3. 载波相位累加
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        phase_i <= 10'd0;
        phase_q <= 10'd0;
    end else begin
        // I支路相位：0-359循环
        phase_i <= (phase_i + PHASE_STEP) % 360;
        // Q支路相位：延迟半个码元，相位偏移90度
        phase_q <= (phase_q + PHASE_STEP + (symbol_flag ? 90 : 0)) % 360;
    end
end

// 4. MSK信号生成（I+Q支路叠加）
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        msk_out <= 16'd0;
        msk_out_valid <= 1'b0;
    end else if(din_valid) begin
        msk_out_valid <= 1'b1;
        // 码元映射：0→-1，1→+1；I/Q支路分别乘以码元
        if(symbol_reg) begin
            msk_out <= sin_lut[phase_i] + sin_lut[phase_q];
        end else begin
            msk_out <= -sin_lut[phase_i] - sin_lut[phase_q];
        end
    end else begin
        msk_out <= 16'd0;
        msk_out_valid <= 1'b0;
    end
end

endmodule