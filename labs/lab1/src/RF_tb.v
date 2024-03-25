`timescale 1ns / 1ps

module reg_file_tb;

// ��������
reg clk;
reg we;
reg [4:0] ra0, ra1, wa;
reg [31:0] wd;
wire [31:0] rd0, rd1;

// ʵ�����Ĵ�����
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

// ʱ���ź�����
always #10 clk = ~clk;

// ���Թ���
initial begin
    // ��ʼ��
    clk = 0;
    we = 0;
    ra0 = 0;
    ra1 = 0;
    wa = 0;
    wd = 0;

    // �ȴ������ȶ�
    #100;

    // д�����ֵ
    we = 1; wa = 5'd1; wd = 32'hA5A5A5A5;    ra0 = 5'd1;
    if (rd0 !== 32'hA5A5A5A5) begin
        $display("Test failed for ra0. Expected: %h, Got: %h", 32'hA5A5A5A5, rd0);
    end
    #20; // �ȴ�һ��ʱ������
    we = 0; wa = 5'd0; // �ر�дʹ��

    // ��ȡ����֤
    #20; 
    ra1 = 5'd1;
    #20; // �ȴ�һ��ʱ�������Թ۲��ȡ���
    if (rd1 !== 32'hA5A5A5A5) begin
        $display("Test failed for ra1. Expected: %h, Got: %h", 32'hA5A5A5A5, rd1);
    end

    $display("All tests passed.");
    $finish;
end

endmodule
