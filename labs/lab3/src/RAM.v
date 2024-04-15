module RAM #(
    parameter   DATA_WIDTH = 32,
                ADDR_WIDTH = 10,
                INIT_FILE = ""
)(
    input                           clk,           // clock
    input       [ADDR_WIDTH+1 : 0]  addr,          // address
    input       [ADDR_WIDTH+1 : 0]  addr_sdu,
    input       [DATA_WIDTH-1:0]    din,           // data input
    input       [2 : 0]             wd_sel,
    input                           we,           // write enable                       
    output reg  [DATA_WIDTH-1 : 0]  dout,            // data output
    output reg  [DATA_WIDTH-1 : 0]  dout_sdu
); 
    reg [DATA_WIDTH-1 : 0] ram [0: (1 << ADDR_WIDTH) - 1];
    reg [DATA_WIDTH-1 : 0] data_temp;
    reg [DATA_WIDTH-1 : 0] din_temp;

    always @(*) begin
      data_temp = ram[addr[ADDR_WIDTH+1 : 2]];
      dout_sdu = ram[addr_sdu[ADDR_WIDTH+1 : 2]];
    end

    always @(*) begin
      case (wd_sel)
        3'b000: begin   //字
          dout = data_temp;
          din_temp = din;
        end
        3'b001: begin  //半字
          case (addr[1 : 0])
            2'b00:  begin
              dout = {{16{data_temp[15]}}, data_temp[15 : 0]};
              din_temp = {{16{din[15]}}, din[15 : 0]};
            end
            2'b10: begin
              dout = {{16{data_temp[31]}}, data_temp[31 : 16]};
              din_temp = {{16{din[31]}}, din[31 : 16]};
            end 
            default: begin
              dout = data_temp;
              din_temp = din;
            end
          endcase
        end  
        3'b010: begin   //字节
          case (addr[1 : 0])
          2'b00:  begin
            dout = {{24{data_temp[7]}},data_temp[7:0]};
            din_temp = {{24{din[7]}},din[7:0]};
          end
          2'b01:begin
            dout = {{24{data_temp[15]}},data_temp[15:8]};
            din_temp = {{24{din[15]}}, din[15 : 8]};
          end
          2'b10: begin
            dout = {{24{data_temp[23]}},data_temp[23:16]};
            din_temp = {{24{din[23]}}, din[23 : 16]};
          end
          2'b11: begin
            dout = {{24{data_temp[31]}},data_temp[31:24]};
            din_temp = {{24{din[31]}}, din[31 : 24]};
          end
          endcase
        end
        3'b101: begin     //无符号半字
          case (addr[1 : 0])
            2'b00:  begin
              dout = {16'd0, data_temp[15 : 0]};
              din_temp = {16'd0, din[15 : 0]};
            end
            2'b10: begin
              dout = {16'd0, data_temp[31 : 16]};
              din_temp = {16'd0, din[31 : 16]};
            end 
            default: begin
              dout = data_temp;
              din_temp = din;
            end
          endcase
        end  
        3'b110: begin   //无符号字节
          case (addr[1 : 0])
          2'b00:  begin
            dout = {24'd0, data_temp[7:0]};
            din_temp = {24'd0,din[7:0]};
          end
          2'b01:begin
            dout = {24'd0,data_temp[15:8]};
            din_temp = {24'd0, din[15 : 8]};
          end
          2'b10: begin
            dout = {24'd0,data_temp[23:16]};
            din_temp = {24'd0, din[23 : 16]};
          end
          2'b11: begin
            dout = {24'd0,data_temp[31:24]};
            din_temp = {24'd0, din[31 : 24]};
          end
          endcase
        end
        default: begin
          dout = data_temp;
          din_temp = din;
        end
      endcase
    end

    always @(posedge clk) begin
        if (we) ram[addr[ADDR_WIDTH+1 : 2]] <= din_temp;
    end
endmodule
