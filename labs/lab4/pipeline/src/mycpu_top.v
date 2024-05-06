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
reg         reset;
always @(posedge clk) reset <= ~resetn;

reg         valid;
always @(posedge clk) begin
    if (reset) begin
        valid <= 1'b0;
    end
    else begin
        valid <= 1'b1;
    end
end

wire [31:0] seq_pc;
wire [31:0] nextpc;
wire        br_taken;
wire [31:0] br_target;
reg  [31:0] pc;

wire [11:0] alu_op;
wire        load_op;
wire        src1_is_pc;
wire        src2_is_imm;
wire        res_from_mem;
wire        dst_is_r1;
wire        gr_we;
wire        mem_we;
wire        src_reg_is_rd;
wire        rj_eq_rd;
wire        rj_lt_rd;
wire        rj_ltu_rd;
wire [4: 0] dest;
wire [31:0] rj_value;
wire [31:0] rkd_value;
wire [31:0] imm;
wire [31:0] br_offs;
wire [31:0] jirl_offs;

wire [ 5:0] op_31_26;
wire [ 3:0] op_25_22;
wire [ 1:0] op_21_20;
wire [ 4:0] op_19_15;
wire [ 4:0] rd;
wire [ 4:0] rj;
wire [ 4:0] rk;
wire [11:0] i12;
wire [19:0] i20;
wire [15:0] i16;
wire [25:0] i26;

wire [63:0] op_31_26_d;
wire [15:0] op_25_22_d;
wire [ 3:0] op_21_20_d;
wire [31:0] op_19_15_d;

wire        inst_add_w;
wire        inst_sub_w;
wire        inst_slt;
wire        inst_sltu;
wire        inst_nor;
wire        inst_and;
wire        inst_or;
wire        inst_xor;
wire        inst_slli_w;
wire        inst_srli_w;
wire        inst_srai_w;
wire        inst_addi_w;
wire        inst_ld_w;
wire        inst_st_w;
wire        inst_jirl;
wire        inst_b;
wire        inst_bl;
wire        inst_beq;
wire        inst_bne;
wire        inst_lu12i_w;
wire        inst_pcaddu12i_w;
wire        inst_andi_w;
wire        inst_slti_w;
wire        inst_sltui_w;
wire        inst_ori_w;
wire        inst_xori_w;
wire        inst_sll_w;
wire        inst_srl_w;
wire        inst_sra_w;
wire        inst_ld_b;
wire        inst_ld_h;
wire        inst_ld_hu;
wire        inst_ld_bu;
wire        inst_st_b;
wire        inst_st_h;
wire        inst_blt;
wire        inst_bltu;
wire        inst_bge;
wire        inst_bgeu;

wire        need_ui5;
wire        need_si12;
wire        need_ui12;
wire        need_si16;
wire        need_si20;
wire        need_si26;
wire        src2_is_4;

wire [ 4:0] rf_raddr1;
wire [31:0] rf_rdata1;
wire [ 4:0] rf_raddr2;
wire [31:0] rf_rdata2;
wire        rf_we   ;
wire [ 4:0] rf_waddr;
wire [31:0] rf_wdata;

wire [31:0] alu_src1   ;
wire [31:0] alu_src2   ;
wire [31:0] alu_result ;

wire [31:0] mem_result;
wire [31:0] final_result;
wire [31:0] dmem_masked_wdata;

wire        mem_byte;
wire        mem_halfword;
wire        mem_ubyte;
wire        mem_uhalfword;

//pipeline
reg  [31:0] pc_if;
reg  [31:0] pc_id;
reg  [31:0] inst_if;
reg  [31:0] imm_id;
reg  [31:0] alu_src1_id, alu_src2_id;
reg         rf_we_id, rf_we_ex, rf_we_mem;
reg  [11:0] alu_op_id;
reg  [31:0] br_offs_id, jirl_offs_id;
reg  [31:0] rj_value_id; 
reg  [31:0] rkd_value_id;
wire        br_type;
reg         br_type_id, br_taken_id;
wire  [3:0] mem_type;
reg   [3:0] mem_type_id;
reg         mem_we_id;
reg   [4:0] dest_id;  
reg         res_from_mem_id;
reg  [31:0] alu_result_ex;


