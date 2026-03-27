module lut_and (
    input  a,
    input  b,
    output reg c
);
  
reg  [3:0]    lut2;
wire [1:0]    addr;
assign    addr = {b,a};
always    @(*) begin
          lut2 = 4'b1000;
		  c = lut2[addr];
end

endmodule