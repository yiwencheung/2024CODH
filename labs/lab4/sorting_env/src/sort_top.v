module sort_top (
    input   clk, rstn,
    input   start,
    input   prior, next,

    output [6 : 0]  seg,
    output [7 : 0]  an
);
wire    inst_sram_we;
wire [31:0] inst_sram_addr;
wire [31:0] inst_sram_wdata;
wire [31:0] inst_sram_rdata;

wire        data_sram_we;
wire [31:0] data_sram_cpu_addr;
reg  [31:0] data_sram_top_addr;
wire [31:0] data_sram_final_addr;
wire [31:0] data_sram_wdata;
wire [31:0] data_sram_rdata;

wire [31:0] output_data;

reg         priorReg, nextReg;

assign data_sram_final_addr = start ? data_sram_cpu_addr : data_sram_top_addr;
assign output_data = start ? 32'hFFFF_FFFF : data_sram_rdata;

always @(posedge clk) begin
    if(~rstn) begin
        priorReg <= 0;
        nextReg <= 0;
        data_sram_top_addr <= 0;
    end
    else begin
        priorReg <= prior;
        nextReg <= next;
        if(next && !nextReg)
            data_sram_top_addr <= data_sram_top_addr + 4;
        else if(prior && !priorReg)
            data_sram_top_addr <= data_sram_top_addr - 4;
    end
end

inst_ram imem(
    .clk(clk),
    .a(inst_sram_addr[17:2]),
    .d(inst_sram_wdata),
    .we(inst_sram_we),
    .spo(inst_sram_rdata)
    );

data_ram dmem(
    .clk(clk),
    .a(data_sram_final_addr[17:2]),
    .d(data_sram_wdata),
    .we(data_sram_we),
    .spo(data_sram_rdata)
    );

mycpu_top mt(
    .clk(clk),
    .resetn(start),
    .inst_sram_addr(inst_sram_addr),
    .inst_sram_we(inst_sram_we),
    .inst_sram_wdata(inst_sram_wdata),
    .inst_sram_rdata(inst_sram_rdata),
    .data_sram_addr(data_sram_cpu_addr),
    .data_sram_we(data_sram_we),
    .data_sram_rdata(data_sram_rdata),
    .data_sram_wdata(data_sram_wdata),
    .debug_wb_pc(),
    .debug_wb_rf_we(),
    .debug_wb_rf_wnum(),
    .debug_wb_rf_wdata()
);

update_seg my_seg(
    .clk(clk),
    .rstn(rstn),
    .q(output_data),
    .an(an),
    .seg(seg)
);


endmodule