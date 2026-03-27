module d_ff_tb;


    reg clk;
	reg rst_n;
	reg en;
	reg d;
	
initial   begin
    clk = 1'b0;
	rst_n = 1'b0;
    en = 1'b0;
	# 53
	rst_n = 1'b1;
	en = 1'b1;
end

always #2 clk=~clk;

always  @(posedge clk  or negedge rst_n)
          if(rst_n == 1'b0)
		      d  <= 1'd0;
	      else if(en == 1'b0)
		      d  <= 1'd0;
		  else
		      d <= d;
wire q;

d_ff   d_ff_inst
(
     .clk(clk),     
	 .rst_n(rst_n),   
	 .en(en),      
	 .d(d),       
	 .q(q)
);


endmodule