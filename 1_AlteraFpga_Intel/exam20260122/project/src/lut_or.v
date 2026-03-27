module lut_or (
    input  a,
    input  b,
    output c
);
  
reg  [3:0]    lut2;
wire [1:0]    addr;
assign    addr = {a,b};
always @(a or b) lut2 = 4'b1110;

assign c = lut2[addr];

endmodule