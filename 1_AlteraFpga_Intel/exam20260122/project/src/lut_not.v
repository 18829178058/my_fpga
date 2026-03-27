module lut_not (
    input  a,
    output reg c
);
  
reg  [1:0]    lut2;
wire [1:0]    addr;
assign    addr = a;
always    @(*)  begin
          lut2 = 2'b01;
		  c = lut2[addr];
end

endmodule