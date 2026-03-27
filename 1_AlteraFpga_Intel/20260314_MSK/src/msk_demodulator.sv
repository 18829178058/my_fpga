module msk_demodulator
#(
    parameter CLK_FREQ    = 100_000_000,  // 系统时钟频率
    parameter SYMBOL_RATE = 100_000,      // 码元速率
    parameter CARRIER_FREQ = 500_000      // 载波频率
)
(
    input  wire         clk,             // 系统时钟
    input  wire         rst_n,           // 低电平复位
    input  wire [15:0]  msk_in,          // 输入MSK信号
    input  wire         msk_in_valid,    // 输入有效标志
    output reg          dout,            // 解调输出码元
    output reg          dout_valid       // 输出有效标志
);

// 本地参数
localparam SYMBOL_PERIOD = CLK_FREQ / SYMBOL_RATE;       // 码元周期（时钟数）
localparam CARRIER_PERIOD = CLK_FREQ / CARRIER_FREQ;     // 载波周期（时钟数）
localparam PHASE_STEP = 360 * CARRIER_FREQ / CLK_FREQ;   // 相位增量（度）
localparam LPF_DEPTH = 8;                                // 低通滤波器阶数

// 内部寄存器
reg [31:0] symbol_cnt;       // 码元周期计数器
reg [31:0] carrier_cnt;      // 载波周期计数器
reg [9:0]  phase_i;          // 本地I支路相位
reg [9:0]  phase_q;          // 本地Q支路相位
reg [15:0] sin_lut [0:359];  // 正弦波LUT
reg [31:0] i_mul;            // I支路相乘结果
reg [31:0] q_mul;            // Q支路相乘结果
reg [31:0] i_lpf [0:LPF_DEPTH-1];  // I支路低通滤波
reg [31:0] q_lpf [0:LPF_DEPTH-1];  // Q支路低通滤波
reg [31:0] i_integral;       // I支路积分
reg [31:0] q_integral;       // Q支路积分

// 初始化正弦波LUT
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
    end else if(msk_in_valid) begin
        if(symbol_cnt == SYMBOL_PERIOD - 1) begin
            symbol_cnt <= 32'd0;
        end else begin
            symbol_cnt <= symbol_cnt + 1'b1;
        end
    end else begin
        symbol_cnt <= 32'd0;
    end
end

// 2. 本地载波相位生成（与调制端同步）
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        phase_i <= 10'd0;
        phase_q <= 10'd0;
    end else begin
        phase_i <= (phase_i + PHASE_STEP) % 360;
        phase_q <= (phase_q + PHASE_STEP + 90) % 360;  // Q支路相位偏移90度
    end
end

// 3. 接收信号与本地载波相乘
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        i_mul <= 32'd0;
        q_mul <= 32'd0;
    end else if(msk_in_valid) begin
        i_mul <= $signed(msk_in) * $signed(sin_lut[phase_i]);
        q_mul <= $signed(msk_in) * $signed(sin_lut[phase_q]);
    end else begin
        i_mul <= 32'd0;
        q_mul <= 32'd0;
    end
end

// 4. 低通滤波（滑动平均，滤除2倍载波频率分量）
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        integer i;
        for(i=0; i<LPF_DEPTH; i=i+1) begin
            i_lpf[i] <= 32'd0;
            q_lpf[i] <= 32'd0;
        end
    end else if(msk_in_valid) begin
        // 移位寄存器+求和
        i_lpf[0] <= i_mul;
        q_lpf[0] <= q_mul;
        for(integer i=1; i<LPF_DEPTH; i=i+1) begin
            i_lpf[i] <= i_lpf[i-1];
            q_lpf[i] <= q_lpf[i-1];
        end
    end
end

// 5. 码元周期内积分
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        i_integral <= 32'd0;
        q_integral <= 32'd0;
        dout <= 1'b0;
        dout_valid <= 1'b0;
    end else if(msk_in_valid) begin
        if(symbol_cnt == 32'd0) begin
            // 积分清零
            i_integral <= $signed(i_lpf[LPF_DEPTH-1]);
            q_integral <= $signed(q_lpf[LPF_DEPTH-1]);
            dout_valid <= 1'b0;
        end else if(symbol_cnt == SYMBOL_PERIOD - 1) begin
            // 积分结束，判决码元
            i_integral <= i_integral + $signed(i_lpf[LPF_DEPTH-1]);
            q_integral <= q_integral + $signed(q_lpf[LPF_DEPTH-1]);
            // 判决规则：I+Q > 0 → 1，否则 → 0
            dout <= (i_integral + q_integral) > 32'd0 ? 1'b1 : 1'b0;
            dout_valid <= 1'b1;
        end else begin
            // 积分累加
            i_integral <= i_integral + $signed(i_lpf[LPF_DEPTH-1]);
            q_integral <= q_integral + $signed(q_lpf[LPF_DEPTH-1]);
            dout_valid <= 1'b0;
        end
    end else begin
        dout_valid <= 1'b0;
    end
end

endmodule