module  reg_file # (
    parameter ADDR_WIDTH  = 5,              //地址宽度
    parameter DATA_WIDTH  = 32              //数据宽度
)(
    input                       clk,        //时钟
    input   [ADDR_WIDTH -1:0]   ra0, ra1,   //读地址
    output  [DATA_WIDTH -1:0]   rd0, rd1,   //读数据
    input   [ADDR_WIDTH -1:0]   wa,         //写地址
    input   [DATA_WIDTH -1:0]   wd,         //写数据
    input                       we          //写使能
);
    reg [DATA_WIDTH -1:0]  rf [0:(1<<ADDR_WIDTH)-1];    //寄存器堆

    //读操作：写优先，异步读
    assign rd0 = (wa == ra0 && we && wa != 0) ? wd : rf[ra0];   
    assign rd1 = (wa == ra1 && we && wa != 0) ? wd : rf[ra1];

initial rf[0] = 0;

    //写操作：同步写
    always@ (posedge clk) begin
        if (we && wa != 0)  rf[wa] <= wd;
    end

endmodule