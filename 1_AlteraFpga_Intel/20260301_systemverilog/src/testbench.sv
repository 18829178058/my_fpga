module testbench;
    // 定义信号
    logic clk;
    logic rst_n;
    logic [3:0] count;
    
    // 实例化计数器模块
    counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .count(count)
    );
    
    // 时钟生成任务
//    task automatic generate_clock;
//        forever begin
//            #10 clk = 1; // 时钟高电平5个单位时间
//            #10 clk = 0; // 时钟低电平5个单位时间
//        end
//    endtask
    
	always #10 clk = ~clk;
	
    initial begin
        // 初始化信号
        clk = 0;
        rst_n = 0; // 初始复位状态
        #10; // 等待一段时间以使复位生效（例如10个单位时间）
        rst_n = 1; // 释放复位信号，开始计数
        
        // 监控计数器输出直到完成测试或达到某个条件
        #200; // 例如，运行200个时钟周期后结束仿真（可根据需要调整）
        $finish; // 结束仿真
    end
endmodule
