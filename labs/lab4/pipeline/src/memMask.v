module memMask (
    input           [31 : 0] invalue,
    input           [1 : 0]  mem_sel,
    input           [3 : 0]  type_sel,
    input                    lors,      //0表示ld, 1表示st
    input           [31 : 0] dm_rdata,
    output  reg     [31 : 0] outvalue                     
);

always @(*) begin
    if(!lors) begin
        case (type_sel)
            4'b1000:    //byte
                outvalue = mem_sel[1] ? (mem_sel[0] ? {{24{invalue[31]}}, invalue[31 : 24]} : {{24{invalue[23]}}, invalue[23 : 16]})
                        : (mem_sel[0] ? {{24{invalue[15]}}, invalue[15 : 8]}  : {{24{invalue[7]}}, invalue[7 : 0]});
            4'b0100:    //halfword
                outvalue = (mem_sel == 2'b00 || mem_sel == 2'b01) ? {{16{invalue[15]}}, invalue[15 : 0]}
                            : {{16{invalue[31]}}, invalue[31 : 16]} ;
            4'b0010:    //unsigned byte
                outvalue = mem_sel[1] ? (mem_sel[0] ? {24'h0, invalue[31 : 24]} : {24'h0, invalue[23 : 16]})
                        : (mem_sel[0] ? {24'h0, invalue[15 : 8]}  : {24'h0, invalue[7 : 0]});
            4'b0001:
                outvalue = (mem_sel == 2'b00 || mem_sel == 2'b01) ? {16'h0, invalue[15 : 0]}
                        : {16'h0, invalue[31 : 16]} ;
            default: outvalue = invalue;
        endcase
    end
    else begin
        case (type_sel)
            4'b1000:  begin
                case (mem_sel)
                    2'b00:  outvalue = {dm_rdata[31 : 8], invalue[7 : 0]};
                    2'b01:  outvalue = {dm_rdata[31 :16], invalue[7 : 0], dm_rdata[7:0]};
                    2'b10:  outvalue = {dm_rdata[31 :24], invalue[7 : 0], dm_rdata[15: 0]};
                    2'b11:  outvalue = {invalue[7 : 0], dm_rdata[23: 0]};
                endcase
            end
            4'b0100:    //halfword
                outvalue = (mem_sel == 2'b00 || mem_sel == 2'b01) ? {dm_rdata[31:16], invalue[15 : 0]}
                            : {invalue[15 : 0], dm_rdata[15:0]} ;
            default: outvalue = invalue;
        endcase
    end
end
    
endmodule