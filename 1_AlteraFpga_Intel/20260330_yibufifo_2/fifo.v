module  fifo#(		parameter	data_width	=	8,
						parameter	data_depth	=	8,
						parameter	pid	=	3
						)
				(wr_rst_n,wr_clk,wr_data,wr_en,
				rd_rst_n,rd_clk,rd_data,rd_en,
				fifo_full,fifo_empty);
			input								wr_clk;
			input								wr_en;
			input								wr_rst_n;
			input	[data_width-1	:0]	wr_data;
			input								rd_clk;
			input								rd_en;
			input								rd_rst_n;
			output	reg								fifo_full;
			output	reg								fifo_empty;
			output	reg	[data_width-1	:0]	rd_data;
			
/*************************双端ram******************************/

		reg	[data_width-1	:0]	fifo_ram	[data_depth-1	:0];	
//写计数
		reg	[pid	:	0]	wr_pr;
		always	@(posedge	wr_clk	or	negedge	wr_rst_n)
				begin
						if	(!wr_rst_n)
							begin	
								wr_pr	<=	0;
							end
						else
							if(wr_en	&&	!fifo_full)
								wr_pr	<=	wr_pr	+	1;
							else	
								wr_pr	<=	wr_pr;
								
				end
		
	
//写数据
		wire	[pid	-1	:0]	wr_add;
		assign	wr_add	=	wr_pr[pid	-1	:0];
		always	@(posedge	wr_clk or negedge	wr_rst_n)
				begin
					if(!wr_rst_n)
						fifo_ram[wr_add]	<=	0;
					else
						if(wr_en	&&!fifo_full)
						fifo_ram[wr_add]	<=	wr_data;
						else
						fifo_ram[wr_add]	<=fifo_ram[wr_add];	
				end
				
//读计数
		reg	[pid	:	0]	rd_pr;
		always	@(posedge	rd_clk or negedge	rd_rst_n)
				begin
					if(!rd_rst_n)
						rd_pr	<=	0;
					else
						if(rd_en	&&	!fifo_empty)
						rd_pr	<=	rd_pr	+	1;
						else
						rd_pr	<=	rd_pr;
				end
				
//读数据
		wire	[pid	-1	:	0]	rd_add;
		assign	rd_add	=	rd_pr[pid	-1	:	0]	;
		always	@(posedge	rd_clk or negedge	rd_rst_n)
				begin
					if(!rd_rst_n)
					rd_data	<=	0;
					else
						if(rd_en	&&	!fifo_empty)
							rd_data	<=	fifo_ram[rd_add];
						else
							rd_data	<=	rd_data;
				end
/*************************二进制转格雷码和异步同步******************************/
//读写地址二进制转换
		wire	[pid	:0]	wr_pr_g;
		wire	[pid	:0]	rd_pr_g;
		assign	wr_pr_g	=	wr_pr	^	(wr_pr>>1);
		assign	rd_pr_g	=	rd_pr	^	(rd_pr>>1);
		
//读地址与写时钟同步
		reg	[pid	:0]	wr_pr_g1;
		reg	[pid	:0]	wr_pr_g2;
		always	@(posedge	rd_clk or negedge	rd_rst_n)
				begin
					if(!rd_rst_n)
						begin
							wr_pr_g1		<=		0;
							wr_pr_g2		<=		0;
						end
					else
						begin	
							wr_pr_g1		<=		wr_pr_g;
					      wr_pr_g2		<=		wr_pr_g1;
						end
				end

//写地址与读时钟同步
		reg	[pid	:0]	rd_pr_g1;
		reg	[pid	:0]	rd_pr_g2;
		always	@(posedge	wr_clk or negedge	wr_rst_n)
				begin
					if(!wr_rst_n)
						begin
							rd_pr_g1		<=		0;
                     rd_pr_g2		<=		0;
						end
					else
						begin	
							rd_pr_g1		<=		rd_pr_g;
							rd_pr_g2		<=		rd_pr_g1;	
						end
				end


/************************空满信号判断******************************/

//满
		always	@(*)
				begin
					if(!wr_rst_n)
						fifo_full	=	0;
					else
						if(wr_pr_g	==	{~rd_pr_g2[pid	:pid-1],rd_pr_g2[pid-2:0]})
						fifo_full	=	1;
						else
						fifo_full	=	0;
				end
			
//空
	always	@(*)
			begin
				if(!rd_rst_n)
					fifo_empty	=	0	;
				else	
					if(rd_pr_g	==	wr_pr_g2)
					fifo_empty	=	1;
					else
					fifo_empty	=	0;
					
			end
			
endmodule





				
	