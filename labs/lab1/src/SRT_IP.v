module SRT #(
    parameter   DATA_WIDTH = 32,
                ADDR_WIDTH = 10
)(
    input           clk, rstn,
    input           up,                 //����or����
    input           start,              //����ʼ��־
    input           prior, next,        //�鿴��һ������һ��Ԫ��

    output  reg                            done,               //������־
    output  reg     [2*ADDR_WIDTH : 0]     count,              //ʱ��������
    output  reg     [ADDR_WIDTH-1 : 0]     index,              //�鿴�����±�
    output  reg     [DATA_WIDTH-1 : 0]     data                //�鿴����
);

reg [ADDR_WIDTH-1 : 0] Sup_Index, cur_index;         //��¼ÿ��ð�ݵ����޺͵�ǰָ����±�
reg [DATA_WIDTH-1 : 0] temp;                            //���ڽ���
wire[DATA_WIDTH-1 : 0] comp_res;                         //���ڵ���ALU�Ƚ�������С
reg [DATA_WIDTH-1 : 0] data0, data1;                    //�����ݷ�ʱ��ȡ���ֱ𴢴� 

localparam  WAIT = 3'd0, 
            BEG = 3'd1,                 //��ʼ��
            GETD0 = 3'd2,               //�Ѿ���ȡ��mem[index]��׼����ȡmem[index+1]
            GETD1 = 3'd3,               //��ȡmem[index+1]
            /* COMP: ��ȡ�ڶ������ݲ��Ƚϣ�������һ��״̬
            *  ����������we��1�� wd��Ϊmem[index](֮ǰ�ѱ���)
            *  ���������� �ı�reg{mem[index]} <- reg{mem[index+1]} ��index+1 <- index+2�� ����GETD 
            */ 
            COMP = 3'd4,                       
            CHAN = 3'd5,                //��һ����д�룬 ����index��wdд��ڶ���, ֮����������ı䵽COMP��BEG    
            //CHAN1 = 3'd6,
            CHECK = 3'd7;               //�鿴����
            
reg [2:0] current_state, next_state;        //״̬

//����ALU�Ƚϴ�С
ALU alu(
    .src0(data0),
    .src1(data1),
    .op(4'd2),
    .res(comp_res)
);
//���˿ڷֲ�ʽRAM
reg [3:0] addr; reg we;
reg [31:0] din;
wire [31:0] dout;

RAM_dist ram(
    .clk(clk),
    .a(addr),
    .d(din),
    .we(we),
    .spo(dout)
);
//״̬ת��
always @(posedge clk) begin
    if(!rstn) begin
        count <= 0;
        addr <= 0;
        current_state <= WAIT;
    end
    else begin
        current_state <= next_state;
        case (next_state)
            WAIT: begin 
                Sup_Index <= 1 << ADDR_WIDTH;
            end
            BEG: begin
                cur_index <= 0;
                addr <= 0; 
                count <= count + 1;
                Sup_Index <= Sup_Index - 1;
            end
            GETD0: begin
                cur_index <= cur_index+1;
                data0 <= we ? data0 : dout;       //��ȡ��һ������
                addr <= cur_index + 1;
                count <= count + 1;
            end
            GETD1: begin
                data1 <= dout;      //��ȡ�ڶ�������
                //����Ҫ��Ҫ��������ʱcur_index���ֲ��䣬�ں��������߼��иı�we��ֵ
                din <= data0;
                count <= count + 1;
            end
            CHAN: begin
                din <= data1;
                addr <= cur_index - 1;
                count <= count + 1;
            end
            CHECK: begin
                if(prior)
                    addr <= addr - 1;
                else if(next)
                    addr <= addr + 1;
            end    
        endcase
    end
end
//״̬����
always @(*) begin
    we = 0;
    done = 0;
    case (current_state)
        WAIT: begin
            next_state = start ? BEG : WAIT;
            done = 1;
        end
        BEG:  next_state = (Sup_Index==0) ? CHECK : GETD0;
        GETD0: next_state = GETD1;
        GETD1: begin
            next_state = (comp_res[0] ^ up) ? CHAN : 
                                    (cur_index==Sup_Index ? BEG : GETD0);
            we = comp_res[0] ^ up;
        end
        CHAN:begin
            next_state = (cur_index == Sup_Index) ? BEG : GETD0;
            we = 1;
        end
        CHECK: begin 
            next_state = CHECK;
            done = 1;
        end
    endcase
end
//�ⲿ�ӿ�
always @(*) begin
    index = addr;
    data = dout;
end

endmodule