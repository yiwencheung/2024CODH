module ALU#(
    parameter DATA_WIDTH = 32
)(
    input      [DATA_WIDTH-1 : 0]    src0,
    input      [DATA_WIDTH-1 : 0]    src1,
    input      [3  : 0]    op,
    output reg [DATA_WIDTH-1 : 0]    res
);

always @(*) begin
    case (op)
       4'd0: res = src0 + src1;
       4'd1: res = src0 - src1;
       4'd2: res = ($signed(src0)<$signed(src1)) ? 1 : 0;
       4'd3: res = src0 < src1 ? 1 : 0;
       4'd4: res = src0 & src1;
       4'd5: res = src0 | src1;
       4'd6: res = ~(src0 | src1);
       4'd7: res = src0 ^ src1;
       4'd8: res = src0 << src1[4:0];
       4'd9: res = src0 >> src1[4:0];
       4'd10: res = src0 >>> src1[4:0];
       4'd11: res = src1;
    default: res = 32'hFFFF;      
    endcase
end

endmodule