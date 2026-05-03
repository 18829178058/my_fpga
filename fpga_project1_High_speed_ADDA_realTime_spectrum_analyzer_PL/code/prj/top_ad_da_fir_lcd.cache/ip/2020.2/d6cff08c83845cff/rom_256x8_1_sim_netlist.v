// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat May  2 23:06:04 2026
// Host        : LAPTOP-ECP6913Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ rom_256x8_1_sim_netlist.v
// Design      : rom_256x8_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom_256x8_1,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [7:0]douta;
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
  wire [7:0]NLW_U0_doutb_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.3768 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
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
  (* C_INIT_FILE = "rom_256x8_1.mem" *) 
  (* C_INIT_FILE_NAME = "rom_256x8_1.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
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
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[7:0]),
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
        .wea(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19920)
`pragma protect data_block
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
RoeznNaivMVS40fOEaFwmE5a7jWN7+AG5tR3
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
