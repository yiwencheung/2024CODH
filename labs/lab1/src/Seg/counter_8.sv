`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 23:13:34
// Design Name: 
// Module Name: counter_8
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


module  counter_8 #(
    parameter WIDTH = 3, 
             RST_VLU = 0
)(
    input                   clk, rstn, 
    input       [WIDTH-1:0] d,
    output reg  [WIDTH-1:0] q
);
    always @(posedge clk,negedge rstn) begin
        if (!rstn)      q <= RST_VLU;
        else if (!q)    q <= d;
        else            q <= q - 1; 
    end
endmodule