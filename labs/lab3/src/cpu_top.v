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

wire     [31 : 0]    next_pc;
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
reg     [2 : 0] wd_sel;
reg     [3 : 0] ALU_op;
wire    [31 : 0]    ALU_out;
wire    [31 : 0]    reg_din;
wire    [31 : 0]    A_out, B_out;
wire    [31 : 0]    dm_out;
wire                pc_sel;
wire    [31 : 0]    pc_plus_4;

//更新pc
always @(posedge clk, negedge rstn) begin
    if(!rstn)
        pc <= 0;
    else
        pc <= next_pc;
end

assign pc_plus_4 = pc + 4;

//根据是否在debug模式下，决定选择的时钟信号,仅对im和dm有效
wire clk_mem;
assign clk_mem = debug ?  clk : clk_ld;
//例化im与dm
inst_mem im(
    .clk(clk_mem),
    .a(pc[14 : 2]),
    .d(din),
    .we(we_im),
    .spo(dout_im)
);
RAM dm(
    .clk(clk_mem),
    .addr(ALU_out[11 : 2]),
    .addr_sdu(addr[11 : 2]),
    .din(rd1),
    .wd_sel(wd_sel),
    .we(dm_we),
    .dout(dm_out),
    .dout_sdu(dout_dm)
);
//例化译码器
Decoder dcd(
    .inst(dout_im),
    .CTL(CTL),
    .rd(rd),
    .rj(rj),
    .rk(rk),
    .imm(imm)
);
//分配控制信号
always @(*) begin
    RF_we = CTL[17]; reg_sel = CTL[16];
    A_sel = CTL[15]; B_sel = CTL[14];
    dm_we = CTL[13]; if_bj = CTL[12];
    MemtoReg = CTL[11 : 10];
    bj_sel = CTL[9 : 7];
    wd_sel = CTL[6 :4];
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

MUX pc_Mux(
    .src0(pc_plus_4),
    .src1(ALU_out),
    .sel(pc_sel),
    .res(next_pc)
);

MUX4 Mem2Reg(
    .src0(ALU_out),
    .src1(dm_out),
    .src2(pc_plus_4),
    .src3(),
    .sel(MemtoReg),
    .res(reg_din)
);

//CMP模块用于转移指令
CMP cmp(
    .src0(rd0),
    .src1(rd1),
    .if_bj(if_bj),
    .bj_sel(bj_sel),
    .PC_sel(pc_sel)
);
//输出给sdu的端口
always @(*) begin
    npc = next_pc;
end

endmodule