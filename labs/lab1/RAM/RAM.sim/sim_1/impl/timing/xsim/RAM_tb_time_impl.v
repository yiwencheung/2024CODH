// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2.2 (win64) Build 4126759 Thu Feb  8 23:53:51 MST 2024
// Date        : Mon Mar 25 12:11:25 2024
// Host        : LAPTOP-54TG6O0D running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/Projects/2024CODH/labs/lab1/RAM/RAM.sim/sim_1/impl/timing/xsim/RAM_tb_time_impl.v
// Design      : RAM
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ADDR_WIDTH = "10" *) (* DATA_WIDTH = "32" *) (* ECO_CHECKSUM = "94313394" *) 
(* INIT_FILE = "" *) (* POWER_OPT_BRAM_CDC = "0" *) (* POWER_OPT_BRAM_SR_ADDR = "0" *) 
(* POWER_OPT_LOOPED_NET_PERCENTAGE = "0" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module RAM
   (clk,
    addr,
    din,
    we,
    dout);
  input clk;
  input [9:0]addr;
  input [31:0]din;
  input we;
  output [31:0]dout;

  wire [9:0]addr;
  wire [9:0]addr_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [31:0]din;
  wire [31:0]din_IBUF;
  wire [31:0]dout;
  wire [31:0]dout_OBUF;
  wire we;
  wire we_IBUF;
  wire NLW_ram_reg_CASCADEOUTA_UNCONNECTED;
  wire NLW_ram_reg_CASCADEOUTB_UNCONNECTED;
  wire NLW_ram_reg_DBITERR_UNCONNECTED;
  wire NLW_ram_reg_INJECTDBITERR_UNCONNECTED;
  wire NLW_ram_reg_INJECTSBITERR_UNCONNECTED;
  wire NLW_ram_reg_SBITERR_UNCONNECTED;
  wire [31:0]NLW_ram_reg_DOBDO_UNCONNECTED;
  wire [3:0]NLW_ram_reg_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_ram_reg_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_ram_reg_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_ram_reg_RDADDRECC_UNCONNECTED;

initial begin
 $sdf_annotate("RAM_tb_time_impl.sdf",,,,"tool_control");
end
  IBUF \addr_IBUF[0]_inst 
       (.I(addr[0]),
        .O(addr_IBUF[0]));
  IBUF \addr_IBUF[1]_inst 
       (.I(addr[1]),
        .O(addr_IBUF[1]));
  IBUF \addr_IBUF[2]_inst 
       (.I(addr[2]),
        .O(addr_IBUF[2]));
  IBUF \addr_IBUF[3]_inst 
       (.I(addr[3]),
        .O(addr_IBUF[3]));
  IBUF \addr_IBUF[4]_inst 
       (.I(addr[4]),
        .O(addr_IBUF[4]));
  IBUF \addr_IBUF[5]_inst 
       (.I(addr[5]),
        .O(addr_IBUF[5]));
  IBUF \addr_IBUF[6]_inst 
       (.I(addr[6]),
        .O(addr_IBUF[6]));
  IBUF \addr_IBUF[7]_inst 
       (.I(addr[7]),
        .O(addr_IBUF[7]));
  IBUF \addr_IBUF[8]_inst 
       (.I(addr[8]),
        .O(addr_IBUF[8]));
  IBUF \addr_IBUF[9]_inst 
       (.I(addr[9]),
        .O(addr_IBUF[9]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF \din_IBUF[0]_inst 
       (.I(din[0]),
        .O(din_IBUF[0]));
  IBUF \din_IBUF[10]_inst 
       (.I(din[10]),
        .O(din_IBUF[10]));
  IBUF \din_IBUF[11]_inst 
       (.I(din[11]),
        .O(din_IBUF[11]));
  IBUF \din_IBUF[12]_inst 
       (.I(din[12]),
        .O(din_IBUF[12]));
  IBUF \din_IBUF[13]_inst 
       (.I(din[13]),
        .O(din_IBUF[13]));
  IBUF \din_IBUF[14]_inst 
       (.I(din[14]),
        .O(din_IBUF[14]));
  IBUF \din_IBUF[15]_inst 
       (.I(din[15]),
        .O(din_IBUF[15]));
  IBUF \din_IBUF[16]_inst 
       (.I(din[16]),
        .O(din_IBUF[16]));
  IBUF \din_IBUF[17]_inst 
       (.I(din[17]),
        .O(din_IBUF[17]));
  IBUF \din_IBUF[18]_inst 
       (.I(din[18]),
        .O(din_IBUF[18]));
  IBUF \din_IBUF[19]_inst 
       (.I(din[19]),
        .O(din_IBUF[19]));
  IBUF \din_IBUF[1]_inst 
       (.I(din[1]),
        .O(din_IBUF[1]));
  IBUF \din_IBUF[20]_inst 
       (.I(din[20]),
        .O(din_IBUF[20]));
  IBUF \din_IBUF[21]_inst 
       (.I(din[21]),
        .O(din_IBUF[21]));
  IBUF \din_IBUF[22]_inst 
       (.I(din[22]),
        .O(din_IBUF[22]));
  IBUF \din_IBUF[23]_inst 
       (.I(din[23]),
        .O(din_IBUF[23]));
  IBUF \din_IBUF[24]_inst 
       (.I(din[24]),
        .O(din_IBUF[24]));
  IBUF \din_IBUF[25]_inst 
       (.I(din[25]),
        .O(din_IBUF[25]));
  IBUF \din_IBUF[26]_inst 
       (.I(din[26]),
        .O(din_IBUF[26]));
  IBUF \din_IBUF[27]_inst 
       (.I(din[27]),
        .O(din_IBUF[27]));
  IBUF \din_IBUF[28]_inst 
       (.I(din[28]),
        .O(din_IBUF[28]));
  IBUF \din_IBUF[29]_inst 
       (.I(din[29]),
        .O(din_IBUF[29]));
  IBUF \din_IBUF[2]_inst 
       (.I(din[2]),
        .O(din_IBUF[2]));
  IBUF \din_IBUF[30]_inst 
       (.I(din[30]),
        .O(din_IBUF[30]));
  IBUF \din_IBUF[31]_inst 
       (.I(din[31]),
        .O(din_IBUF[31]));
  IBUF \din_IBUF[3]_inst 
       (.I(din[3]),
        .O(din_IBUF[3]));
  IBUF \din_IBUF[4]_inst 
       (.I(din[4]),
        .O(din_IBUF[4]));
  IBUF \din_IBUF[5]_inst 
       (.I(din[5]),
        .O(din_IBUF[5]));
  IBUF \din_IBUF[6]_inst 
       (.I(din[6]),
        .O(din_IBUF[6]));
  IBUF \din_IBUF[7]_inst 
       (.I(din[7]),
        .O(din_IBUF[7]));
  IBUF \din_IBUF[8]_inst 
       (.I(din[8]),
        .O(din_IBUF[8]));
  IBUF \din_IBUF[9]_inst 
       (.I(din[9]),
        .O(din_IBUF[9]));
  OBUF \dout_OBUF[0]_inst 
       (.I(dout_OBUF[0]),
        .O(dout[0]));
  OBUF \dout_OBUF[10]_inst 
       (.I(dout_OBUF[10]),
        .O(dout[10]));
  OBUF \dout_OBUF[11]_inst 
       (.I(dout_OBUF[11]),
        .O(dout[11]));
  OBUF \dout_OBUF[12]_inst 
       (.I(dout_OBUF[12]),
        .O(dout[12]));
  OBUF \dout_OBUF[13]_inst 
       (.I(dout_OBUF[13]),
        .O(dout[13]));
  OBUF \dout_OBUF[14]_inst 
       (.I(dout_OBUF[14]),
        .O(dout[14]));
  OBUF \dout_OBUF[15]_inst 
       (.I(dout_OBUF[15]),
        .O(dout[15]));
  OBUF \dout_OBUF[16]_inst 
       (.I(dout_OBUF[16]),
        .O(dout[16]));
  OBUF \dout_OBUF[17]_inst 
       (.I(dout_OBUF[17]),
        .O(dout[17]));
  OBUF \dout_OBUF[18]_inst 
       (.I(dout_OBUF[18]),
        .O(dout[18]));
  OBUF \dout_OBUF[19]_inst 
       (.I(dout_OBUF[19]),
        .O(dout[19]));
  OBUF \dout_OBUF[1]_inst 
       (.I(dout_OBUF[1]),
        .O(dout[1]));
  OBUF \dout_OBUF[20]_inst 
       (.I(dout_OBUF[20]),
        .O(dout[20]));
  OBUF \dout_OBUF[21]_inst 
       (.I(dout_OBUF[21]),
        .O(dout[21]));
  OBUF \dout_OBUF[22]_inst 
       (.I(dout_OBUF[22]),
        .O(dout[22]));
  OBUF \dout_OBUF[23]_inst 
       (.I(dout_OBUF[23]),
        .O(dout[23]));
  OBUF \dout_OBUF[24]_inst 
       (.I(dout_OBUF[24]),
        .O(dout[24]));
  OBUF \dout_OBUF[25]_inst 
       (.I(dout_OBUF[25]),
        .O(dout[25]));
  OBUF \dout_OBUF[26]_inst 
       (.I(dout_OBUF[26]),
        .O(dout[26]));
  OBUF \dout_OBUF[27]_inst 
       (.I(dout_OBUF[27]),
        .O(dout[27]));
  OBUF \dout_OBUF[28]_inst 
       (.I(dout_OBUF[28]),
        .O(dout[28]));
  OBUF \dout_OBUF[29]_inst 
       (.I(dout_OBUF[29]),
        .O(dout[29]));
  OBUF \dout_OBUF[2]_inst 
       (.I(dout_OBUF[2]),
        .O(dout[2]));
  OBUF \dout_OBUF[30]_inst 
       (.I(dout_OBUF[30]),
        .O(dout[30]));
  OBUF \dout_OBUF[31]_inst 
       (.I(dout_OBUF[31]),
        .O(dout[31]));
  OBUF \dout_OBUF[3]_inst 
       (.I(dout_OBUF[3]),
        .O(dout[3]));
  OBUF \dout_OBUF[4]_inst 
       (.I(dout_OBUF[4]),
        .O(dout[4]));
  OBUF \dout_OBUF[5]_inst 
       (.I(dout_OBUF[5]),
        .O(dout[5]));
  OBUF \dout_OBUF[6]_inst 
       (.I(dout_OBUF[6]),
        .O(dout[6]));
  OBUF \dout_OBUF[7]_inst 
       (.I(dout_OBUF[7]),
        .O(dout[7]));
  OBUF \dout_OBUF[8]_inst 
       (.I(dout_OBUF[8]),
        .O(dout[8]));
  OBUF \dout_OBUF[9]_inst 
       (.I(dout_OBUF[9]),
        .O(dout[9]));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d32" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "ram_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "31" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_40(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_41(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_42(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_43(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_44(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_45(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_46(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_47(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_48(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_49(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_4F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(36),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(36),
    .WRITE_WIDTH_B(0)) 
    ram_reg
       (.ADDRARDADDR({1'b1,addr_IBUF,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_ram_reg_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_ram_reg_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_ram_reg_DBITERR_UNCONNECTED),
        .DIADI(din_IBUF),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO(dout_OBUF),
        .DOBDO(NLW_ram_reg_DOBDO_UNCONNECTED[31:0]),
        .DOPADOP(NLW_ram_reg_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_ram_reg_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_ram_reg_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(1'b1),
        .ENBWREN(1'b0),
        .INJECTDBITERR(NLW_ram_reg_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_ram_reg_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_ram_reg_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_ram_reg_SBITERR_UNCONNECTED),
        .WEA({we_IBUF,we_IBUF,we_IBUF,we_IBUF}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  IBUF we_IBUF_inst
       (.I(we),
        .O(we_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
