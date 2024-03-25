`timescale 1ns / 1ps

module reg_file_tb;

// 参数定义
reg clk;
reg we;
reg [4:0] ra0, ra1, wa;
reg [31:0] wd;
wire [31:0] rd0, rd1;

// 实例化寄存器堆
reg_file #(
    .ADDR_WIDTH(5),
    .DATA_WIDTH(32)
) uut (
    .clk(clk),
    .ra0(ra0),
    .ra1(ra1),
    .rd0(rd0),
    .rd1(rd1),
    .wa(wa),
    .wd(wd),
    .we(we)
);

// 时钟信号生成
always #10 clk = ~clk;

// 测试过程
initial begin
    // 初始化
    clk = 0;
    we = 0;
    ra0 = 0;
    ra1 = 0;
    wa = 0;
    wd = 0;

    // 等待仿真稳定
    #100;

    // 写入测试值
    we = 1; wa = 5'd1; wd = 32'hA5A5A5A5;    ra0 = 5'd1;
    if (rd0 !== 32'hA5A5A5A5) begin
        $display("Test failed for ra0. Expected: %h, Got: %h", 32'hA5A5A5A5, rd0);
    end
    #20; // 等待一个时钟周期
    we = 0; wa = 5'd0; // 关闭写使能

    // 读取并验证
    #20; 
    ra1 = 5'd1;
    #20; // 等待一个时钟周期以观察读取结果
    if (rd1 !== 32'hA5A5A5A5) begin
        $display("Test failed for ra1. Expected: %h, Got: %h", 32'hA5A5A5A5, rd1);
    end

    $display("All tests passed.");
    $finish;
end

endmodule
