`timescale          1ns/1ns
module			    mux_3to1_tb;

    reg [7:0] a;
	reg [7:0] b;
	reg [7:0] c;
	reg [1:0] sel;
	reg clk;
    wire [7:0] d;
	
	always #10 clk = ~clk; 
	
	initial begin
	
	        #200;
			a = 1;
			b = 2;
			c = 3;
			sel = 0;
			#200;
			a = 1;
			b = 2;
			c = 3;
			sel = 1;
			#200;
			a = 1;
			b = 2;
			c = 3;
			sel = 2;
			#200;
			a = 1;
			b = 2;
			c = 3;
			sel = 3;
		    #200;
			
end
	
mux_3to1  mux_3to1_ins
(
    .a(a),
	.b(b),
	.c(c),
	.sel(sel),
	.sys_clk(sys_clk),      // 系统时钟
    .d(d)
);	
	

endmodule 