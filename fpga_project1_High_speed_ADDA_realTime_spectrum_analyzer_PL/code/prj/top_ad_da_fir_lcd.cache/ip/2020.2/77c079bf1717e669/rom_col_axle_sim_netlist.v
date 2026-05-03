// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat May  2 23:06:05 2026
// Host        : LAPTOP-ECP6913Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ rom_col_axle_sim_netlist.v
// Design      : rom_col_axle
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom_col_axle,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [7:0]douta;

  wire [10:0]addra;
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
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     1.2196 mW" *) 
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
  (* C_INIT_FILE = "rom_col_axle.mem" *) 
  (* C_INIT_FILE_NAME = "rom_col_axle.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
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
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "8" *) 
  (* C_WRITE_WIDTH_B = "8" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17760)
`pragma protect data_block
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
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
