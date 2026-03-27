module move_ctrl (clk, rst_n, q, x, y, addr, color);
	
	input clk, rst_n;
	
	input [7:0] q;
	
	input [9:0] x, y;
	
	output	reg	[13:0]	addr;
	output	reg	[7:0]	color;
	
//参数定义
	parameter	block	=	100;	//图像边长
	parameter	border	=	40;		//边框长度
	parameter	CNT_MAX	=	663138;		//1056*628
	
	
//定义内部变量
	reg	[19:0]	move_cnt;	//每一帧计数
	wire	add_move_cnt;	
	wire	end_move_cnt;			//帧结束信号
	
	reg	[9:0] block_x, block_y;	//x,y坐标
	
	reg	x_direction, y_direction; // x,y方向
	
//计数器
//move_cnt
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				move_cnt <= 0;
			else
				if(add_move_cnt)
					if(end_move_cnt)
						move_cnt <= 0;
					else
						move_cnt <= move_cnt + 1;
				else
					move_cnt <= move_cnt;
		end
	
	assign	add_move_cnt	=	1;
	assign	end_move_cnt	=	add_move_cnt && move_cnt == CNT_MAX - 1;	//一帧跑完
	
//x_direction,y_direction
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					x_direction <= 1;
				end
			else
				begin
					if(block_x == border)	//左边框
						x_direction <= 1;
					else
						if(block_x == 800 - border - block)//右边框
							x_direction <= 0;
						else
							x_direction <= x_direction;
				end
		end
		
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					y_direction <= 1;
				end
			else
				if(block_y == border)	//上边框
					y_direction <= 1;
				else
					if(block_y == 600 - border - block)	//下边框
						y_direction <= 0;
					else
						y_direction <= y_direction;
		end
	
//block_x,block_y
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					block_x <= 200;
				end
			else
				if(end_move_cnt)	//一帧跑完
					begin
						if(x_direction == 0)	//碰到右边框
							block_x = block_x - 1;	//向左移动
						else					//碰到左边框
							block_x = block_x + 1;	//向右移动
					end
				else
					begin
						block_x <= block_x;
					end
		end
	
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					block_y <= 200;
				end
			else
				if(end_move_cnt)	//一帧跑完		
					if(y_direction	== 0)	//碰到下边框
						block_y <= block_y - 1;	//向上移动
					else					//碰到上边框
						block_y <= block_y + 1;	//向下移动 
				else
					block_y <= block_y;
		end
		
		
//涂色
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					addr <= 0;
					color <= 0;
				end
			else
				if((x>=block_x - border)&&(x<=block_x+block+border-1)&&
					(y>=block_y - border)&&(y<=block_y+block+border-1))	//整个运动方块
					if((x >= block_x)&&(x<=block_x+block-1)&&
						(y >= block_y)&&(y<=block_y+block-1))	//	图片数据
							begin
								if(addr < 10000 - 1)
									begin
										addr <= addr + 1;
										color <= q;
									end
								else
									addr <= 0;
							end
					else									//框
						begin
							color <= 8'b111_000_00;
							addr <= addr;
						end
				else										//整个运动方块之外的区域
					begin
						color <= 8'b111_111_11;
					end
					
		end
	
endmodule 