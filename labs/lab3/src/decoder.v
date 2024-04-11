module Decoder #(
    parameter DATA_WIDTH = 32
) (
    input           [31 : 0]    inst,       //指令
    output  reg     [31 : 0]    CTL,        //控制信号
    output  reg     [4 : 0]     rj, rd,     //源寄存器
    output  reg     [4 : 0]     rk,         //目标寄存器
    output  reg     [31 : 0]     imm         //符号扩展后的立即数
);
//控制信号， 最终将控制信号集成为一根总线CTL
reg    pc_sel;         //pc选择， +4/+offset
reg    RF_Write;       //寄存器写使能
reg    reg_sel;        //选择寄存器的第二个端口 rk/rd
reg    SE_en;          //符号扩展使能
reg    A_sel;          //ALUsrc0选择   pc/reg
reg    B_sel;          //ALUsrc1选择   reg/imm
reg    dm_we;          //data memory写使能
reg    MemtoReg;       //目标寄存器数据来源 ALU/DM     
reg    [3 : 0] ALU_op;

always @(*) begin
    //设置默认值
    pc_sel = 0; RF_Write = 0; reg_sel = 0;
    SE_en = 0;  A_sel = 0;    B_sel = 0;  
    dm_we = 0;  MemtoReg = 0; ALU_op = 4'd0;
    rd = inst[4 : 0];  rj = inst[9 : 5]; rk = inst[14 : 10]; 
    imm = 32'd0;
    //译码
    if (inst[31 : 26] == 6'd0) begin
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
                    2'b11:  ALU_op = 4'd10; 
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
                imm = {20'd0, inst[21 : 10]};     //有符号扩展  
                ALU_op = 4'd4;
            end
            4'b1110: begin
                //ori
                RF_Write = 1;
                A_sel = 1; B_sel = 1;
                imm = {20'd0, inst[21 : 10]};     //有符号扩展  
                ALU_op = 4'd5;
            end
            4'b1111: begin
                //xori
                RF_Write = 1;
                A_sel = 1; B_sel = 1;
                imm = {20'd0, inst[21 : 10]};     //有符号扩展  
                ALU_op = 4'd7;
            end
        endcase
    end
end

//比较模块, 用于branch指令

endmodule