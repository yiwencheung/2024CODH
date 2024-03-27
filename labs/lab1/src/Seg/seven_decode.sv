`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 23:47:13
// Design Name: 
// Module Name: seven_decode
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seven_decode(
    input [3:0] d,
    output reg [6:0] y
    );
    always @(*) begin
        case (d)
            4'b0000: y=7'b000_0001;
            4'b0001: y=7'b100_1111;
            4'b0010: y=7'b001_0010;
            4'b0011: y=7'b000_0110;
            4'b0100: y=7'b100_1100;
            4'b0101: y=7'b010_0100;
            4'b0110: y=7'b010_0000;
            4'b0111: y=7'b000_1111;
            4'b1000: y=7'b000_0000;
            4'b1001: y=7'b000_0100;
            4'b1010: y=7'b000_0010;
            4'b1011: y=7'b110_0000;
            4'b1100: y=7'b011_0001;
            4'b1101: y=7'b100_0010;
            4'b1110: y=7'b001_0000;
            4'b1111: y=7'b011_1000;
        endcase
    end
endmodule
