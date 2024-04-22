module memMask (
    input           [31 : 0] invalue,
    input           [1 : 0]  mem_sel,
    input           [3 : 0]  type_sel,
    output  reg     [31 : 0] outvalue                     
);

always @(*) begin
    case (type_sel)
        4'b1000:    //byte
            outvalue = mem_sel[1] ? (mem_sel[0] ? {{24{invalue[31]}}, invalue[31 : 24]} : {{24{invalue[23]}}, invalue[23 : 16]})
                                  : (mem_sel[0] ? {{24{invalue[15]}}, invalue[15 : 8]}  : {{24{invalue[7]}}, invalue[7 : 0]});
        4'b0100:    //halfword
            outvalue = (mem_sel == 2'b00) ? {{16{invalue[15]}}, invalue[15 : 0]}
                        : ((mem_sel == 2'b11) ? {{16{invalue[31]}}, invalue[31 : 16]} : invalue);
        4'b0010:    //unsigned byte
            outvalue = mem_sel[1] ? (mem_sel[0] ? {24'h0, invalue[31 : 24]} : {24'h0, invalue[23 : 16]})
                                  : (mem_sel[0] ? {24'h0, invalue[15 : 8]}  : {24'h0, invalue[7 : 0]});
        4'b0010:
            outvalue = (mem_sel == 2'b00) ? {16'h0, invalue[15 : 0]}
                        : ((mem_sel == 2'b11) ? {16'h0, invalue[31 : 16]} : invalue);
        default: outvalue = invalue;
    endcase
end
    
endmodule