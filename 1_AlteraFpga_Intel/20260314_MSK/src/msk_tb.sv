`timescale 1ns/1ps

module msk_tb;

// 参数定义
parameter CLK_FREQ    = 100_000_000;  // 100MHz
parameter SYMBOL_RATE = 100_000;      // 100kbps
parameter CARRIER_FREQ = 500_000;    // 500kHz
parameter SIM_TIME    = 10000;       // 仿真时长（时钟周期）

// 信号声明
reg         clk;
reg         rst_n;
reg         din;
reg         din_valid;
wire [15:0] msk_out;
wire        msk_out_valid;
wire        dout;
wire        dout_valid;



// 复位信号
initial begin
    rst_n = 1'b0;
	 clk = 1'b0;
    #100;
    rst_n = 1'b1;
end

// 生成时钟（100MHz，周期10ns）
    always #10 clk = ~clk;



// 生成随机输入码元
initial begin
    din = 1'b0;
    din_valid = 1'b0;
    #200;
    for(integer i=0; i<SIM_TIME/(CLK_FREQ/SYMBOL_RATE); i=i+1) begin
        din_valid = 1'b1;
        din = $random % 2;  // 随机0/1
        $display("Time: %0t ns, Input Symbol: %b", $time, din);
        #(CLK_FREQ/SYMBOL_RATE * 10);  // 码元周期延迟（10ns/时钟）
    end
    din_valid = 1'b0;
    #1000;
    $finish;
end

// 实例化模块
msk_top #(
    .CLK_FREQ(CLK_FREQ),
    .SYMBOL_RATE(SYMBOL_RATE),
    .CARRIER_FREQ(CARRIER_FREQ)
) msk_top_inst (
    .clk(clk),
    .rst_n(rst_n),
    .din(din),
    .din_valid(din_valid),
    .dout(dout),
    .dout_valid(dout_valid)
);

// 打印解调结果
always @(posedge clk) begin
    if(dout_valid) begin
        $display("Time: %0t ns, Demod Symbol: %b", $time, dout);
    end
end

// 生成波形文件
initial begin
    $dumpfile("msk_waveform.vcd");
    $dumpvars(0, msk_tb);
end

endmodule