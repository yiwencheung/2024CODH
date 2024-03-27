`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 23:48:29
// Design Name: 
// Module Name: decoder
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


module decoder(
    input [2:0] q,
    output reg [7:0] an
    );
    always @(*)begin
        case(q)
        3'b111: an=8'b0111_1111;
        3'b110: an=8'b1011_1111;
        3'b101: an=8'b1101_1111;
        3'b100: an=8'b1110_1111;
        3'b011: an=8'b1111_0111;
        3'b010: an=8'b1111_1011;
        3'b001: an=8'b1111_1101;
        3'b000: an=8'b1111_1110;
        default:an=8'b1111_1111;
        endcase
    end
endmodule
