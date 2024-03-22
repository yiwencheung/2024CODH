module SRT #(
    parameter   DATA_WIDTH = 32,
                ADDR_WIDTH = 10,
                INIT_FILE = ""
)(
    input           clk, rstn,
    input           up,                 //升序or降序
    input           start,              //排序开始标志
    input           prior, next,        //查看上一个，下一个元素

    output  reg                            done,               //结束标志
    output  reg     [2*ADDR_WIDTH : 0]     count,              //时钟周期数
    output  reg     [ADDR_WIDTH-1 : 0]     index,              //查看数据下标
    output  reg     [DATA_WIDTH-1 : 0]     data                //查看数据
);

reg [DATA_WIDTH-1 : 0] ram [0: (1 << ADDR_WIDTH) - 1];    //RAM
reg [ADDR_WIDTH-1 : 0] Sup_Index, cur_index;         //记录每次冒泡的上限和当前指向的下标
reg [DATA_WIDTH-1 : 0] temp;                            //用于交换
wire[DATA_WIDTH-1 : 0] comp_res;                         //用于调用ALU比较两数大小

initial $readmemh(INIT_FILE, ram);    

localparam  WAIT = 3'd0, BEG = 3'd1,
            COMP = 3'd2, CHAN = 3'd3,
            INCRE = 3'd4, CHECK = 3'd5;
            
reg [2:0] current_state, next_state;        //状态

//调用ALU比较大小
ALU alu(
    .src0(ram[index]),
    .src1(ram[index + 1]),
    .op(4'd2),
    .res(comp_res)
);

//状态转移
always @(posedge clk ) begin
    if(! rstn)begin
        count <= 0;
        current_state <= WAIT;
    end
    else begin
        current_state <= next_state;
        //更新count
        if(current_state != WAIT && current_state != CHECK)
            count <= count + 1;                     //仅在比较阶段内自增
    end
end

//状态方程
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
            //进入此阶段后不能主动退出，只有复位才可以
            next_state = CHECK;
            //查看数据
            if(prior)
                index -= 1;
            else if(next)
                index += 1;
            data = ram[index];
        end
    endcase
end



endmodule