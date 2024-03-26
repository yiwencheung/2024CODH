`timescale 1ns / 1ps

module RAM_tb;

    // ��������
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 10;

    // Testbench�ź�
    reg clk;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] din;
    reg we;
    wire [DATA_WIDTH-1:0] dout;

    // ʵ����RAMģ��
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

    // ʱ���ź�����
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // ����100MHz��ʱ���ź�
    end

    // ���Թ���
    initial begin
        // ��ʼ���ź�
        addr = 0;
        din = 0;
        we = 0;

        // �ȴ�����ʱ������
        #5000

        // д�����ݵ��ض���ַ
        we = 1;
        addr = 10; din = 32'h3C3C3C3C; // д���ַ10
        #20
        addr = 15; din = 32'hF0F0F0F0;  // д���ַ15
        #20
        // �ر�дʹ��
        we = 0;
        
        // ��ȡ����֤����
        addr = 5;  // ��ȡ��ַ5
        #100
        addr = 10; // ��ȡ��ַ10
        #100
        if (dout !== 32'h3C3C3C3C) $display("����: ��ַ %h �����ݲ�ƥ�䣬����ֵ: %h, ʵ��ֵ: %h", addr, 32'h3C3C3C3C, dout);
        
        addr = 15;  // ��ȡ��ַ15
        #100
        if (dout !== 32'hF0F0F0F0) $display("����: ��ַ %h �����ݲ�ƥ�䣬����ֵ: %h, ʵ��ֵ: %h", addr, 32'hF0F0F0F0, dout);

        // �������
        $display("�������");
        $finish;
    end

endmodule