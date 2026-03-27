reg  	[2:0]		cnt 0;//K0=4
always 			@(posedge		clk_in		or		negedge		rst_n)
if(rst_n==0)
cnt0<=	0;
                else   if(cnt==3)
 cnt0<=	0;
  				else 
 cnt0<=cnt0  +  1’b1;
always 			@(posedge		clk_in		or		negedge		rst_n)
if(rst_n==0)
clk_12p5mhz<=0;
   else  if(cnt ==0) 
clk_12p5mhz<=0;
else   if(cnt ==2)
clk_12p5mhz<=1;

reg  	[3:0]		cnt 0;//K0=5
always 			@(posedge		clk_in		or		negedge		rst_n)
if(rst_n==0)
cnt0<=	0;
                else   if(cnt==4)
 cnt0<=	0;
  				else 
 cnt0<=cnt0  +  1’b1;
always 			@(posedge		clk_in		or		negedge		rst_n)
if(rst_n==0)
clk_10mhz<=0;
   else  if(cnt ==0) 
clk_10<=0;
else   if(cnt ==2)
clk_10mhz<=1;