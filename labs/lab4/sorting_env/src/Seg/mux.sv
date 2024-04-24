`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 23:53:21
// Design Name: 
// Module Name: mux
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


module mux(
    input [2:0] s,
    input [31:0] q,
    output reg [3:0] dout
    );
    always @(*)begin
        case(s)
        3'b111: dout=q[31:28];
        3'b110: dout=q[27:24];
        3'b101: dout=q[23:20];
        3'b100: dout=q[19:16];
        3'b011: dout=q[15:12];
        3'b010: dout=q[11:8];
        3'b001: dout=q[7:4];
        3'b000: dout=q[3:0];
        default: dout=4'b0000;
        endcase
    end
endmodule
