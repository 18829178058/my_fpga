`timescale 1ns/1ns
module  lut_xor_tb;

    reg a;
	reg b;
	wire c;
	
	initial begin
	
	        #200;
			a = 0;
			b = 0;
			
			#200;
			a = 0;
			b = 1;
	
			#200;
			a = 1;
			b = 0;
	
			#200;
			a = 1;
			b = 1;
			
		    #200;	
end


lut_xor xor_inst(
    .a(a),
	.b(b),
    .c(c)
);

endmodule