// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun May  3 09:37:18 2026
// Host        : LAPTOP-ECP6913Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ram_256x8_sim_netlist.v
// Design      : ram_256x8
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ram_256x8,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21344)
`pragma protect data_block
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
EGJzIFfTUvHdEQdsi5r5wo/fOG2gXrSQFIc=
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
