module cpu_top(
    input   [31 : 0]    addr,
    input               clk,
    input               clk_ld,
    input               debug,
    input   [31 : 0]    din,
    input               rstn,
    input               we_dm,
    input               we_im,

    output  [31 : 0]    A,
    output  [31 : 0]    B,
    output  [31 : 0]    CTL,
    output  [31 : 0]    IMM,
    output  [31 : 0]    IR,
    output  [31 : 0]    MDR,
    output  [31 : 0]    Y,
    output  [31 : 0]    dout_dm,
    output  [31 : 0]    dout_im,
    output  [31 : 0]    dout_rf,
    output  [31 : 0]    npc,
    output  [31 : 0]    pc
);
//根据是否在debug模式下，决定选择的时钟信号
wire clk_mem;
assign clk_mem = debug ?  clk : clk_ld;
//例化im与dm
inst_mem im(
    .clk(clk_mem),
    .a(addr),
    .d(din),
    .we(we_im),
    .spo(dout_im)
);
data_mem dm(
    .clk(clk_mem),
    .a(addr),
    .d(din),
    .we(we_dm),
    .spo(dout_dm)
);

    
endmodule