//IF_Stage
assign seq_pc       = pc + 3'h4;
assign nextpc       = br_taken ? br_target : seq_pc;

always @(posedge clk) begin
    if (reset) begin
        pc <= 32'h1bff_fffc;     //trick: to make nextpc be 0x1c000000 during reset 
    end
    else begin
        pc <= nextpc;
    end
end

assign inst_sram_we    = 1'b0;
assign inst_sram_addr  = pc;
assign inst_sram_wdata = 32'b0;

//IF-ID
always @(posedge clk) begin
    if(reset) begin
        pc_if <= 32'h1bff_fffc;
        inst_if <= 32'h0000_0000;
    end
    else begin
        pc_if <= pc;
        inst_if <= inst_sram_rdata;
    end
end

//ID_Stage
assign op_31_26  = inst_if[31:26];
assign op_25_22  = inst_if[25:22];
assign op_21_20  = inst_if[21:20];
assign op_19_15  = inst_if[19:15];

assign rd   = inst_if[ 4: 0];
assign rj   = inst_if[ 9: 5];
assign rk   = inst_if[14:10];

assign i12  = inst_if[21:10];
assign i20  = inst_if[24: 5];
assign i16  = inst_if[25:10];
assign i26  = {inst_if[ 9: 0], inst_if[25:10]};

decoder_6_64 u_dec0(.in(op_31_26 ), .out(op_31_26_d ));
decoder_4_16 u_dec1(.in(op_25_22 ), .out(op_25_22_d ));
decoder_2_4  u_dec2(.in(op_21_20 ), .out(op_21_20_d ));
decoder_5_32 u_dec3(.in(op_19_15 ), .out(op_19_15_d ));

