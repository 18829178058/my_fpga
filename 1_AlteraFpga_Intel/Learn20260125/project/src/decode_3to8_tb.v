`timescale 1ns/1ns
module decode_3to8_tb;

reg [2:0] code;
reg clk;
reg rst_n;

initial begin
    clk = 1'b0;
	rst_n = 1'b0;
	# 53
	rst_n = 1'b1;
end

always   #2 clk=~clk;

always  @(posedge clk  or negedge rst_n)
          if(rst_n == 1'b0)
		      code  <= 3'd0;
		  else
		      code  <=  code + 1'b1;

wire [7:0] decode;

decode_3to8 decode_3to8_ins
(
	.clk(clk),
	.rst_n(rst_n),
    .code(code),
	.decode(decode)
);

endmodule