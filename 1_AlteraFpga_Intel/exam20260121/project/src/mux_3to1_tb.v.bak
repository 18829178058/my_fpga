`timescale          1ns/1ns
module			    memory_init_tb;

    reg [7:0] address;
    wire [7:0] q;
	
	initial begin
	
	        #200;
			address = {$random}%256;
			#200;
			address = {$random}%256;
			#200;
			address = {$random}%256;
			#200;
			address = {$random}%256;
		    #200;
			address = {$random}%256;
			#200;
			address = {$random}%256;
		    #200;
			
end
	
integer fid;
initial fid = $fopen("my_rdm.dat");

always     @(*) begin
           $fdisplay(fid, "q = %b \t", q);
           $display(fid, "q = %b \t", q);
end

initial   begin
          #(200*10);
		  $fclose(fid);
		  $stop;
end
	
	
memory_init  memory_init_ins
(
    .address(address),
    .q(q)
);	
	

endmodule 