module counter (
    input logic clk,        // 时钟信号
    input logic rst_n,      // 异步复位信号，低电平有效
    output logic [3:0] count // 4位计数器输出
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 0; // 异步复位时，计数器归零
        end else begin
            count <= count + 1; // 在每个时钟上升沿，计数器加一
        end
    end

endmodule
