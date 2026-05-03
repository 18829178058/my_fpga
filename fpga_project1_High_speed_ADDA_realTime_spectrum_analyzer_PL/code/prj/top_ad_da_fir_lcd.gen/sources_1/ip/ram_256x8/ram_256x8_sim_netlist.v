// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun May  3 09:37:18 2026
// Host        : LAPTOP-ECP6913Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/GitHub/my_fpga/fpga_project1_High_speed_ADDA_realTime_spectrum_analyzer_PL/code/prj/top_ad_da_fir_lcd.gen/sources_1/ip/ram_256x8/ram_256x8_sim_netlist.v
// Design      : ram_256x8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_256x8,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module ram_256x8
   (clka,
    wea,
    addra,
    dina,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [7:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [7:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [7:0]doutb;

  wire [7:0]addra;
  wire [7:0]addrb;
  wire clka;
  wire clkb;
  wire [7:0]dina;
  wire [7:0]doutb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [7:0]NLW_U0_douta_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.68455 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ram_256x8.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "8" *) 
  (* C_READ_WIDTH_B = "8" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  ram_256x8_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[7:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[7:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21280)
`pragma protect data_block
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
H9wrOOh9kbrhD8ZM56QC0W9VDQ==
`pragma protect end_protected
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
