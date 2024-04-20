module Decoder #(
    parameter DATA_WIDTH = 32
) (
    input           [DATA_WIDTH-1 : 0]    inst,       //指令
    output  reg     [DATA_WIDTH-1 : 0]    CTL,        //控制信号
    output  reg     [4 : 0]     rj, rd,     //源寄存器
    output  reg     [4 : 0]     rk,         //目标寄存器
    output  reg     [DATA_WIDTH-1 : 0]     imm         //符号扩展后的立即数
);
//控制信号， 最终将控制信号集成为一根总线CTL(已定义共17位)
reg     RF_Write;           //寄存器写使能
reg     reg_sel;            //选择寄存器的第二个端口 rk/rd
reg     A_sel;              //ALUsrc0选择   pc/reg
reg     B_sel;              //ALUsrc1选择   reg/imm
reg     dm_we;              //data memory写使能 
reg     if_bj;              //在转移指令为1， 该信号与外部CMP结果经与门后作为外部PC_MUX的选择信号 
reg     [1 : 0] MemtoReg;   //目标寄存器数据来源 00：ALU/01：DM/10：PC+4（对于jril等指令）   
//转移指令判断条件，用于CMP模块: 000等于， 001不等于， 010小于， 011大于等于， 100无符号数小于， 101无符号大于等于， 110无条件跳转
reg     [2 : 0] bj_sel;     
reg     [2 : 0] wd_sel;     //访存指令访问字/半字/字节的选择, 000:字, 001:半字, 010:字节, 101:无符号半字, 110:无符号字节
reg     [3 : 0] ALU_op;


