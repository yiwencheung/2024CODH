module MUX #(
    parameter DATA_WIDTH = 32
) (
    input   [DATA_WIDTH-1 : 0]  src0,
    input   [DATA_WIDTH-1 : 0]  src1,
    input                       sel,

    output  [DATA_WIDTH-1 : 0]  res
);

assign res = sel ? src0 : src1;
    
endmodule