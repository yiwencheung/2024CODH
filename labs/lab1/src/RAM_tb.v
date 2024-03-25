`timescale 1ns / 1ps
module RAM_tb();

reg clk,we;
reg [9:0] addr;
reg [31:0] din;
wire [31:0] dout;

always #5 clk = ~clk;

initial begin
    clk = 0; din = 32'hFFFF_BBBB; addr = 0; we =0;
    #20
    we = 1;
    #30
    addr = 10'b0000_0011_01; din = 32'hFA07_F111;
end

RAM #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(10),
    .INIT_FILE("D:\\Projects\\2024CODH\\labs\\lab1\\INIT_FILE.mem")
)my_ram  
(
    .clk(clk),
    .addr(addr),
    .we(we),
    .din(din),
    .dout(dout)
);


endmodule