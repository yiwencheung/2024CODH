module SRT_top (
    input           clk, rstn,
    input           up,                 //����or����
    input           start,              //����ʼ��־
    input           prior, next,        //�鿴��һ������һ��Ԫ��
    input   [1:0]   sel,                //ѡ������ܲ鿴������

    output    reg      [31 : 0]     output_data,
    output          [7 : 0]     an             //�������ʾ
);
wire done;
wire [8:0] count;
wire [3:0] index;
wire [31:0] data;

//����������ģ��
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
//output_dataѡ���߼�
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
//ʼ����ʾ
assign an = 0;

endmodule