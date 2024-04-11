module cpu_top(
    input   [31 : 0]    addr,
    input               clk,
    input               clk_ld,
    input               debug,
    input   [31 : 0]    din,
    input               rstn,
    input               we_dm,
    input               we_im,

    output reg  [31 : 0]    A,
    output reg  [31 : 0]    B,
    output reg  [31 : 0]    CTL,
    output reg  [31 : 0]    IMM,
    output reg  [31 : 0]    IR,
    output reg  [31 : 0]    MDR,
    output reg  [31 : 0]    Y,
    output reg  [31 : 0]    dout_dm,
    output reg  [31 : 0]    dout_im,
    output reg  [31 : 0]    dout_rf,
    output reg  [31 : 0]    npc,
    output reg  [31 : 0]    pc
);
reg     [31 : 0]    next_pc;
//更新pc
always @(posedge clk, negedge rstn) begin
    if(!rstn)
        pc <= 32'h1bfffffc;
    else
        pc <= next_pc;
end

//根据是否在debug模式下，决定选择的时钟信号,仅对im和dm有效
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