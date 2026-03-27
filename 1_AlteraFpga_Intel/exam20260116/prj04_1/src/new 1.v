module data_processor(
    input wire clk,
    input wire rst_n,
    input wire [7:0] raw_data,
    output reg [15:0] processed_data
);
    
    // 函数：实时计算（组合逻辑）
    function automatic [7:0] realtime_calc;
        input [7:0] data;
        begin
            // 实时计算 - 无延迟
            if (data > 128)
                realtime_calc = data - 128;  // 归一化
            else
                realtime_calc = data;
        end
    endfunction
    
    // 任务：后台处理（有时序控制，仅仿真）
    task background_process;
        input [7:0] data;
        output [7:0] result;
        integer sum, count;
        begin
            // 模拟复杂的后台处理
            sum = data;
            count = 1;
            
            // 多步骤处理（模拟算法）
            repeat(5) begin
                @(posedge clk);  // 每个时钟周期处理一步
                sum = sum + data;
                count = count + 1;
            end
            
            // 计算平均值
            result = sum / count;
        end
    endtask
    
    // 模块内部信号
    reg [7:0] func_output, task_output;
    reg [7:0] data_reg;
    reg task_start;
    wire task_done;
    reg [2:0] task_state;
    
    // 函数调用 - 立即执行
    always @* begin
        func_output = realtime_calc(raw_data);
    end
    
    // 任务调用 - 需要状态机控制
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            task_output <= 8'd0;
            task_start <= 1'b0;
            task_state <= 3'd0;
            data_reg <= 8'd0;
        end else begin
            case (task_state)
                0: begin
                    // 等待启动
                    if (task_start) begin
                        data_reg <= raw_data;
                        task_state <= 1;
                    end
                end
                1: begin
                    // 调用任务（在仿真中）
                    // 注意：任务调用会阻塞，所以通常需要fork-join
                    task_state <= 2;
                end
                2: begin
                    // 任务完成后处理结果
                    task_state <= 0;
                    task_start <= 1'b0;
                end
            endcase
        end
    end
    
    // 在testbench中调用任务
    initial begin
        // 启动后台处理
        task_start = 1'b1;
        
        // 使用fork-join调用任务
        fork
            begin
                background_process(data_reg, task_output);
                $display("[%0t] 任务完成: 输入=%0d, 输出=%0d", 
                         $time, data_reg, task_output);
            end
        join_none  // 非阻塞，继续执行
        
        // 继续其他操作...
    end
    
    // 最终输出：函数结果 + 任务结果
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            processed_data <= 16'd0;
        end else begin
            // 将函数和任务的结果相加
            processed_data <= {8'd0, func_output} + {8'd0, task_output};
        end
    end
endmodule