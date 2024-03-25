// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Mar 25 16:29:56 2024
// Host        : LAPTOP-54TG6O0D running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/Projects/2024CODH/labs/lab1/RF/RF.sim/sim_1/synth/func/xsim/reg_file_tb_func_synth.v
// Design      : reg_file
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ADDR_WIDTH = "5" *) (* DATA_WIDTH = "32" *) 
(* NotValidForBitStream *)
module reg_file
   (clk,
    ra0,
    ra1,
    rd0,
    rd1,
    wa,
    wd,
    we);
  input clk;
  input [4:0]ra0;
  input [4:0]ra1;
  output [31:0]rd0;
  output [31:0]rd1;
  input [4:0]wa;
  input [31:0]wd;
  input we;

  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire p_0_in;
  wire [4:0]ra0;
  wire [4:0]ra0_IBUF;
  wire [4:0]ra1;
  wire [4:0]ra1_IBUF;
  wire [31:0]rd0;
  wire [31:0]rd00;
  wire [31:0]rd0_OBUF;
  wire \rd0_OBUF[31]_inst_i_2_n_0 ;
  wire \rd0_OBUF[31]_inst_i_3_n_0 ;
  wire [31:0]rd1;
  wire [31:0]rd10;
  wire [31:0]rd1_OBUF;
  wire \rd1_OBUF[31]_inst_i_2_n_0 ;
  wire \rd1_OBUF[31]_inst_i_3_n_0 ;
  wire [4:0]wa;
  wire [4:0]wa_IBUF;
  wire [31:0]wd;
  wire [31:0]wd_IBUF;
  wire we;
  wire we_IBUF;
  wire [1:0]NLW_rf_reg_r1_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_rf_reg_r1_0_31_12_17_DOD_UNCONNECTED;
  wire [1:0]NLW_rf_reg_r1_0_31_18_23_DOD_UNCONNECTED;
  wire [1:0]NLW_rf_reg_r1_0_31_24_29_DOD_UNCONNECTED;
  wire NLW_rf_reg_r1_0_31_30_31_SPO_UNCONNECTED;
  wire NLW_rf_reg_r1_0_31_30_31__0_SPO_UNCONNECTED;
  wire [1:0]NLW_rf_reg_r1_0_31_6_11_DOD_UNCONNECTED;
  wire [1:0]NLW_rf_reg_r2_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_rf_reg_r2_0_31_12_17_DOD_UNCONNECTED;
  wire [1:0]NLW_rf_reg_r2_0_31_18_23_DOD_UNCONNECTED;
  wire [1:0]NLW_rf_reg_r2_0_31_24_29_DOD_UNCONNECTED;
  wire NLW_rf_reg_r2_0_31_30_31_SPO_UNCONNECTED;
  wire NLW_rf_reg_r2_0_31_30_31__0_SPO_UNCONNECTED;
  wire [1:0]NLW_rf_reg_r2_0_31_6_11_DOD_UNCONNECTED;

  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF \ra0_IBUF[0]_inst 
       (.I(ra0[0]),
        .O(ra0_IBUF[0]));
  IBUF \ra0_IBUF[1]_inst 
       (.I(ra0[1]),
        .O(ra0_IBUF[1]));
  IBUF \ra0_IBUF[2]_inst 
       (.I(ra0[2]),
        .O(ra0_IBUF[2]));
  IBUF \ra0_IBUF[3]_inst 
       (.I(ra0[3]),
        .O(ra0_IBUF[3]));
  IBUF \ra0_IBUF[4]_inst 
       (.I(ra0[4]),
        .O(ra0_IBUF[4]));
  IBUF \ra1_IBUF[0]_inst 
       (.I(ra1[0]),
        .O(ra1_IBUF[0]));
  IBUF \ra1_IBUF[1]_inst 
       (.I(ra1[1]),
        .O(ra1_IBUF[1]));
  IBUF \ra1_IBUF[2]_inst 
       (.I(ra1[2]),
        .O(ra1_IBUF[2]));
  IBUF \ra1_IBUF[3]_inst 
       (.I(ra1[3]),
        .O(ra1_IBUF[3]));
  IBUF \ra1_IBUF[4]_inst 
       (.I(ra1[4]),
        .O(ra1_IBUF[4]));
  OBUF \rd0_OBUF[0]_inst 
       (.I(rd0_OBUF[0]),
        .O(rd0[0]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[0]_inst_i_1 
       (.I0(wd_IBUF[0]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[0]),
        .O(rd0_OBUF[0]));
  OBUF \rd0_OBUF[10]_inst 
       (.I(rd0_OBUF[10]),
        .O(rd0[10]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[10]_inst_i_1 
       (.I0(wd_IBUF[10]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[10]),
        .O(rd0_OBUF[10]));
  OBUF \rd0_OBUF[11]_inst 
       (.I(rd0_OBUF[11]),
        .O(rd0[11]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[11]_inst_i_1 
       (.I0(wd_IBUF[11]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[11]),
        .O(rd0_OBUF[11]));
  OBUF \rd0_OBUF[12]_inst 
       (.I(rd0_OBUF[12]),
        .O(rd0[12]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[12]_inst_i_1 
       (.I0(wd_IBUF[12]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[12]),
        .O(rd0_OBUF[12]));
  OBUF \rd0_OBUF[13]_inst 
       (.I(rd0_OBUF[13]),
        .O(rd0[13]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[13]_inst_i_1 
       (.I0(wd_IBUF[13]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[13]),
        .O(rd0_OBUF[13]));
  OBUF \rd0_OBUF[14]_inst 
       (.I(rd0_OBUF[14]),
        .O(rd0[14]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[14]_inst_i_1 
       (.I0(wd_IBUF[14]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[14]),
        .O(rd0_OBUF[14]));
  OBUF \rd0_OBUF[15]_inst 
       (.I(rd0_OBUF[15]),
        .O(rd0[15]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[15]_inst_i_1 
       (.I0(wd_IBUF[15]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[15]),
        .O(rd0_OBUF[15]));
  OBUF \rd0_OBUF[16]_inst 
       (.I(rd0_OBUF[16]),
        .O(rd0[16]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[16]_inst_i_1 
       (.I0(wd_IBUF[16]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[16]),
        .O(rd0_OBUF[16]));
  OBUF \rd0_OBUF[17]_inst 
       (.I(rd0_OBUF[17]),
        .O(rd0[17]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[17]_inst_i_1 
       (.I0(wd_IBUF[17]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[17]),
        .O(rd0_OBUF[17]));
  OBUF \rd0_OBUF[18]_inst 
       (.I(rd0_OBUF[18]),
        .O(rd0[18]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[18]_inst_i_1 
       (.I0(wd_IBUF[18]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[18]),
        .O(rd0_OBUF[18]));
  OBUF \rd0_OBUF[19]_inst 
       (.I(rd0_OBUF[19]),
        .O(rd0[19]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[19]_inst_i_1 
       (.I0(wd_IBUF[19]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[19]),
        .O(rd0_OBUF[19]));
  OBUF \rd0_OBUF[1]_inst 
       (.I(rd0_OBUF[1]),
        .O(rd0[1]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[1]_inst_i_1 
       (.I0(wd_IBUF[1]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[1]),
        .O(rd0_OBUF[1]));
  OBUF \rd0_OBUF[20]_inst 
       (.I(rd0_OBUF[20]),
        .O(rd0[20]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[20]_inst_i_1 
       (.I0(wd_IBUF[20]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[20]),
        .O(rd0_OBUF[20]));
  OBUF \rd0_OBUF[21]_inst 
       (.I(rd0_OBUF[21]),
        .O(rd0[21]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[21]_inst_i_1 
       (.I0(wd_IBUF[21]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[21]),
        .O(rd0_OBUF[21]));
  OBUF \rd0_OBUF[22]_inst 
       (.I(rd0_OBUF[22]),
        .O(rd0[22]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[22]_inst_i_1 
       (.I0(wd_IBUF[22]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[22]),
        .O(rd0_OBUF[22]));
  OBUF \rd0_OBUF[23]_inst 
       (.I(rd0_OBUF[23]),
        .O(rd0[23]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[23]_inst_i_1 
       (.I0(wd_IBUF[23]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[23]),
        .O(rd0_OBUF[23]));
  OBUF \rd0_OBUF[24]_inst 
       (.I(rd0_OBUF[24]),
        .O(rd0[24]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[24]_inst_i_1 
       (.I0(wd_IBUF[24]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[24]),
        .O(rd0_OBUF[24]));
  OBUF \rd0_OBUF[25]_inst 
       (.I(rd0_OBUF[25]),
        .O(rd0[25]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[25]_inst_i_1 
       (.I0(wd_IBUF[25]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[25]),
        .O(rd0_OBUF[25]));
  OBUF \rd0_OBUF[26]_inst 
       (.I(rd0_OBUF[26]),
        .O(rd0[26]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[26]_inst_i_1 
       (.I0(wd_IBUF[26]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[26]),
        .O(rd0_OBUF[26]));
  OBUF \rd0_OBUF[27]_inst 
       (.I(rd0_OBUF[27]),
        .O(rd0[27]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[27]_inst_i_1 
       (.I0(wd_IBUF[27]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[27]),
        .O(rd0_OBUF[27]));
  OBUF \rd0_OBUF[28]_inst 
       (.I(rd0_OBUF[28]),
        .O(rd0[28]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[28]_inst_i_1 
       (.I0(wd_IBUF[28]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[28]),
        .O(rd0_OBUF[28]));
  OBUF \rd0_OBUF[29]_inst 
       (.I(rd0_OBUF[29]),
        .O(rd0[29]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[29]_inst_i_1 
       (.I0(wd_IBUF[29]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[29]),
        .O(rd0_OBUF[29]));
  OBUF \rd0_OBUF[2]_inst 
       (.I(rd0_OBUF[2]),
        .O(rd0[2]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[2]_inst_i_1 
       (.I0(wd_IBUF[2]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[2]),
        .O(rd0_OBUF[2]));
  OBUF \rd0_OBUF[30]_inst 
       (.I(rd0_OBUF[30]),
        .O(rd0[30]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[30]_inst_i_1 
       (.I0(wd_IBUF[30]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[30]),
        .O(rd0_OBUF[30]));
  OBUF \rd0_OBUF[31]_inst 
       (.I(rd0_OBUF[31]),
        .O(rd0[31]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[31]_inst_i_1 
       (.I0(wd_IBUF[31]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[31]),
        .O(rd0_OBUF[31]));
  LUT4 #(
    .INIT(16'h9009)) 
    \rd0_OBUF[31]_inst_i_2 
       (.I0(wa_IBUF[0]),
        .I1(ra0_IBUF[0]),
        .I2(wa_IBUF[1]),
        .I3(ra0_IBUF[1]),
        .O(\rd0_OBUF[31]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \rd0_OBUF[31]_inst_i_3 
       (.I0(ra0_IBUF[4]),
        .I1(wa_IBUF[4]),
        .I2(ra0_IBUF[3]),
        .I3(wa_IBUF[3]),
        .I4(wa_IBUF[2]),
        .I5(ra0_IBUF[2]),
        .O(\rd0_OBUF[31]_inst_i_3_n_0 ));
  OBUF \rd0_OBUF[3]_inst 
       (.I(rd0_OBUF[3]),
        .O(rd0[3]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[3]_inst_i_1 
       (.I0(wd_IBUF[3]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[3]),
        .O(rd0_OBUF[3]));
  OBUF \rd0_OBUF[4]_inst 
       (.I(rd0_OBUF[4]),
        .O(rd0[4]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[4]_inst_i_1 
       (.I0(wd_IBUF[4]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[4]),
        .O(rd0_OBUF[4]));
  OBUF \rd0_OBUF[5]_inst 
       (.I(rd0_OBUF[5]),
        .O(rd0[5]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[5]_inst_i_1 
       (.I0(wd_IBUF[5]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[5]),
        .O(rd0_OBUF[5]));
  OBUF \rd0_OBUF[6]_inst 
       (.I(rd0_OBUF[6]),
        .O(rd0[6]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[6]_inst_i_1 
       (.I0(wd_IBUF[6]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[6]),
        .O(rd0_OBUF[6]));
  OBUF \rd0_OBUF[7]_inst 
       (.I(rd0_OBUF[7]),
        .O(rd0[7]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[7]_inst_i_1 
       (.I0(wd_IBUF[7]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[7]),
        .O(rd0_OBUF[7]));
  OBUF \rd0_OBUF[8]_inst 
       (.I(rd0_OBUF[8]),
        .O(rd0[8]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[8]_inst_i_1 
       (.I0(wd_IBUF[8]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[8]),
        .O(rd0_OBUF[8]));
  OBUF \rd0_OBUF[9]_inst 
       (.I(rd0_OBUF[9]),
        .O(rd0[9]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd0_OBUF[9]_inst_i_1 
       (.I0(wd_IBUF[9]),
        .I1(\rd0_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd0_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd00[9]),
        .O(rd0_OBUF[9]));
  OBUF \rd1_OBUF[0]_inst 
       (.I(rd1_OBUF[0]),
        .O(rd1[0]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[0]_inst_i_1 
       (.I0(wd_IBUF[0]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[0]),
        .O(rd1_OBUF[0]));
  OBUF \rd1_OBUF[10]_inst 
       (.I(rd1_OBUF[10]),
        .O(rd1[10]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[10]_inst_i_1 
       (.I0(wd_IBUF[10]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[10]),
        .O(rd1_OBUF[10]));
  OBUF \rd1_OBUF[11]_inst 
       (.I(rd1_OBUF[11]),
        .O(rd1[11]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[11]_inst_i_1 
       (.I0(wd_IBUF[11]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[11]),
        .O(rd1_OBUF[11]));
  OBUF \rd1_OBUF[12]_inst 
       (.I(rd1_OBUF[12]),
        .O(rd1[12]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[12]_inst_i_1 
       (.I0(wd_IBUF[12]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[12]),
        .O(rd1_OBUF[12]));
  OBUF \rd1_OBUF[13]_inst 
       (.I(rd1_OBUF[13]),
        .O(rd1[13]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[13]_inst_i_1 
       (.I0(wd_IBUF[13]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[13]),
        .O(rd1_OBUF[13]));
  OBUF \rd1_OBUF[14]_inst 
       (.I(rd1_OBUF[14]),
        .O(rd1[14]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[14]_inst_i_1 
       (.I0(wd_IBUF[14]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[14]),
        .O(rd1_OBUF[14]));
  OBUF \rd1_OBUF[15]_inst 
       (.I(rd1_OBUF[15]),
        .O(rd1[15]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[15]_inst_i_1 
       (.I0(wd_IBUF[15]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[15]),
        .O(rd1_OBUF[15]));
  OBUF \rd1_OBUF[16]_inst 
       (.I(rd1_OBUF[16]),
        .O(rd1[16]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[16]_inst_i_1 
       (.I0(wd_IBUF[16]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[16]),
        .O(rd1_OBUF[16]));
  OBUF \rd1_OBUF[17]_inst 
       (.I(rd1_OBUF[17]),
        .O(rd1[17]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[17]_inst_i_1 
       (.I0(wd_IBUF[17]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[17]),
        .O(rd1_OBUF[17]));
  OBUF \rd1_OBUF[18]_inst 
       (.I(rd1_OBUF[18]),
        .O(rd1[18]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[18]_inst_i_1 
       (.I0(wd_IBUF[18]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[18]),
        .O(rd1_OBUF[18]));
  OBUF \rd1_OBUF[19]_inst 
       (.I(rd1_OBUF[19]),
        .O(rd1[19]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[19]_inst_i_1 
       (.I0(wd_IBUF[19]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[19]),
        .O(rd1_OBUF[19]));
  OBUF \rd1_OBUF[1]_inst 
       (.I(rd1_OBUF[1]),
        .O(rd1[1]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[1]_inst_i_1 
       (.I0(wd_IBUF[1]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[1]),
        .O(rd1_OBUF[1]));
  OBUF \rd1_OBUF[20]_inst 
       (.I(rd1_OBUF[20]),
        .O(rd1[20]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[20]_inst_i_1 
       (.I0(wd_IBUF[20]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[20]),
        .O(rd1_OBUF[20]));
  OBUF \rd1_OBUF[21]_inst 
       (.I(rd1_OBUF[21]),
        .O(rd1[21]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[21]_inst_i_1 
       (.I0(wd_IBUF[21]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[21]),
        .O(rd1_OBUF[21]));
  OBUF \rd1_OBUF[22]_inst 
       (.I(rd1_OBUF[22]),
        .O(rd1[22]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[22]_inst_i_1 
       (.I0(wd_IBUF[22]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[22]),
        .O(rd1_OBUF[22]));
  OBUF \rd1_OBUF[23]_inst 
       (.I(rd1_OBUF[23]),
        .O(rd1[23]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[23]_inst_i_1 
       (.I0(wd_IBUF[23]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[23]),
        .O(rd1_OBUF[23]));
  OBUF \rd1_OBUF[24]_inst 
       (.I(rd1_OBUF[24]),
        .O(rd1[24]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[24]_inst_i_1 
       (.I0(wd_IBUF[24]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[24]),
        .O(rd1_OBUF[24]));
  OBUF \rd1_OBUF[25]_inst 
       (.I(rd1_OBUF[25]),
        .O(rd1[25]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[25]_inst_i_1 
       (.I0(wd_IBUF[25]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[25]),
        .O(rd1_OBUF[25]));
  OBUF \rd1_OBUF[26]_inst 
       (.I(rd1_OBUF[26]),
        .O(rd1[26]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[26]_inst_i_1 
       (.I0(wd_IBUF[26]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[26]),
        .O(rd1_OBUF[26]));
  OBUF \rd1_OBUF[27]_inst 
       (.I(rd1_OBUF[27]),
        .O(rd1[27]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[27]_inst_i_1 
       (.I0(wd_IBUF[27]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[27]),
        .O(rd1_OBUF[27]));
  OBUF \rd1_OBUF[28]_inst 
       (.I(rd1_OBUF[28]),
        .O(rd1[28]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[28]_inst_i_1 
       (.I0(wd_IBUF[28]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[28]),
        .O(rd1_OBUF[28]));
  OBUF \rd1_OBUF[29]_inst 
       (.I(rd1_OBUF[29]),
        .O(rd1[29]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[29]_inst_i_1 
       (.I0(wd_IBUF[29]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[29]),
        .O(rd1_OBUF[29]));
  OBUF \rd1_OBUF[2]_inst 
       (.I(rd1_OBUF[2]),
        .O(rd1[2]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[2]_inst_i_1 
       (.I0(wd_IBUF[2]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[2]),
        .O(rd1_OBUF[2]));
  OBUF \rd1_OBUF[30]_inst 
       (.I(rd1_OBUF[30]),
        .O(rd1[30]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[30]_inst_i_1 
       (.I0(wd_IBUF[30]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[30]),
        .O(rd1_OBUF[30]));
  OBUF \rd1_OBUF[31]_inst 
       (.I(rd1_OBUF[31]),
        .O(rd1[31]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[31]_inst_i_1 
       (.I0(wd_IBUF[31]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[31]),
        .O(rd1_OBUF[31]));
  LUT4 #(
    .INIT(16'h9009)) 
    \rd1_OBUF[31]_inst_i_2 
       (.I0(wa_IBUF[0]),
        .I1(ra1_IBUF[0]),
        .I2(wa_IBUF[1]),
        .I3(ra1_IBUF[1]),
        .O(\rd1_OBUF[31]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \rd1_OBUF[31]_inst_i_3 
       (.I0(ra1_IBUF[4]),
        .I1(wa_IBUF[4]),
        .I2(ra1_IBUF[3]),
        .I3(wa_IBUF[3]),
        .I4(wa_IBUF[2]),
        .I5(ra1_IBUF[2]),
        .O(\rd1_OBUF[31]_inst_i_3_n_0 ));
  OBUF \rd1_OBUF[3]_inst 
       (.I(rd1_OBUF[3]),
        .O(rd1[3]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[3]_inst_i_1 
       (.I0(wd_IBUF[3]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[3]),
        .O(rd1_OBUF[3]));
  OBUF \rd1_OBUF[4]_inst 
       (.I(rd1_OBUF[4]),
        .O(rd1[4]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[4]_inst_i_1 
       (.I0(wd_IBUF[4]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[4]),
        .O(rd1_OBUF[4]));
  OBUF \rd1_OBUF[5]_inst 
       (.I(rd1_OBUF[5]),
        .O(rd1[5]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[5]_inst_i_1 
       (.I0(wd_IBUF[5]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[5]),
        .O(rd1_OBUF[5]));
  OBUF \rd1_OBUF[6]_inst 
       (.I(rd1_OBUF[6]),
        .O(rd1[6]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[6]_inst_i_1 
       (.I0(wd_IBUF[6]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[6]),
        .O(rd1_OBUF[6]));
  OBUF \rd1_OBUF[7]_inst 
       (.I(rd1_OBUF[7]),
        .O(rd1[7]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[7]_inst_i_1 
       (.I0(wd_IBUF[7]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[7]),
        .O(rd1_OBUF[7]));
  OBUF \rd1_OBUF[8]_inst 
       (.I(rd1_OBUF[8]),
        .O(rd1[8]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[8]_inst_i_1 
       (.I0(wd_IBUF[8]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[8]),
        .O(rd1_OBUF[8]));
  OBUF \rd1_OBUF[9]_inst 
       (.I(rd1_OBUF[9]),
        .O(rd1[9]));
  LUT5 #(
    .INIT(32'hBFFF8000)) 
    \rd1_OBUF[9]_inst_i_1 
       (.I0(wd_IBUF[9]),
        .I1(\rd1_OBUF[31]_inst_i_2_n_0 ),
        .I2(p_0_in),
        .I3(\rd1_OBUF[31]_inst_i_3_n_0 ),
        .I4(rd10[9]),
        .O(rd1_OBUF[9]));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r1_0_31_0_5" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    rf_reg_r1_0_31_0_5
       (.ADDRA(ra0_IBUF),
        .ADDRB(ra0_IBUF),
        .ADDRC(ra0_IBUF),
        .ADDRD(wa_IBUF),
        .DIA(wd_IBUF[1:0]),
        .DIB(wd_IBUF[3:2]),
        .DIC(wd_IBUF[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(rd00[1:0]),
        .DOB(rd00[3:2]),
        .DOC(rd00[5:4]),
        .DOD(NLW_rf_reg_r1_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    rf_reg_r1_0_31_0_5_i_1
       (.I0(we_IBUF),
        .I1(wa_IBUF[3]),
        .I2(wa_IBUF[2]),
        .I3(wa_IBUF[1]),
        .I4(wa_IBUF[0]),
        .I5(wa_IBUF[4]),
        .O(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r1_0_31_12_17" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "17" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    rf_reg_r1_0_31_12_17
       (.ADDRA(ra0_IBUF),
        .ADDRB(ra0_IBUF),
        .ADDRC(ra0_IBUF),
        .ADDRD(wa_IBUF),
        .DIA(wd_IBUF[13:12]),
        .DIB(wd_IBUF[15:14]),
        .DIC(wd_IBUF[17:16]),
        .DID({1'b0,1'b0}),
        .DOA(rd00[13:12]),
        .DOB(rd00[15:14]),
        .DOC(rd00[17:16]),
        .DOD(NLW_rf_reg_r1_0_31_12_17_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r1_0_31_18_23" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "23" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    rf_reg_r1_0_31_18_23
       (.ADDRA(ra0_IBUF),
        .ADDRB(ra0_IBUF),
        .ADDRC(ra0_IBUF),
        .ADDRD(wa_IBUF),
        .DIA(wd_IBUF[19:18]),
        .DIB(wd_IBUF[21:20]),
        .DIC(wd_IBUF[23:22]),
        .DID({1'b0,1'b0}),
        .DOA(rd00[19:18]),
        .DOB(rd00[21:20]),
        .DOC(rd00[23:22]),
        .DOD(NLW_rf_reg_r1_0_31_18_23_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r1_0_31_24_29" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "29" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    rf_reg_r1_0_31_24_29
       (.ADDRA(ra0_IBUF),
        .ADDRB(ra0_IBUF),
        .ADDRC(ra0_IBUF),
        .ADDRD(wa_IBUF),
        .DIA(wd_IBUF[25:24]),
        .DIB(wd_IBUF[27:26]),
        .DIC(wd_IBUF[29:28]),
        .DID({1'b0,1'b0}),
        .DOA(rd00[25:24]),
        .DOB(rd00[27:26]),
        .DOC(rd00[29:28]),
        .DOD(NLW_rf_reg_r1_0_31_24_29_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r1_0_31_30_31" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    rf_reg_r1_0_31_30_31
       (.A0(wa_IBUF[0]),
        .A1(wa_IBUF[1]),
        .A2(wa_IBUF[2]),
        .A3(wa_IBUF[3]),
        .A4(wa_IBUF[4]),
        .D(wd_IBUF[30]),
        .DPO(rd00[30]),
        .DPRA0(ra0_IBUF[0]),
        .DPRA1(ra0_IBUF[1]),
        .DPRA2(ra0_IBUF[2]),
        .DPRA3(ra0_IBUF[3]),
        .DPRA4(ra0_IBUF[4]),
        .SPO(NLW_rf_reg_r1_0_31_30_31_SPO_UNCONNECTED),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r1_0_31_30_31" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    rf_reg_r1_0_31_30_31__0
       (.A0(wa_IBUF[0]),
        .A1(wa_IBUF[1]),
        .A2(wa_IBUF[2]),
        .A3(wa_IBUF[3]),
        .A4(wa_IBUF[4]),
        .D(wd_IBUF[31]),
        .DPO(rd00[31]),
        .DPRA0(ra0_IBUF[0]),
        .DPRA1(ra0_IBUF[1]),
        .DPRA2(ra0_IBUF[2]),
        .DPRA3(ra0_IBUF[3]),
        .DPRA4(ra0_IBUF[4]),
        .SPO(NLW_rf_reg_r1_0_31_30_31__0_SPO_UNCONNECTED),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r1_0_31_6_11" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    rf_reg_r1_0_31_6_11
       (.ADDRA(ra0_IBUF),
        .ADDRB(ra0_IBUF),
        .ADDRC(ra0_IBUF),
        .ADDRD(wa_IBUF),
        .DIA(wd_IBUF[7:6]),
        .DIB(wd_IBUF[9:8]),
        .DIC(wd_IBUF[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(rd00[7:6]),
        .DOB(rd00[9:8]),
        .DOC(rd00[11:10]),
        .DOD(NLW_rf_reg_r1_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r2_0_31_0_5" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    rf_reg_r2_0_31_0_5
       (.ADDRA(ra1_IBUF),
        .ADDRB(ra1_IBUF),
        .ADDRC(ra1_IBUF),
        .ADDRD(wa_IBUF),
        .DIA(wd_IBUF[1:0]),
        .DIB(wd_IBUF[3:2]),
        .DIC(wd_IBUF[5:4]),
        .DID({1'b0,1'b0}),
        .DOA(rd10[1:0]),
        .DOB(rd10[3:2]),
        .DOC(rd10[5:4]),
        .DOD(NLW_rf_reg_r2_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r2_0_31_12_17" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "12" *) 
  (* ram_slice_end = "17" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    rf_reg_r2_0_31_12_17
       (.ADDRA(ra1_IBUF),
        .ADDRB(ra1_IBUF),
        .ADDRC(ra1_IBUF),
        .ADDRD(wa_IBUF),
        .DIA(wd_IBUF[13:12]),
        .DIB(wd_IBUF[15:14]),
        .DIC(wd_IBUF[17:16]),
        .DID({1'b0,1'b0}),
        .DOA(rd10[13:12]),
        .DOB(rd10[15:14]),
        .DOC(rd10[17:16]),
        .DOD(NLW_rf_reg_r2_0_31_12_17_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r2_0_31_18_23" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "18" *) 
  (* ram_slice_end = "23" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    rf_reg_r2_0_31_18_23
       (.ADDRA(ra1_IBUF),
        .ADDRB(ra1_IBUF),
        .ADDRC(ra1_IBUF),
        .ADDRD(wa_IBUF),
        .DIA(wd_IBUF[19:18]),
        .DIB(wd_IBUF[21:20]),
        .DIC(wd_IBUF[23:22]),
        .DID({1'b0,1'b0}),
        .DOA(rd10[19:18]),
        .DOB(rd10[21:20]),
        .DOC(rd10[23:22]),
        .DOD(NLW_rf_reg_r2_0_31_18_23_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r2_0_31_24_29" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "24" *) 
  (* ram_slice_end = "29" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    rf_reg_r2_0_31_24_29
       (.ADDRA(ra1_IBUF),
        .ADDRB(ra1_IBUF),
        .ADDRC(ra1_IBUF),
        .ADDRD(wa_IBUF),
        .DIA(wd_IBUF[25:24]),
        .DIB(wd_IBUF[27:26]),
        .DIC(wd_IBUF[29:28]),
        .DID({1'b0,1'b0}),
        .DOA(rd10[25:24]),
        .DOB(rd10[27:26]),
        .DOC(rd10[29:28]),
        .DOD(NLW_rf_reg_r2_0_31_24_29_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r2_0_31_30_31" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    rf_reg_r2_0_31_30_31
       (.A0(wa_IBUF[0]),
        .A1(wa_IBUF[1]),
        .A2(wa_IBUF[2]),
        .A3(wa_IBUF[3]),
        .A4(wa_IBUF[4]),
        .D(wd_IBUF[30]),
        .DPO(rd10[30]),
        .DPRA0(ra1_IBUF[0]),
        .DPRA1(ra1_IBUF[1]),
        .DPRA2(ra1_IBUF[2]),
        .DPRA3(ra1_IBUF[3]),
        .DPRA4(ra1_IBUF[4]),
        .SPO(NLW_rf_reg_r2_0_31_30_31_SPO_UNCONNECTED),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r2_0_31_30_31" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "30" *) 
  (* ram_slice_end = "31" *) 
  RAM32X1D #(
    .INIT(32'h00000000)) 
    rf_reg_r2_0_31_30_31__0
       (.A0(wa_IBUF[0]),
        .A1(wa_IBUF[1]),
        .A2(wa_IBUF[2]),
        .A3(wa_IBUF[3]),
        .A4(wa_IBUF[4]),
        .D(wd_IBUF[31]),
        .DPO(rd10[31]),
        .DPRA0(ra1_IBUF[0]),
        .DPRA1(ra1_IBUF[1]),
        .DPRA2(ra1_IBUF[2]),
        .DPRA3(ra1_IBUF[3]),
        .DPRA4(ra1_IBUF[4]),
        .SPO(NLW_rf_reg_r2_0_31_30_31__0_SPO_UNCONNECTED),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "rf_reg_r2_0_31_6_11" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "11" *) 
  RAM32M #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000)) 
    rf_reg_r2_0_31_6_11
       (.ADDRA(ra1_IBUF),
        .ADDRB(ra1_IBUF),
        .ADDRC(ra1_IBUF),
        .ADDRD(wa_IBUF),
        .DIA(wd_IBUF[7:6]),
        .DIB(wd_IBUF[9:8]),
        .DIC(wd_IBUF[11:10]),
        .DID({1'b0,1'b0}),
        .DOA(rd10[7:6]),
        .DOB(rd10[9:8]),
        .DOC(rd10[11:10]),
        .DOD(NLW_rf_reg_r2_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(clk_IBUF_BUFG),
        .WE(p_0_in));
  IBUF \wa_IBUF[0]_inst 
       (.I(wa[0]),
        .O(wa_IBUF[0]));
  IBUF \wa_IBUF[1]_inst 
       (.I(wa[1]),
        .O(wa_IBUF[1]));
  IBUF \wa_IBUF[2]_inst 
       (.I(wa[2]),
        .O(wa_IBUF[2]));
  IBUF \wa_IBUF[3]_inst 
       (.I(wa[3]),
        .O(wa_IBUF[3]));
  IBUF \wa_IBUF[4]_inst 
       (.I(wa[4]),
        .O(wa_IBUF[4]));
  IBUF \wd_IBUF[0]_inst 
       (.I(wd[0]),
        .O(wd_IBUF[0]));
  IBUF \wd_IBUF[10]_inst 
       (.I(wd[10]),
        .O(wd_IBUF[10]));
  IBUF \wd_IBUF[11]_inst 
       (.I(wd[11]),
        .O(wd_IBUF[11]));
  IBUF \wd_IBUF[12]_inst 
       (.I(wd[12]),
        .O(wd_IBUF[12]));
  IBUF \wd_IBUF[13]_inst 
       (.I(wd[13]),
        .O(wd_IBUF[13]));
  IBUF \wd_IBUF[14]_inst 
       (.I(wd[14]),
        .O(wd_IBUF[14]));
  IBUF \wd_IBUF[15]_inst 
       (.I(wd[15]),
        .O(wd_IBUF[15]));
  IBUF \wd_IBUF[16]_inst 
       (.I(wd[16]),
        .O(wd_IBUF[16]));
  IBUF \wd_IBUF[17]_inst 
       (.I(wd[17]),
        .O(wd_IBUF[17]));
  IBUF \wd_IBUF[18]_inst 
       (.I(wd[18]),
        .O(wd_IBUF[18]));
  IBUF \wd_IBUF[19]_inst 
       (.I(wd[19]),
        .O(wd_IBUF[19]));
  IBUF \wd_IBUF[1]_inst 
       (.I(wd[1]),
        .O(wd_IBUF[1]));
  IBUF \wd_IBUF[20]_inst 
       (.I(wd[20]),
        .O(wd_IBUF[20]));
  IBUF \wd_IBUF[21]_inst 
       (.I(wd[21]),
        .O(wd_IBUF[21]));
  IBUF \wd_IBUF[22]_inst 
       (.I(wd[22]),
        .O(wd_IBUF[22]));
  IBUF \wd_IBUF[23]_inst 
       (.I(wd[23]),
        .O(wd_IBUF[23]));
  IBUF \wd_IBUF[24]_inst 
       (.I(wd[24]),
        .O(wd_IBUF[24]));
  IBUF \wd_IBUF[25]_inst 
       (.I(wd[25]),
        .O(wd_IBUF[25]));
  IBUF \wd_IBUF[26]_inst 
       (.I(wd[26]),
        .O(wd_IBUF[26]));
  IBUF \wd_IBUF[27]_inst 
       (.I(wd[27]),
        .O(wd_IBUF[27]));
  IBUF \wd_IBUF[28]_inst 
       (.I(wd[28]),
        .O(wd_IBUF[28]));
  IBUF \wd_IBUF[29]_inst 
       (.I(wd[29]),
        .O(wd_IBUF[29]));
  IBUF \wd_IBUF[2]_inst 
       (.I(wd[2]),
        .O(wd_IBUF[2]));
  IBUF \wd_IBUF[30]_inst 
       (.I(wd[30]),
        .O(wd_IBUF[30]));
  IBUF \wd_IBUF[31]_inst 
       (.I(wd[31]),
        .O(wd_IBUF[31]));
  IBUF \wd_IBUF[3]_inst 
       (.I(wd[3]),
        .O(wd_IBUF[3]));
  IBUF \wd_IBUF[4]_inst 
       (.I(wd[4]),
        .O(wd_IBUF[4]));
  IBUF \wd_IBUF[5]_inst 
       (.I(wd[5]),
        .O(wd_IBUF[5]));
  IBUF \wd_IBUF[6]_inst 
       (.I(wd[6]),
        .O(wd_IBUF[6]));
  IBUF \wd_IBUF[7]_inst 
       (.I(wd[7]),
        .O(wd_IBUF[7]));
  IBUF \wd_IBUF[8]_inst 
       (.I(wd[8]),
        .O(wd_IBUF[8]));
  IBUF \wd_IBUF[9]_inst 
       (.I(wd[9]),
        .O(wd_IBUF[9]));
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
