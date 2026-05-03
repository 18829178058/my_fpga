// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat May  2 23:06:05 2026
// Host        : LAPTOP-ECP6913Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ rom_256x8_0_sim_netlist.v
// Design      : rom_256x8_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom_256x8_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
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
  (* C_INIT_FILE = "rom_256x8_0.mem" *) 
  (* C_INIT_FILE_NAME = "rom_256x8_0.mif" *) 
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
2c9/S9c/1972vzUIn65S00IE0adBV7m/k8e3
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
