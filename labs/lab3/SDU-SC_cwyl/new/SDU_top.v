`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/25 16:05:08
// Design Name: 
// Module Name: SDU_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SDU_top(
    input clk,
    input rstn,
    input rxd,
    output txd
    );
    wire clk_cpu;
    wire [31:0] pc_chk; //����SDU���жϵ��飬�ڵ�����cpu�У�pc_chk = pc
    wire [31:0] npc;    //next_pc
    wire [31:0] pc;
    wire [31:0] IR;     //��ǰָ��
    wire [31:0] IMM;    //������
    wire [31:0] CTL;    //�����źţ�����Խ����п����źż���һ��bus���
    wire [31:0] A;      //ALU������A
    wire [31:0] B;      //ALU������B
    wire [31:0] Y;      //ALU�����
    wire [31:0] MDR;    //���ݴ洢�������
    /*
    addr��SDU�����cpu�ĵ�ַ��
    cpu���������ַ��ins_mem/reg_file/data_mem�ж�ȡ���ݣ����߹���һ����ַ��
    ע�⣬�����ַ�����ڴ�������ĵ�ַ������Ҫ�����κδ���ֱ�ӽ���cpu�еĶ�Ӧģ�鼴��
    dout_rf �Ǵ�reg_file�ж�ȡ��addr��ַ������
    dout_dm �Ǵ�data_mem�ж�ȡ��addr��ַ������
    dout_im �Ǵ�ins_mem�ж�ȡ��addr��ַ������
    din ��SDU�����cpu�����ݣ�cpu��Ҫ���������д�뵽addr��ַ��Ӧ�Ĵ洢����
    we_dm �����ݴ洢��дʹ���źţ���we_dmΪ1ʱ��cpu��din�е�����д�뵽addr��ַ��Ӧ�Ĵ洢����
    we_im ��ָ��洢��дʹ���źţ���we_imΪ1ʱ��cpu��din�е�����д�뵽addr��ַ��Ӧ�Ĵ洢����
    clk_ld ��SDU��������ڵ���ʱд��ins_mem/data_mem��ʱ�ӣ�Ҫ��clk_cpu���ֿ���������clkͬʱֻ����һ���ڹ���
    debug �ǵ����źţ���debugΪ1ʱ��cpu��ins_mem��data_memӦʹ��clk_ldʱ�ӣ�����ʹ��clkʱ��
    */
    wire [31:0] addr;   
    wire [31:0] dout_rf;
    wire [31:0] dout_dm;
    wire [31:0] dout_im;
    wire [31:0] din;
    wire we_dm;
    wire we_im;
    wire clk_ld;
    wire debug;
    cpu_top CPU(
        .clk(clk_cpu),
        .rstn(rstn),
        .pc_chk(pc_chk),
        .npc(npc),
        .pc(pc),
        .IR(IR),
        .CTL(CTL),
        .A(A),
        .B(B),
        .IMM(IMM),
        .Y(Y),
        .MDR(MDR),
        .addr(addr),
        .dout_rf(dout_rf),
        .dout_dm(dout_dm),
        .dout_im(dout_im),
        .din(din),
        .we_dm(we_dm),
        .we_im(we_im),
        .clk_ld(clk_ld)
        ,.debug(debug)
    );
    SDU SDU_cwyl(
        .clk(clk),
        .rstn(rstn),
        .rxd(rxd),
        .txd(txd),
        .clk_cpu(clk_cpu),
        .pc_chk(pc),
        .npc(npc),
        .pc(pc),
        .IR(IR),
        .IMM(IMM),
        .CTL(CTL),
        .A(A),
        .B(B),
        .Y(Y),
        .MDR(MDR),
        .addr(addr),
        .dout_rf(dout_rf),
        .dout_dm(dout_dm),
        .dout_im(dout_im),
        .din(din),
        .we_dm(we_dm),
        .we_im(we_im),
        .clk_ld(clk_ld),
        .debug(debug)
    );
endmodule