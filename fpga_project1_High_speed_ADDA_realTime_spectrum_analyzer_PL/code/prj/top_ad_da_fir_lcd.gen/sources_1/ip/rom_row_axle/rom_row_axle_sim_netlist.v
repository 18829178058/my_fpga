// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat May  2 23:06:05 2026
// Host        : LAPTOP-ECP6913Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/GitHub/my_fpga/fpga_project1_High_speed_ADDA_realTime_spectrum_analyzer_PL/code/prj/top_ad_da_fir_lcd.gen/sources_1/ip/rom_row_axle/rom_row_axle_sim_netlist.v
// Design      : rom_row_axle
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom_row_axle,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module rom_row_axle
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
  rom_row_axle_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17728)
`pragma protect data_block
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
wg==
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
