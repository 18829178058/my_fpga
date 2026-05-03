// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat May  2 23:06:05 2026
// Host        : LAPTOP-ECP6913Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ rom_row_axle_sim_netlist.v
// Design      : rom_row_axle
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom_row_axle,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
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
  (* C_INIT_FILE = "rom_row_axle.mem" *) 
  (* C_INIT_FILE_NAME = "rom_row_axle.mif" *) 
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
