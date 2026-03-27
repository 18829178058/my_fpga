module 		add  
#(
			parameter 		  WDTH  =   8
			
			
)

(
			input							 clk,
			input							 rst_n,
			
			input    	 	 [WDTH-1:0]      a,
			input     wire	 [WDTH-1:0]      b,
			output     	     [WDTH-1:0]      c 
);


reg   [WDTH:0]      c_tmp;//定义内部信号
always 		@(posedge			clk		)
			if(rst_n ==  1'b0)
				c_tmp   <=   8'd0;
			else 
				c_tmp   <=  a  +  b;
				
assign 		c   =    c_tmp;		

endmodule