assign inst_add_w       = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h00];
assign inst_sub_w       = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h02];
assign inst_slt         = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h04];
assign inst_sltu        = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h05];
assign inst_nor         = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h08];
assign inst_and         = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h09];
assign inst_or          = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h0a];
assign inst_xor         = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h0b];
assign inst_slli_w      = op_31_26_d[6'h00] & op_25_22_d[4'h1] & op_21_20_d[2'h0] & op_19_15_d[5'h01];
assign inst_srli_w      = op_31_26_d[6'h00] & op_25_22_d[4'h1] & op_21_20_d[2'h0] & op_19_15_d[5'h09];
assign inst_srai_w      = op_31_26_d[6'h00] & op_25_22_d[4'h1] & op_21_20_d[2'h0] & op_19_15_d[5'h11];
assign inst_addi_w      = op_31_26_d[6'h00] & op_25_22_d[4'ha];
assign inst_ld_w        = op_31_26_d[6'h0a] & op_25_22_d[4'h2];
assign inst_st_w        = op_31_26_d[6'h0a] & op_25_22_d[4'h6];
assign inst_jirl        = op_31_26_d[6'h13];
assign inst_b           = op_31_26_d[6'h14];
assign inst_bl          = op_31_26_d[6'h15];
assign inst_beq         = op_31_26_d[6'h16];
assign inst_bne         = op_31_26_d[6'h17];
assign inst_lu12i_w     = op_31_26_d[6'h05] & ~inst_if[25];
//add 19 new instructions.
assign inst_pcaddu12i_w = op_31_26_d[6'h07] & ~inst_if[25];
assign inst_andi_w      = op_31_26_d[6'h00] & op_25_22_d[4'hd];
assign inst_ori_w       = op_31_26_d[6'h00] & op_25_22_d[4'he];
assign inst_xori_w      = op_31_26_d[6'h00] & op_25_22_d[4'hf];
assign inst_slti_w      = op_31_26_d[6'h00] & op_25_22_d[4'h8];
assign inst_sltui_w     = op_31_26_d[6'h00] & op_25_22_d[4'h9];
assign inst_sll_w       = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h0e];
assign inst_srl_w       = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h0f];
assign inst_sra_w       = op_31_26_d[6'h00] & op_25_22_d[4'h0] & op_21_20_d[2'h1] & op_19_15_d[5'h10];
assign inst_ld_b        = op_31_26_d[6'h0a] & op_25_22_d[4'h0];
assign inst_ld_h        = op_31_26_d[6'h0a] & op_25_22_d[4'h1];
assign inst_st_b        = op_31_26_d[6'h0a] & op_25_22_d[4'h4];
assign inst_st_h        = op_31_26_d[6'h0a] & op_25_22_d[4'h5];
assign inst_ld_bu       = op_31_26_d[6'h0a] & op_25_22_d[4'h8];
assign inst_ld_hu       = op_31_26_d[6'h0a] & op_25_22_d[4'h9];
assign inst_blt         = op_31_26_d[6'h18];
assign inst_bltu        = op_31_26_d[6'h1a];
assign inst_bge         = op_31_26_d[6'h19];
assign inst_bgeu        = op_31_26_d[6'h1b];


assign alu_op[ 0] = inst_add_w | inst_addi_w | inst_ld_w | inst_st_w | inst_ld_b | inst_ld_h
                    | inst_st_b | inst_st_h | inst_ld_bu | inst_ld_hu
                    | inst_jirl | inst_bl | inst_blt | inst_bltu| inst_bge | inst_bgeu
                    | inst_pcaddu12i_w;
assign alu_op[ 1] = inst_sub_w;
assign alu_op[ 2] = inst_slt | inst_slti_w;
assign alu_op[ 3] = inst_sltu | inst_sltui_w;
assign alu_op[ 4] = inst_and | inst_andi_w;
assign alu_op[ 5] = inst_nor;
assign alu_op[ 6] = inst_or  | inst_ori_w;
assign alu_op[ 7] = inst_xor | inst_xori_w;
assign alu_op[ 8] = inst_slli_w | inst_sll_w;
assign alu_op[ 9] = inst_srli_w | inst_srl_w;
assign alu_op[10] = inst_srai_w | inst_sra_w;
assign alu_op[11] = inst_lu12i_w;

assign need_ui5   =  inst_slli_w | inst_srli_w | inst_srai_w;
assign need_si12  =  inst_addi_w | inst_ld_w | inst_st_w | inst_slti_w | inst_sltui_w
                      | inst_ld_b | inst_ld_h | inst_st_b | inst_st_h | inst_ld_bu |inst_ld_hu;
assign need_ui12  =  inst_andi_w | inst_ori_w | inst_xori_w;
assign need_si16  =  inst_jirl | inst_beq | inst_bne | inst_blt | inst_bltu | inst_bge | inst_bgeu;
assign need_si20  =  inst_lu12i_w | inst_pcaddu12i_w;
assign need_si26  =  inst_b | inst_bl;
assign src2_is_4  =  inst_jirl | inst_bl;

assign imm = src2_is_4 ? 32'h4                      :
             need_si20 ? {i20[19:0], 12'b0}         :
             need_ui5  ? rk                         :
             need_si12 ? {{20{i12[11]}}, i12[11:0]} :
             /*need_ui12*/ {20'h0, i12[11:0]}       ;

assign br_offs = need_si26 ? {{ 4{i26[25]}}, i26[25:0], 2'b0} :
                             {{14{i16[15]}}, i16[15:0], 2'b0} ;

assign jirl_offs = {{14{i16[15]}}, i16[15:0], 2'b0};

assign src_reg_is_rd = inst_beq | inst_bne | inst_blt | inst_bge | inst_bltu | inst_bgeu | inst_st_w | inst_st_b | inst_st_h;

assign src1_is_pc    = inst_jirl | inst_bl | inst_pcaddu12i_w;

assign src2_is_imm   = inst_slli_w |
                       inst_srli_w |
                       inst_srai_w |
                       inst_addi_w |
                       inst_ld_w   | inst_ld_b | inst_ld_h | inst_ld_bu | inst_ld_hu |
                       inst_st_w   | inst_st_b | inst_st_h |
                       inst_lu12i_w|
                       inst_jirl   |
                       inst_bl     |
                       inst_pcaddu12i_w |
                       inst_andi_w |
                       inst_ori_w  |
                       inst_xori_w |
                       inst_slti_w |
                       inst_sltui_w;

assign res_from_mem  = inst_ld_w | inst_ld_b | inst_ld_h | inst_ld_bu | inst_ld_hu;
assign dst_is_r1     = inst_bl;
assign gr_we         = ~inst_st_w & ~inst_st_b & ~inst_st_h & ~inst_beq & ~inst_bne & ~inst_b & ~inst_blt & ~inst_bltu
                        & ~inst_bge & ~inst_bgeu;
assign rf_we    = gr_we && valid;
assign mem_we        = inst_st_w | inst_st_b | inst_st_h;
assign dest          = dst_is_r1 ? 5'd1 : rd;

assign rf_raddr1 = rj;
assign rf_raddr2 = src_reg_is_rd ? rd :rk;
regfile u_regfile(
    .clk    (clk      ),
    .raddr1 (rf_raddr1),
    .rdata1 (rf_rdata1),
    .raddr2 (rf_raddr2),
    .rdata2 (rf_rdata2),
    .we     (rf_we_mem),
    .waddr  (rf_waddr_mem),
    .wdata  (rf_wdata_mem)
    );

assign rj_value  = rf_rdata1;
assign rkd_value = rf_rdata2;

assign alu_src1 = src1_is_pc  ? pc : rj_value;
assign alu_src2 = src2_is_imm ? imm : rkd_value;

assign mem_byte = inst_ld_b | inst_st_b;
assign mem_halfword = inst_ld_h | inst_st_h;
assign mem_ubyte = inst_ld_bu;
assign mem_uhalfword = inst_ld_hu;
assign mem_type = {mem_byte, mem_halfword, mem_ubyte, mem_uhalfword};

assign rj_eq_rd = (rj_value == rkd_value);
assign rj_lt_rd = ($signed(rj_value) < $signed(rkd_value));
assign rj_ltu_rd = (rj_value < rkd_value);
assign br_taken = (   inst_beq  &&  rj_eq_rd
                   || inst_bne  && !rj_eq_rd
                   || inst_blt  &&  rj_lt_rd
                   || inst_bge  && !rj_lt_rd
                   || inst_bltu &&  rj_ltu_rd
                   || inst_bgeu && !rj_ltu_rd
                   || inst_jirl
                   || inst_bl
                   || inst_b
                  ) && valid;
assign br_type = inst_beq || inst_bne || inst_blt || inst_bge || inst_bltu || inst_bgeu || inst_bl || inst_b;

//ID-EX
always @(posedge clk) begin
    if (reset) begin
        pc_id <= 32'h0000_0000;
        imm_id <= 32'h0000_0000;
        rf_we_id <= 0;
        alu_src1_id <= 32'h0000_0000;
        alu_src2_id <= 32'h0000_0000;
        rj_value_id <= 32'h0000_0000;
        rkd_value_id <= 32'h0000_0000;
        alu_op_id <= 12'd0;
    end
    else begin
        pc_id <= pc_if;
        imm_id <= imm;
        rf_we_id <= rf_we;
        alu_src1_id <= alu_src1;
        alu_src2_id <= alu_src2;
        rj_value_id <= rj_value;
        rkd_value_id <= rkd_value;
        alu_op_id <= alu_op;
    end
end

always @(posedge clk) begin
    if(reset) begin
        br_offs_id <= 32'h0000_0000;
        jirl_offs_id <= 32'h0000_0000;
        br_type_id <= 1;
        br_taken_id <= 0;
    end
    else begin
        br_offs_id <= br_offs;
        jirl_offs_id <= jirl_offs;
        br_type_id <= br_type;
        br_taken_id <= br_taken;
    end
end

always @(posedge clk) begin
    if(reset) begin
        res_from_mem_id <= 0;
        mem_type_id <= 4'b1000;
        dest_id <= 5'd1;
        mem_we_id <= 0;
    end
    else begin
        res_from_mem_id <= res_from_mem;
        mem_type_id <= mem_type;
        mem_we_id <= mem_we;
        dest_id <= dest;
    end
end

//EX_Stage
reg         mem_we_ex;
reg         mem_type_ex;
reg         res_from_mem_ex;
reg [4:0]   dest_ex;
reg [31:0]  br_target_ex;
reg [31:0]  dmem_wdata_ex;

assign br_target = br_type_id ? (pc_id + br_offs) : /*inst_jirl*/ (rj_value_id + jirl_offs);

alu u_alu(
    .alu_op     (alu_op_id   ),
    .alu_src1   (alu_src1_id ),
    .alu_src2   (alu_src2_id ),
    .alu_result (alu_result)
    );

//EX-MEM
always @(posedge clk) begin
    if(reset) begin
        alu_result_ex <= 32'h0000_0000;
        mem_we_ex <= 0;
        dest_ex <= 4'd0;
        br_target_ex <= 32'h0000_0000;
        dmem_wdata_ex <= 32'h0000_0000;
        mem_type_ex <= 4'b1000;
        res_from_mem_ex <= 0;
        rf_we_ex <= 0;
    end
    else begin
        alu_result_ex <= alu_result;
        mem_we_ex <= mem_we_id;
        dest_ex <= dest_id;
        br_target_ex <= br_target;
        dmem_wdata_ex <= rkd_value_id;
        mem_type_ex <= mem_type_id;
        res_from_mem_ex <= res_from_mem_id;
        rf_we_ex <= rf_we_id;
    end
end

//MEM
reg  [4:0]   rf_waddr_mem;
reg  [31:0]  rf_wdata_mem;

assign data_sram_we    = mem_we_ex && valid;
assign data_sram_addr  = alu_result_ex;

memMask w_mask(
    .invalue(dmem_wdata_ex),
    .mem_sel(alu_result_ex[1:0]),
    .type_sel(mem_type_ex),
    .lors(1),
    .dm_rdata(data_sram_rdata),
    .outvalue(dmem_masked_wdata)
    );

memMask r_mask(
    .invalue(data_sram_rdata),
    .mem_sel(alu_result_ex[1:0]),
    .type_sel(mem_type_ex),
    .lors(0),
    .dm_rdata(32'h0000_0000),
    .outvalue(mem_result)
    );

assign data_sram_wdata = dmem_masked_wdata; 
assign final_result = res_from_mem_ex ? mem_result : alu_result_ex;
assign rf_waddr = dest_ex;
assign rf_wdata = final_result;

//MEM-WB
always @(posedge clk ) begin
    if(reset) begin
        rf_waddr_mem <= 5'd0;
        rf_wdata_mem <= 32'h0000_0000;
        rf_we_mem <= 0;
    end
    else begin
        rf_waddr_mem <= rf_waddr;
        rf_wdata_mem <= rf_wdata;
        rf_we_mem <= rf_we_ex;
    end
end

// debug info generate
assign debug_wb_pc       = pc;
assign debug_wb_rf_we    = {4{rf_we_mem}};
assign debug_wb_rf_wnum  = rf_waddr_mem;
assign debug_wb_rf_wdata = rf_wdata_mem;

endmodule
