module 		mux
(
			input					clk,
			input					rst_n,
			
			
			input  wire	  [7:0]  	a,
 			input  wire   [7:0]  	b,
			input  wire   [7:0]  	c,
			input  wire	  [1:0]		sel,
			output reg   [7:0]  	d0,
			output reg   [7:0]  	d1,
			output reg   [7:0]  	d2,
			output reg   [7:0]  	d3,	
			output reg   [7:0]  	d4,	
			output reg   [7:0]  	d5,	
			output reg   [7:0]  	d6,	
			output reg   [7:0]  	d7,	
			output reg   [7:0]  	d8,	
			output reg   [7:0]  	d9			

);
//第1种时序电路行为建模/////////////////////////////
always 	 	@(posedge 				clk)
			if(sel==2'b00)
					d0  <=     a;
			else  if(sel==2'b01)
					d0  <=     b;
			else 
					d0  <=     c;
//第2种时序电路行为建模/////////////////////////////
always 	 	@(negedge				clk)
			if(sel==2'b00)
					d1  <=     a;
			else  if(sel==2'b01)
					d1  <=     b;
			else 
					d1  <=     c;
//第3种时序电路行为建模/////////////////////////////
always 	 	@(posedge 				clk)
			if(rst_n==1'b0)
					d2	<=   8'd0;
			else  if(sel==2'b00)
					d2  <=     a;
			else  if(sel==2'b01)
					d2  <=     b;
			else 
					d2  <=     c;
					
//第4种时序电路行为建模/////////////////////////////
always 	 	@(negedge 				clk)
			if(rst_n==1'b0)
					d3	<=   8'd0;
			else  if(sel==2'b00)
					d3  <=     a;
			else  if(sel==2'b01)
					d3  <=     b;
			else 
					d3  <=     c;					
//第5种时序电路行为建模/////////////////////////////
always 	 	@(posedge 				clk    or   negedge			rst_n)
			if(rst_n==1'b0)
					d4	<=   8'd0;
			else  if(sel==2'b00)
					d4  <=     a;
			else  if(sel==2'b01)
					d4  <=     b;
			else 
					d4  <=     c;	
//第6种时序电路行为建模/////////////////////////////
always 	 	@(negedge 				clk		or	negedge			rst_n)
			if(rst_n==1'b0)
					d5	<=   8'd0;
			else  if(sel==2'b00)
					d5  <=     a;
			else  if(sel==2'b01)
					d5  <=     b;
			else 
					d5  <=     c;

					
//第7种时序电路行为建模/////////////////////////////
always 	 	@(posedge 				clk)
			if(rst_n==1'b1)
					d6	<=   8'd0;
			else  if(sel==2'b00)
					d6  <=     a;
			else  if(sel==2'b01)
					d6 <=     b;
			else 
					d6  <=     c;

//第8种时序电路行为建模/////////////////////////////
always 	 	@(negedge 				clk)
			if(rst_n==1'b1)
					d7	<=   8'd0;
			else  if(sel==2'b00)
					d7  <=     a;
			else  if(sel==2'b01)
					d7 <=     b;
			else 
					d7  <=     c;

//第9种时序电路行为建模/////////////////////////////
always 	 	@(posedge 				clk			or	posedge	rst_n)
			if(rst_n==1'b1)
					d8	<=   8'd0;
			else  if(sel==2'b00)
					d8  <=     a;
			else  if(sel==2'b01)
					d8 <=     b;
			else 
					d8  <=     c;					

//第10种时序电路行为建模/////////////////////////////
always 	 	@(negedge 				clk			or	posedge	rst_n)
			if(rst_n==1'b1)
					d9	<=   8'd0;
			else  if(sel==2'b00)
					d9  <=     a;
			else  if(sel==2'b01)
					d9 <=     b;
			else 
					d9  <=     c;					
endmodule 