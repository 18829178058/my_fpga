`timescale          1ns/1ns
module			    my_sum_tb;

    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] c;
	
	initial begin
	
	        #200;
			a = {$random}%256;
			b = {$random}%256;
			
		    #200;
			a = {$random}%256;
			b = {$random}%256;
			
			#200;
			a = {$random}%256;
			b = {$random}%256;
			
			#200;
			a = {$random}%256;
			b = {$random}%256;
			
			#200
			a = {$random}%256;
			b = {$random}%256;
			
			#200;
			a = {$random}%256;
			b = {$random}%256;
			
			#200;
			
end
	
integer fid;
initial fid = $fopen("my_rdm.dat");

always     @(*)
           $fdisplay(fid, "a = %d, b = %d, c = %d \t", a, b, c);
		   

initial   begin
          #(200*10);
		  $fclose(fid);
		  $stop;
end
	
	
my_sum  my_sum_ins
(
    .a(a),
    .b(b),
    .c(c)
);	
	

endmodule 