module vga
(
	input clk,
	input rst_n,
	output reg vaild_range,
	output [9:0] x,
	output [9:0] y,
	output hsync,
	output vsync
);

//参数声明
	parameter		ha	=	96,
					hb	=	48,
					hc	=	640,
					hd	=	16,
					he	=	800;
	
	parameter		va	=	2,
					vb	=	33,
					vc	=	480,
					vd	=	10,
					ve	=	525;
		
//定义内部变量
	reg	[10:0]	h_cnt;			//行计数
	wire				add_h_cnt;
	wire				end_h_cnt;
	
	reg	[9:0]		v_cnt;			//场计数
	wire				add_v_cnt;
	wire				end_v_cnt;

	
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
	
	assign	x	 =	(vaild_range)	?	(h_cnt - ha - hb)	:	10'b0;
	assign	y	 =	(vaild_range)	?	(v_cnt - va - vb)	:	10'b0;



endmodule