module SRT #(
    parameter   DATA_WIDTH = 32,
                ADDR_WIDTH = 10,
                INIT_FILE = ""
)(
    input           clk, rstn,
    input           up,                 //����or����
    input           start,              //����ʼ��־
    input           prior, next,        //�鿴��һ������һ��Ԫ��

    output  reg                            done,               //������־
    output  reg     [2*ADDR_WIDTH : 0]     count,              //ʱ��������
    output  reg     [ADDR_WIDTH-1 : 0]     index,              //�鿴�����±�
    output  reg     [DATA_WIDTH-1 : 0]     data,                //�鿴����
    output          [ 3:0]          seg_data,                   //�������ʾdata
    output          [ 2:0]          seg_an
);

reg [DATA_WIDTH-1 : 0] ram [0: (1 << ADDR_WIDTH) - 1];    //RAM
reg [ADDR_WIDTH-1 : 0] Sup_Index, cur_index;         //��¼ÿ��ð�ݵ����޺͵�ǰָ����±�
reg [DATA_WIDTH-1 : 0] temp;                            //���ڽ���
wire[DATA_WIDTH-1 : 0] comp_res;                         //���ڵ���ALU�Ƚ�������С

initial $readmemh(INIT_FILE, ram);    

localparam  WAIT = 3'd0, BEG = 3'd1,
            COMP = 3'd2, CHAN = 3'd3,
            INCRE = 3'd4, CHECK = 3'd5;
            
reg [2:0] current_state, next_state;        //״̬

//����ALU�Ƚϴ�С
ALU alu(
    .src0(ram[index]),
    .src1(ram[index + 1]),
    .op(4'd2),
    .res(comp_res)
);

//״̬ת��
always @(posedge clk ) begin
    if(! rstn)begin
        count <= 0;
        current_state <= WAIT;
    end
    else begin
        current_state <= next_state;
        //����count
        if(current_state != WAIT && current_state != CHECK)
            count <= count + 1;                     //���ڱȽϽ׶�������
    end
end

//״̬����
always @(*) begin
    case (current_state)
        WAIT: begin
            next_state = start ? BEG : WAIT;
            done = 1;
            index = 0; 
            data = ram[index];
            Sup_Index = 1 << ADDR_WIDTH - 1;
        end
        BEG: begin
            next_state = Sup_Index ? COMP : CHECK;
            cur_index = 0;
        end
        COMP: next_state = (comp_res[0] ^ up) ? CHAN : INCRE;
        CHAN: begin
            temp = ram[cur_index];
            ram[cur_index] = ram[cur_index + 1];
            ram[cur_index + 1] = temp;
            next_state = INCRE;
        end
        INCRE: begin
            cur_index += 1;
            if(cur_index == Sup_Index)begin
                next_state = BEG;
                Sup_Index = Sup_Index - 1;
            end
            else 
                next_state = COMP;
        end
        CHECK: begin
            //����˽׶κ��������˳���ֻ�и�λ�ſ���
            next_state = CHECK;
            //�鿴����
            if(prior)
                index -= 1;
            else if(next)
                index += 1;
            data = ram[index];
        end
    endcase
end
//�����ģ����ʾdata
Segment seg(
    .clk(clk),
    .rst(~rstn),
    .output_data(data),
    .seg_data(seg_data),
    .seg_an(seg_an)
);



endmodule