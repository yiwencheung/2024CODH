`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/14 00:00:20
// Design Name: 
// Module Name: update_seg
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


module update_seg(
    input clk,
    input rstn,
    input [31:0] q,
    output reg [7:0] an,
    output reg [6:0] seg
    );
    reg cc;
    reg [2:0] q1;
    reg [31:0] q2;
    reg yl;
    reg [3:0] d;
    Fren_divider Fren_divider2(
        .k (32'd250000),
        .st (1'b1),
        .rstn (rstn),
        .clk  (clk),
        .yp  (cc),
        .yl (yl),
        .q   (q2)
    );
    counter_8# ( .WIDTH(3), .RST_VLU(0))
    counter_8_1 (
        .clk (cc),
        .rstn  (rstn),
        .d   (3'd7),
        .q  (q1)
    );
    mux mux1(
        .s (q1),
        .q (q),
        .dout (d)
    );
    seven_decode seven_decode1(
        .d (d),
        .y (seg)
    );
    decoder decoder1(
        .q (q1),
        .an (an)
    ); 

endmodule
