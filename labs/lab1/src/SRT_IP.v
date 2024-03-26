module SRT #(
    parameter   DATA_WIDTH = 32,
                ADDR_WIDTH = 10
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

reg [ADDR_WIDTH-1 : 0] Sup_Index, cur_index;         //记录每次冒泡的上限和当前指向的下标
reg [DATA_WIDTH-1 : 0] temp;                            //用于交换
wire[DATA_WIDTH-1 : 0] comp_res;                         //用于调用ALU比较两数大小
reg [DATA_WIDTH-1 : 0] data0, data1;                    //两数据分时读取，分别储存 

localparam  WAIT = 3'd0, 
            BEG = 3'd1,                 //初始化
            GETD0 = 3'd2,               //已经获取了mem[index]，准备获取mem[index+1]
            GETD1 = 3'd3,               //获取mem[index+1]
            /* COMP: 获取第二个数据并比较，决定下一个状态
            *  若交换，则将we置1， wd设为mem[index](之前已保存)
            *  若不交换， 改变reg{mem[index]} <- reg{mem[index+1]} ，index+1 <- index+2， 进入GETD 
            */ 
            COMP = 3'd4,                       
            CHAN = 3'd5,                //第一个已写入， 更改index和wd写入第二个, 之后仍视情况改变到COMP或BEG    
            //CHAN1 = 3'd6,
            CHECK = 3'd7;               //查看数据
            
reg [2:0] current_state, next_state;        //状态

//调用ALU比较大小
ALU alu(
    .src0(data0),
    .src1(data1),
    .op(4'd2),
    .res(comp_res)
);
//单端口分布式RAM
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
//状态转移
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
                data0 <= we ? data0 : dout;       //获取第一个数据
                addr <= cur_index + 1;
                count <= count + 1;
            end
            GETD1: begin
                data1 <= dout;      //获取第二个数据
                //决定要不要交换，此时cur_index保持不变，在后面的组合逻辑中改变we的值
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
//状态方程
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
//外部接口
always @(*) begin
    index = addr;
    data = dout;
end

endmodule