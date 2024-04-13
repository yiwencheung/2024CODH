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
reg     [4 : 0]     rj, rd, rk;
reg     [4 : 0]     rm;     //regMUX的结果
reg     [31 : 0]    rd0, rd1;
reg     [31 : 0]    imm;
//为方便使用， 将CTL信号分开
reg     RF_we, reg_sel;
reg     A_sel, B_sel;
reg     dm_we;
reg     if_bj;
reg     [1 : 0] MemtoReg;
reg     [2 : 0] bj_sel;
reg     [1 : 0] wd_sel;
reg     [3 : 0] ALU_op;
wire    [31 : 0]    ALU_out;
wire    [31 : 0]    reg_din;
wire    [31 : 0]    A_out, B_out;

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
//例化译码器
Decoder dcd(
    .inst(dout_im),
    .CTL(CTL),
    .rj(rj),
    .rd(rd),
    .rj(rj),
    .rk(rk),
    .imm(imm)
);
//分配控制信号
always @(*) begin
    RF_we = CTL[16]; reg_sel = CTL[15];
    A_sel = CTL[14]; B_sel = CTL[13];
    dm_we = CTL[12]; if_bj = CTL[11];
    MemtoReg = CTL[10 : 9];
    bj_sel = CTL[8 : 6];
    wd_sel = CTL[5 :4];
    ALU_op = CTL[3 : 0];
end
//例化寄存器堆
reg_file rf(
    .clk(clk),
    .ra0(rj),
    .ra1(rm),
    .rd0(rd0),
    .rd1(rd1),
    .wa(rd),
    .wd(reg_din),
    .we(RF_we)
);
//例化ALU
ALU alu(
    .src0(A_out),
    .src1(B_out),
    .op(ALU_op),
    .res(ALU_out)
);
//多路选择器
MUX reg_mux(
    .src0(rk),
    .src1(rd),
    .sel(reg_sel),
    .res(rm)
);

MUX mux_A(
    .src0(pc),
    .src1(rd0),
    .sel(A_sel),
    .res(A_out)
);

MUX mux_B(
    .src0(rd1),
    .src1(imm),
    .sel(B_sel),
    .res(B_out)
);

MUX4 Mem2Reg(
    .src0(ALU_out),
    .src1(dout_dm),
    .src2(pc_plus_4),
    .src3(),
    .sel(MemtoReg),
    .res(reg_din)
);

endmodule