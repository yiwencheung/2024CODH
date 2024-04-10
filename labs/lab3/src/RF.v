module  reg_file # (
    parameter ADDR_WIDTH  = 5,              //��ַ���
    parameter DATA_WIDTH  = 32              //���ݿ��
)(
    input                       clk,        //ʱ��
    input   [ADDR_WIDTH -1:0]   ra0, ra1,   //����ַ
    output  [DATA_WIDTH -1:0]   rd0, rd1,   //������
    input   [ADDR_WIDTH -1:0]   wa,         //д��ַ
    input   [DATA_WIDTH -1:0]   wd,         //д����
    input                       we          //дʹ��
);
    reg [DATA_WIDTH -1:0]  rf [0:(1<<ADDR_WIDTH)-1];    //�Ĵ�����

    //��������д���ȣ��첽��
    assign rd0 = (wa == ra0 && we && wa != 0) ? wd : rf[ra0];   
    assign rd1 = (wa == ra1 && we && wa != 0) ? wd : rf[ra1];

initial rf[0] = 0;

    //д������ͬ��д
    always@ (posedge clk) begin
        if (we && wa != 0)  rf[wa] <= wd;
    end

endmodule