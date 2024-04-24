`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/13 21:06:44
// Design Name: 
// Module Name: Fren_divider
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


module Fren_divider(
    input [31:0] k,
    input clk,
    input st,
    input rstn,
    output reg [31:0] q,
    output reg yp,
    output reg yl
    );
    reg ce;
    reg pe;
    always @(*)begin
        if(!rstn) pe=0;
        else if(st&&!q) pe=1;
        else pe=0; 
    end
    always @(posedge clk,negedge rstn)begin
        if(!rstn) yp<=0;
        else if(!st) yp<=0;
        else if(q==1) yp<=1;
        else yp<=0; 
    end
    always @(posedge clk,negedge rstn)begin
        if(!rstn) yl<=0;
        else if(!st) yl<=0;
        else if(2*q==k+1) yl<=1;
        else if(!q) yl<=0;
    end
    always @(*)begin
        if(!rstn) ce=0;
        else if(st) ce=1;
    end

    always @(posedge clk,negedge rstn)begin
        if(!rstn) q<=0;
        else if(!st) q<=0;
        else if(pe) q<=k;
        else if(ce) q<=q-1;
    end
endmodule
