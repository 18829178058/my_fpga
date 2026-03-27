`timescale  					1ns/1ns
module						add_tb;



reg							 clk;
reg							 rst_n ;
initial						 begin
							 clk   =   0;
							 rst_n =   0 ;
							 #53 rst_n =   1 ; 

end
always 						 #2   clk=~clk;



reg    	 	 [8-1:0]      a;
reg	 [8-1:0]      		 b;

initial						begin
							a  =  0;
							b  =  0;
							
							
							#100   ;
							a  =  2;
							b  =  8;
							#100   ;
							a  =  20;
							b  =  40;
							#100   ;
						
end

wire      	     [8-1:0]      c; 
add  
#(
			.WDTH(8)
			
			
)
			 add_ins 
(
			.clk(clk),
			.rst_n(rst_n),
			
			.a(a),
			.b(b),
			.c(c) 
);
endmodule 