always @(*) begin
    CTL = {14'd0, RF_Write, reg_sel, A_sel, B_sel, dm_we, if_bj, MemtoReg, bj_sel, wd_sel, ALU_op};
end


always @(inst) begin
    //设置默认值
    RF_Write = 0; reg_sel = 0;
    A_sel = 0;    B_sel = 0;  
    dm_we = 0;  MemtoReg = 2'b00; ALU_op = 4'd0;
    rd = inst[4 : 0];  rj = inst[9 : 5]; rk = inst[14 : 10]; 
    imm = 32'd0;    wd_sel = 3'd0; 
    if_bj = 0; bj_sel = 3'b000;
    //译码
    case (inst[31 : 26])
        6'b000_000: begin   //大部分算数指令
            case (inst[25 : 22])
                4'b0000: begin
                    //R型指令
                    RF_Write = 1;       
                    A_sel = 1;
                    case (inst[19 : 15])
                        5'b00000:   ALU_op = 4'd0;
                        5'b00010:   ALU_op = 4'd1;
                        5'b00100:   ALU_op = 4'd2;
                        5'b00101:   ALU_op = 4'd3;
                        5'b01000:   ALU_op = 4'd6;
                        5'b01001:   ALU_op = 4'd4;
                        5'b01010:   ALU_op = 4'd5;
                        5'b01011:   ALU_op = 4'd7;
                        5'b01110:   ALU_op = 4'd8;
                        5'b01111:   ALU_op = 4'd9;
                        5'b10000:   ALU_op = 4'd10;
                        default: ALU_op = 4'd0;
                    endcase
                end
                4'b0001: begin
                    //slli.w, srli,w, srai,w
                    imm = {27'd0,inst[14 : 10]};
                    A_sel = 1; B_sel = 1;
                    RF_Write = 1;
                    case (inst[19 : 18])
                        2'b00:  ALU_op = 4'd8;
                        2'b01:  ALU_op = 4'd9;
                        2'b10:  ALU_op = 4'd10; 
                        default: ALU_op = 4'd8;
                    endcase
                end
                4'b1000: begin
                    //slti
                    RF_Write = 1;
                    A_sel = 1; B_sel = 1;
                    imm = {{20{inst[21]}}, inst[21 : 10]};     //有符号扩展  
                    ALU_op = 4'd2;
                end
                4'b1001: begin
                    //sltui
                    RF_Write = 1;
                    A_sel = 1; B_sel = 1;
                    imm = {{20{inst[21]}}, inst[21 : 10]};     //有符号扩展  
                    ALU_op = 4'd3;
                end
                4'b1010: begin
                    //addi.w
                    RF_Write = 1;
                    A_sel = 1; B_sel = 1;
                    imm = {{20{inst[21]}}, inst[21 : 10]};     //有符号扩展  
                    ALU_op = 4'd0;
                end
                4'b1101: begin
                    //andi
                    RF_Write = 1;
                    A_sel = 1; B_sel = 1;
                    imm = {20'd0, inst[21 : 10]};     //无符号扩展  
                    ALU_op = 4'd4;
                end
                4'b1110: begin
                    //ori
                    RF_Write = 1;
                    A_sel = 1; B_sel = 1;
                    imm = {20'd0, inst[21 : 10]};     //无符号扩展  
                    ALU_op = 4'd5;
                end
                4'b1111: begin
                    //xori
                    RF_Write = 1;
                    A_sel = 1; B_sel = 1;
                    imm = {20'd0, inst[21 : 10]};     //无符号扩展  
                    ALU_op = 4'd7;
                end
            endcase
        end
        6'b000_101: begin
            //lu12i.w
            RF_Write = 1;
            B_sel = 1;
            imm = {inst[24 : 5], 12'd0}; 
            ALU_op = 4'd11;
        end
        6'b000_110: begin
            //pcaddu12i
            RF_Write = 1;
            A_sel = 0; B_sel = 1;       //pc+imm
            imm = {inst[24 : 5], 12'd0};
            ALU_op = 4'd0;
        end
        6'b001_010: begin
            //访存指令
            A_sel = 1; B_sel = 1;
            imm = {{20{inst[21]}}, inst[21 : 10]};
            ALU_op = 4'd0;
            case (inst[25 : 22])
                4'b0000: begin
                    //ld.b
                    wd_sel = 3'b010;
                    RF_Write = 1; 
                    MemtoReg = 2'b01;
                end 
                4'b0001: begin
                    //ld.h
                    wd_sel = 3'b001;
                    RF_Write = 1; 
                    MemtoReg = 2'b01;
                end
                4'b0010:begin
                    //ld.w
                    RF_Write = 1; 
                    MemtoReg = 2'b01;
                end
                4'b0100: begin
                    //st.b
                    wd_sel = 3'b010;
                    dm_we = 1;
                    RF_Write = 0;
                    reg_sel = 1;
                end
                4'b0101: begin
                    //st.h
                    wd_sel = 3'b001;
                    dm_we = 1;
                    RF_Write = 0;
                    reg_sel = 1;
                end
                4'b0110: begin
                    //st.w
                    dm_we = 1;
                    RF_Write = 0;
                    reg_sel = 1;
                end
                4'b1000: begin
                    //ld.bu
                    wd_sel = 3'b110;
                    RF_Write = 1; 
                    MemtoReg = 2'b01;
                end
                4'b1001: begin
                    //ld.hu
                    wd_sel = 3'b101;
                    RF_Write = 1; 
                    MemtoReg = 2'b01;
                end
            endcase
        end
        //转移指令
        6'b010_011: begin
            //jirl
            if_bj = 1;  bj_sel = 3'b110;
            A_sel = 1; B_sel = 1; 
            ALU_op = 4'd0; reg_sel = 1;
            MemtoReg = 2'b10;
            imm = {{14{inst[25]}}, inst[25 : 10], 2'd0};  //offset16符号位扩展
        end
        6'b010_100: begin
            //b
            if_bj = 1;  bj_sel = 3'b110;
            A_sel = 0; B_sel = 1; 
            ALU_op = 4'd0; reg_sel = 1;
            imm = {{4{inst[9]}}, inst[9 : 0], inst[25 : 10], 2'd0};
        end
        6'b010_101: begin
            //bl
            if_bj = 1;  bj_sel = 3'b110;
            A_sel = 0; B_sel = 1; 
            ALU_op = 4'd0; reg_sel = 1;
            imm = {{4{inst[9]}}, inst[9 : 0], inst[25 : 10], 2'd0};
            //pc+4写入r1
            rd = 5'd1;      
            RF_Write = 1;   MemtoReg = 2'b10;
        end
        6'b010_110: begin
            //beq
            if_bj = 1;  bj_sel = 3'b000;
            A_sel = 0; B_sel = 1;
            ALU_op = 4'd0; reg_sel = 1;
            imm = {{14{inst[25]}}, inst[25 : 10], 2'd0};
        end
        6'b010_111: begin
            //bne
            if_bj = 1;  bj_sel = 3'b001;
            A_sel = 0; B_sel = 1;
            ALU_op = 4'd0; reg_sel = 1;
            imm = {{14{inst[25]}}, inst[25 : 10], 2'd0};
        end
        6'b011_000: begin
            //blt
            if_bj = 1;  bj_sel = 3'b010;
            A_sel = 0; B_sel = 1;
            ALU_op = 4'd0; reg_sel = 1;
            imm = {{14{inst[25]}}, inst[25 : 10], 2'd0};
        end
        6'b011_001: begin
            //beg
            if_bj = 1;  bj_sel = 3'b011;
            A_sel = 0; B_sel = 1;
            ALU_op = 4'd0; reg_sel = 1;
            imm = {{14{inst[25]}}, inst[25 : 10], 2'd0};
        end
        6'b011_010: begin
            //bltu
            if_bj = 1;  bj_sel = 3'b100;
            A_sel = 0; B_sel = 1;
            ALU_op = 4'd0; reg_sel = 1;
            imm = {{14{inst[25]}}, inst[25 : 10], 2'd0};
        end
        6'b011_011: begin
            //bgeu
            if_bj = 1;  bj_sel = 3'b101;
            A_sel = 0; B_sel = 1;
            ALU_op = 4'd0; reg_sel = 1;
            imm = {{14{inst[25]}}, inst[25 : 10], 2'd0};
        end
    endcase
end

endmodule