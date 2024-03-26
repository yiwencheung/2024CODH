module SRT_top (
    input           clk, rstn,
    input           up,                 //升序or降序
    input           start,              //排序开始标志
    input           prior, next,        //查看上一个，下一个元素
    input   [1:0]   sel,                //选择数码管查看的数据

    output    reg      [31 : 0]     output_data,
    output          [7 : 0]     an             //数码管显示
);
wire done;
wire [8:0] count;
wire [3:0] index;
wire [31:0] data;

//例化排序器模块
SRT #(
    .DATA_WIDTH(32),
    .ADDR_WIDTH(4)
)my_srt(
    .clk(clk),
    .rstn(rstn),
    .up(up),
    .start(start),
    .prior(prior),
    .next(next),
    .done(done),
    .count(count),
    .index(index),
    .data(data)
);
//output_data选择逻辑
always @(*) begin
    if(!done)
        output_data = 32'hFFFF_FFFF;
    else begin
        case (sel)
            2'b00: output_data = data;
            2'b01: output_data = {{23{1'b0}},count};
            2'b10: output_data = {{28{1'b0}},index};
            default: output_data = 32'hFFFF_FFFF;
        endcase
    end
end
//始终显示
assign an = 0;

endmodule