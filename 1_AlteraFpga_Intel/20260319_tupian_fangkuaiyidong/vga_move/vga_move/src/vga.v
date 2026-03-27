//VGA驱动
module vga(clk, rst_n, hsync, vsync, rgb, x, y, color);
	
	input clk, rst_n;
	input [7:0] color;
	
	output hsync, vsync;
	output [7:0] rgb;
	output [9:0] x,y;
	
//参数声明
	parameter	ha	=	128,
					hb	=	88,
					hc	=	800,
					hd	=	40,
					he	=	1056;
	
	parameter	va	=	4,
					vb	=	23,
					vc	=	600,
					vd	=	1,
					ve	=	628;
		
//定义内部变量
	reg	[10:0]	h_cnt;			//行计数
	wire				add_h_cnt;
	wire				end_h_cnt;
	
	reg	[9:0]		v_cnt;			//场计数
	wire				add_v_cnt;
	wire				end_v_cnt;
	
	reg				vaild_range;	//显示范围

	
//计数器
//h_cnt
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					h_cnt <= 0;
				end
			else
				if(add_h_cnt)
					if(end_h_cnt)
						h_cnt <= 0;
					else
						h_cnt <= h_cnt + 1;
				else
					h_cnt <= h_cnt;
		end
	
	assign	add_h_cnt	= 1;
	assign	end_h_cnt	=	add_h_cnt && h_cnt == he - 1;

//v_cnt
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					v_cnt <= 0;
				end
			else
				if(add_v_cnt)
					if(end_v_cnt)
						v_cnt <= 0;
					else
						v_cnt <= v_cnt + 1;
				else
					v_cnt <= v_cnt;
		end
	
	assign	add_v_cnt	=	end_h_cnt;
	assign	end_v_cnt	=	add_v_cnt && v_cnt == ve - 1;
	
	assign	hsync = (h_cnt < ha)	?	1'b0	:	1'b1;
	assign	vsync = (v_cnt < va)	?	1'b0	:	1'b1;
	
//vaild_range显示范围
	always @ (*)
		begin
			if(!rst_n)
				begin
					vaild_range = 0;
				end
			else
				if((h_cnt>ha+hb)&&(h_cnt<he-hd)&&(v_cnt>va+vb)&&(v_cnt<ve-vd))
					begin
						vaild_range <= 1;
					end
				else
					begin
						vaild_range <= 0;
					end
		end
	
	assign	rgb = (vaild_range)	?	color	:	8'b0;//消隐区为0
	assign	x	 =	(vaild_range)	?	(h_cnt - ha - hb)	:	10'b0;
	assign	y	 =	(vaild_range)	?	(v_cnt - va - vb)	:	10'b0;



endmodule 