`timescale 1ns / 1ps
module RAM #(
    parameter   DATA_WIDTH = 32,
                ADDR_WIDTH = 10,
                INIT_FILE = ""
)(
    input                         clk,           // clock
    input       [ADDR_WIDTH-1:0]  addr,          // address
    input       [DATA_WIDTH-1:0]  din,           // data input
    input                          we,           // write enable
    output reg  [DATA_WIDTH-1:0] dout            // data output
); 
    reg [DATA_WIDTH-1:0] ram [0: (1 << ADDR_WIDTH) - 1];
integer file, i, code;
  initial begin
    file = $fopen("D:\\Projects\\2024CODH\\labs\\lab1\\RAM\\init.txt", "r");
    if (file == 0) begin
      $display("Error: failed to open file.");
      $finish;
    end

    for (i = 0; i < 13; i = i + 1) begin
      code = $fscanf(file, "%h\\n", ram[i]);
      if (code != 1) begin
        $display("Error: failed to read data for index %d.", i);
        $fclose(file);
        $finish;
      end
   end

   $fclose(file);
   end

    always @(posedge clk) begin
        dout <= ram[addr];
        if (we) ram[addr] <= din;
    end

endmodule
