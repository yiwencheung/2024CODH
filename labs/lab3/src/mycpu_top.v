module mycpu_top(
    input  wire        clk,
    input  wire        resetn,
    // inst sram interface
    output wire        inst_sram_we,
    output wire [31:0] inst_sram_addr,
    output wire [31:0] inst_sram_wdata,
    input  wire [31:0] inst_sram_rdata,
    // data sram interface
    output wire        data_sram_we,
    output wire [31:0] data_sram_addr,
    output wire [31:0] data_sram_wdata,
    input  wire [31:0] data_sram_rdata,
    // trace debug interface
    output wire [31:0] debug_wb_pc,
    output wire [ 3:0] debug_wb_rf_we,
    output wire [ 4:0] debug_wb_rf_wnum,
    output wire [31:0] debug_wb_rf_wdata
);

wire     [31 : 0]    next_pc;
wire     [4 : 0]     rj, rd, rk;
wire     [4 : 0]     rm;     //regMUX的结果
wire     [31 : 0]    rd0, rd1;
wire     [31 : 0]    imm;    //立即数
reg     [31 : 0]    pc;
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
wire                pc_sel;
reg                 valid;      //有效信号，确保reset时不会写入
wire    [31 : 0]    pc_plus_4;
//wire                rst;
wire    [31 : 0]    CTL;        //控制信号总线

//assign rst = ~resetn;
assign pc_plus_4 = pc + 3'h4;
assign inst_sram_we = 1'b0;
assign inst_sram_addr ={14'd0, pc[17 : 0]};
assign inst_sram_wdata = 32'b0;
assign data_sram_we = dm_we & valid;
assign data_sram_addr = ALU_out;
assign data_sram_wdata = rd1;
assign debug_wb_pc = pc;
assign debug_wb_rf_wdata = reg_din;
assign debug_wb_rf_we = RF_we;
assign debug_wb_rf_wnum = rd;

//更新pc
always @(posedge clk) begin
    if(!resetn) 
        pc <= 32'h1bfffffc;
    else 
        pc <= next_pc;
end
always @(posedge clk) begin
    if(!resetn)
        valid <= 0;
    else
        valid <= 1;
end 

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
//例化译码器
Decoder dcd(
    .inst(inst_sram_rdata),
    .CTL(CTL),
    .rd(rd),
    .rj(rj),
    .rk(rk),
    .imm(imm)
);
//例化寄存器堆
reg_file rf(
    .clk(clk),
    .ra0(rj),
    .ra1(rm),
    .rd0(rd0),
    .rd1(rd1),
    .wa(rd),
    .wd(reg_din),
    .we(RF_we & valid)
);
//例化ALU
ALU alu(
    .src0(A_out),
    .src1(B_out),
    .op(ALU_op),
    .res(ALU_out)
);
//寄存器选择器
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
    .sel(pc_sel & valid),
    .res(next_pc)
);

MUX4 Mem2Reg(
    .src0(ALU_out),
    .src1(data_sram_rdata),
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

endmodule