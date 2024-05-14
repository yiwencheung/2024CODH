module forwardUnit (
    input               rf_we_mem, rf_we_wb,
    input           [31 : 0]    rf_wd_mem, rf_wd_wb,
    input           [ 4 : 0]    rf_wa_mem, rf_wa_wb,
    input           [ 4 : 0]    rf_ra0_ex, rf_ra1_ex,

    output  reg     [31 : 0]    rf_rd0_fd, rf_rd1_fd,
    output  reg                 rf_rd0_fe, rf_rd1_fe
);

always @(*) begin
    if(rf_we_mem) begin
        if(rf_ra0_ex == rf_wa_mem) begin
            rf_rd0_fe = 1;
            rf_rd0_fd = rf_wd_mem;
        end
        else begin
            rf_rd0_fe = 0;
            rf_rd0_fd = 32'h0000_0000;
        end

        if(rf_ra1_ex == rf_wa_mem) begin
            rf_rd1_fe = 1;
            rf_rd1_fd = rf_wd_mem;
        end
        else begin
            rf_rd1_fe = 0;
            rf_rd1_fd = 32'h0000_0000;
        end
    end
    else if(rf_we_wb) begin
        if(rf_ra0_ex == rf_wa_wb) begin
            rf_rd0_fe = 1;
            rf_rd0_fd = rf_wd_wb;
        end
        else begin
            rf_rd0_fe = 0;
            rf_rd0_fd = 32'h0000_0000;
        end

        if(rf_ra1_ex == rf_wa_wb) begin
            rf_rd1_fe = 1;
            rf_rd1_fd = rf_wd_wb;
        end
        else begin
            rf_rd1_fe = 0;
            rf_rd1_fd = 32'h0000_0000;
        end
    end
    else begin
        rf_rd0_fe = 0;
        rf_rd0_fd = 32'h0000_0000;
        rf_rd1_fe = 0;
        rf_rd1_fd = 32'h0000_0000;
    end
end

    
endmodule