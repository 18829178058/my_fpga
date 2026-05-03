// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat May  2 23:06:05 2026
// Host        : LAPTOP-ECP6913Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/GitHub/my_fpga/fpga_project1_High_speed_ADDA_realTime_spectrum_analyzer_PL/code/prj/top_ad_da_fir_lcd.gen/sources_1/ip/rom_256x8_0/rom_256x8_0_sim_netlist.v
// Design      : rom_256x8_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom_256x8_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module rom_256x8_0
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
  rom_256x8_0_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19872)
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
