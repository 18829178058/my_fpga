`timescale 1ns/1ns
module top_module_tb ();


    reg a, b, c, d, e;
	
	initial 
			begin
				#50
				a = 0;
				b = 0;
				c = 1;
				d = 0;
				e = 0;
				
				#50
				a = 0;
				b = 0;
				c = 0;
				d = 0;
				e = 1;
				
				#50
				a = 0;
				b = 1;
				c = 0;
				d = 0;
				e = 1;
				#10
		
			end
	 
    wire [24:0] out;

top_module top_module_inst
(
    .a(a), 
	 .b(b), 
	 .c(c), 
	 .d(d), 
	 .e(e),
    .out(out) 
);//
	 
	 
endmodule