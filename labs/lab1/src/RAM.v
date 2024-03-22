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

    initial $readmemh(INIT_FILE, ram);    // initialize memory

    always @(posedge clk) begin
        dout <= ram[addr];
        if (we) ram[addr] <= din;
    end

endmodule
