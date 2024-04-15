module CMP #(
    parameter DATA_WIDTH = 32
) (
    input                       if_bj,
    input   [2 : 0]             bj_sel,
    input   [DATA_WIDTH-1 : 0]  src0,
    input   [DATA_WIDTH-1 : 0]  src1,

    output                      PC_sel
);
reg sel;

always @(*) begin
    case (bj_sel)
        3'b000: sel = (src0 == src1);
        3'b001: sel = (src0 != src1);
        3'b010: sel = ($signed(src0) < $signed(src1));
        3'b011: sel = ($signed(src0) >= $signed(src1));
        3'b100: sel = (src0 < src1);
        3'b101: sel = (src0 >= src1);
        3'b110: sel = 1;
        3'b111: sel = 0;
    endcase
end

assign PC_sel = sel & if_bj;
    
endmodule