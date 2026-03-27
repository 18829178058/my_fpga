module Led_on
(
   output reg [3:0] led
 );

always @(*)
    led = 4'b0101;

endmodule