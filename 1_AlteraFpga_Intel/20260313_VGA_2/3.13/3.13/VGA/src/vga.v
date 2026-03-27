//端口定义
module vga(clk, rst_n, key, hsync, vsync, rgb);

	input clk, rst_n;
	
	input key;
	
	output hsync;
	
	output vsync;
	
	output reg [7:0] rgb;

//参数定义
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
					
	parameter	frame = 60;
	
//定义内部变量
	reg	[10:0]	h_cnt;			//行计数
	wire				add_h_cnt;
	wire				end_h_cnt;
	
	reg	[9:0]		v_cnt;			//列计数
	wire				add_v_cnt;
	wire				end_v_cnt;
	
	reg	[5:0]		frame_cnt;		//帧计数
	
	reg	[8:0]		radius;			//半径，最大值为310，初始值为10，每帧加5，加60帧
	
	reg				switch;			//放大还是缩小，1为放大，0为缩小
	
	reg	[19:0]	range;		//判断是否在圆内
	 
	
//	reg	[10:0]	bank;    //步进
//	wire				add_bank;
//	wire				end_bank;

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
	
	assign	add_h_cnt	=	1;
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
	
	assign	add_v_cnt = end_h_cnt;
	assign	end_v_cnt = add_v_cnt && v_cnt == ve - 1;
	
	assign	hsync = (h_cnt < ha)	?	1'b0	:	1'b1;
	assign	vsync = (v_cnt < va)	?	1'b0	:	1'b1;

//frame_cnt帧计数器
	always @ (posedge clk , negedge rst_n)
		begin
			if(!rst_n)
				begin
					frame_cnt <= 0;
				end
			else
				if(frame_cnt == frame - 1)
					if(key)
						frame_cnt <= 0;
					else
						frame_cnt <= frame_cnt;
				else
					if(h_cnt == he - 1 && v_cnt == ve - 1)
						frame_cnt <= frame_cnt + 1;
					else
						frame_cnt <= frame_cnt;
		end
	
//switch
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				switch <= 1;
			else
				if(frame_cnt == frame - 1 && key)
					switch <= ~switch;
				else
					switch <= switch;
		end
	
//radius
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					radius <= 10;
				end
			else
				if(frame_cnt != 0 && h_cnt == 0 && v_cnt == 0)
					if(switch)
						radius <= radius + 5;
					else
						radius <= radius - 5;
				else
					radius <= radius;
		end
		
//求面积
	always @ (*)
		begin
			range = ((h_cnt - ha - hb - 400) * (h_cnt - ha - hb - 400)* 4 / 3)
						+((v_cnt - va - vb - 300) * (v_cnt - va - vb - 300));
		end
//面积比对	
	always @ (*)
		begin
			if(!rst_n)
				begin
					rgb = 0;
				end
			else
				if((h_cnt >= ha + hb)&&(h_cnt < he - hd) && (v_cnt >= va + vb) && (v_cnt < ve- vd))
					if(range < (radius * radius))
						rgb <= 8'b111_000_00;
					else
						rgb <= 8'b0;
		end
		
		
/*	
//显示纯色
	always @ (posedge clk ,negedge rst_n)
		begin
			if(!rst_n)
				begin
					rgb <= 8'b0;
				end
			else
				if((h_cnt > ha + hb)&&(h_cnt < he - hd)&&(v_cnt > va + vb)&&(v_cnt < ve - vd))
					rgb <= 8'b111_000_00;
				else
					rgb <= 8'b0;//消隐区必须为0
		end*/
/*	
//显示一个矩形，根据按键去更改长宽
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					rgb <= 8'b0;
				end
			else
				if((h_cnt > 216) && (h_cnt < 296 + bank) && (v_cnt > 27) && (v_cnt < 87 + bank))
					rgb <= 8'b111_000_00;
				else
					rgb <= 8'b0;
		end

	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				bank <= 11'd0;
			else
				if(add_bank)
					if(end_bank)
						bank <= 0;
					else
						bank <= bank + 20;
				else
					bank <= bank;
		end	
		
	assign	add_bank = key;
	assign	end_bank = add_bank && bank == 720;
*/				
	
endmodule 