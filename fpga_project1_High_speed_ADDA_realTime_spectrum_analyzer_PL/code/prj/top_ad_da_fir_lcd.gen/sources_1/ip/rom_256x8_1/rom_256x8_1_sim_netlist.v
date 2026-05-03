// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat May  2 23:06:04 2026
// Host        : LAPTOP-ECP6913Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/GitHub/my_fpga/fpga_project1_High_speed_ADDA_realTime_spectrum_analyzer_PL/code/prj/top_ad_da_fir_lcd.gen/sources_1/ip/rom_256x8_1/rom_256x8_1_sim_netlist.v
// Design      : rom_256x8_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rom_256x8_1,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module rom_256x8_1
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
  rom_256x8_1_blk_mem_gen_v8_4_4 U0
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
