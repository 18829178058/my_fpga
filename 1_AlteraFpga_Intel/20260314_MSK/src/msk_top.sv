module msk_top
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
    output reg  [15:0]  dout,         // MSK输出（16位量化）
    output reg          dout_valid    // MSK输出有效标志
);

wire [15:0] msk_out;
wire        msk_out_valid;


msk_modulator #(
    .CLK_FREQ(CLK_FREQ),
    .SYMBOL_RATE(SYMBOL_RATE),
    .CARRIER_FREQ(CARRIER_FREQ)
) u_msk_modulator (
    .clk(clk),
    .rst_n(rst_n),
    .din(din),
    .din_valid(din_valid),
    .msk_out(msk_out),
    .msk_out_valid(msk_out_valid)
);

// 实例化解调模块
msk_demodulator #(
    .CLK_FREQ(CLK_FREQ),
    .SYMBOL_RATE(SYMBOL_RATE),
    .CARRIER_FREQ(CARRIER_FREQ)
) u_msk_demodulator (
    .clk(clk),
    .rst_n(rst_n),
    .msk_in(msk_out),
    .msk_in_valid(msk_out_valid),
    .dout(dout),
    .dout_valid(dout_valid)
);

endmodule