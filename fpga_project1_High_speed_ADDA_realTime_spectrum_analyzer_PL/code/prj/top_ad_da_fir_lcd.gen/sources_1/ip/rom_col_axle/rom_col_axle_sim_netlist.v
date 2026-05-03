// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat May  2 23:06:06 2026
// Host        : LAPTOP-ECP6913Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/GitHub/my_fpga/fpga_project1_High_speed_ADDA_realTime_spectrum_analyzer_PL/code/prj/top_ad_da_fir_lcd.gen/sources_1/ip/rom_col_axle/rom_col_axle_sim_netlist.v
// Design      : rom_col_axle
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom_col_axle,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module rom_col_axle
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
  rom_col_axle_blk_mem_gen_v8_4_4 U0
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
PA==
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
