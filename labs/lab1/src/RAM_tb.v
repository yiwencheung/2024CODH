`timescale 1ns / 1ps

module RAM_tb;

    // 参数设置
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 10;

    // Testbench信号
    reg clk;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] din;
    reg we;
    wire [DATA_WIDTH-1:0] dout;

    // 实例化RAM模块
    RAM #(
        .DATA_WIDTH(DATA_WIDTH), 
        .ADDR_WIDTH(ADDR_WIDTH),
        .INIT_FILE("init.mem")
 ) 
ram (
        .clk(clk),
        .addr(addr),
        .din(din),
        .we(we),
        .dout(dout)
    );

    // 时钟信号生成
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 产生100MHz的时钟信号
    end

    // 测试过程
    initial begin
        // 初始化信号
        addr = 0;
        din = 0;
        we = 0;

        // 等待几个时钟周期
        #5000

        // 写入数据到特定地址
        we = 1;
        addr = 10; din = 32'h3C3C3C3C; // 写入地址10
        #20
        addr = 15; din = 32'hF0F0F0F0;  // 写入地址15
        #20
        // 关闭写使能
        we = 0;
        
        // 读取并验证数据
        addr = 5;  // 读取地址5
        #100
        addr = 10; // 读取地址10
        #100
        if (dout !== 32'h3C3C3C3C) $display("错误: 地址 %h 的数据不匹配，期望值: %h, 实际值: %h", addr, 32'h3C3C3C3C, dout);
        
        addr = 15;  // 读取地址15
        #100
        if (dout !== 32'hF0F0F0F0) $display("错误: 地址 %h 的数据不匹配，期望值: %h, 实际值: %h", addr, 32'hF0F0F0F0, dout);

        // 测试完成
        $display("测试完成");
        $finish;
    end

endmodule