module			ben_driver
(
				//系统相关
				input				clk	,//系统时钟，默认mhz
				input				rst_n,	//系统复位，低电平有效
				//蜂鸣器驱动信号
				output	reg			been	//蜂鸣器交变控制方波信号，默认占空比50%

);
//产生方波信号（本质为分频）,这里一律采用偶分频，奇分频近似等效偶分频即可///////
reg 	[26:0]	cnt_gc;//定义分频器计数器
reg		[26:0]	max_0p5;//max_0p5=k/2-1
always 			@(posedge			clk			or			negedge			rst_n)
				if(rst_n==1'b0)
					cnt_gc			<=		27'd0;
				else  if(cnt_gc  ==  max_0p5 )
					cnt_gc			<=		27'd0;
				else 
					cnt_gc			<=		cnt_gc  +   1'b1;
						
always 			@(posedge			clk			or			negedge			rst_n)
				if(rst_n==1'b0)
						been		<=		1'b0;
				else    if(cnt_gc  ==  max_0p5 )
						been		<=		~been;
											
//频率变换（通过控制max_0p5）///////////////////////////////////////////////////////////////////						
reg		[31:0]	cnt;//定时计数器
always 			@(posedge			clk			or			negedge			rst_n)
				if(rst_n==1'b0)
						cnt   		<=		29'd0;
				else  if(cnt==(7_000_000_000/20)-1'b1)
						cnt   		<=		29'd0;
				else 
						cnt   		<=		cnt   		+     1'b1;

always 			@(posedge			clk			or			negedge			rst_n)
				if(rst_n==1'b0)
					max_0p5			<=		27'd0;
				else   if(cnt < (1_000_000_000/20)  )//第1个1秒时间段
					max_0p5			<=		27'd95418;	
				else   if(  (cnt >= (1_000_000_000/20))   &  (cnt < (2_000_000_000/20)) )//第2个1秒时间段	
					max_0p5			<=		27'd85034;	
				else   if(  (cnt >= (2_000_000_000/20))   &  (cnt < (3_000_000_000/20)) )//第3个1秒时间段	
					max_0p5			<=		27'd75757;	
				else   if(  (cnt >= (3_000_000_000/20))   &  (cnt < (4_000_000_000/20)) )//第4个1秒时间段	
					max_0p5			<=		27'd71428;
				else   if(  (cnt >= (4_000_000_000/20))   &  (cnt < (5_000_000_000/20)) )//第5个1秒时间段	  
					max_0p5			<=		27'd63775;
				else   if(  (cnt >= (5_000_000_000/20))   &  (cnt < (6_000_000_000/20)) )//第6个1秒时间段		
					max_0p5			<=		27'd56818;
				else 
					max_0p5			<=		27'd50607;


endmodule 