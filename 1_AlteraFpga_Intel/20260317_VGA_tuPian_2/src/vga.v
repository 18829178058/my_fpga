//VGA显示图片mif格式数据文件
//端口定义
module vga
(
	input clk,
	input rst_n,
	input [7:0] q,
	output hsync,
	output vsync,
	output reg [7:0] rgb,
	output reg [15:0] addr
);

//参数声明
	parameter	ha = 128,
				hb = 88,
				hc = 800,
				hd = 40,
				he = 1056;
				
	parameter	va = 4,
				vb = 23,
				vc = 600,
				vd = 1,
				ve = 628;
				

//定义内部变量
	reg [10:0] h_cnt;		//行计数
	wire add_h_cnt;
	wire end_h_cnt;
	
	reg [9:0] v_cnt;		//场计数
	wire add_v_cnt;
	wire end_v_cnt;
	
	reg				vaild_range;

//计数器
//h_cnt
	always @ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					h_cnt <= 0;
				end
			else
				if(add_h_cnt)
					if(end_h_cnt)
						h_cnt <= 1'b0;
					else
						h_cnt <= h_cnt + 1'b1;
				else
					h_cnt <= h_cnt;
		end
	
	assign add_h_cnt = 1;
	assign end_h_cnt = add_h_cnt && h_cnt == he -1;
	
//v_cnt
	always @ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					v_cnt <= 0;
				end
			else
				if(add_v_cnt)
					if(end_v_cnt)
						v_cnt <= 1'b0;
					else
						v_cnt <= v_cnt + 1'b1;
				else
					v_cnt <= v_cnt;
		end
	
		assign add_v_cnt = end_h_cnt;
		assign end_v_cnt = add_v_cnt && v_cnt == ve -1;

		assign hsync = (h_cnt < ha) ? 1'b0 : 1'b1 ;
		assign vsync = (v_cnt < va) ? 1'b0 : 1'b1 ;

//显示范围
	always @ (*)
		begin
			if(!rst_n)
				vaild_range= 0;
			else
				if((h_cnt>=ha+hb) && (h_cnt<he-hd)&&(v_cnt>=va+vb)&&(v_cnt<ve-vd))
					vaild_range = 1;
				else
					vaild_range = 0;
		end

//图像数据
	always @ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					rgb <= 8'b0;
					addr <= 1;
				end
			else
				if(vaild_range)//是否在vga显示范围内（800*600）
					if((h_cnt >= ha + hb)&&(h_cnt<ha+hb+30)
					 &&(v_cnt >= va+vb)&&(v_cnt < va+vb+40))//判断是否在图像大小内，100*130，位置在左上
						begin
							if(addr < 30*40 - 1)//地址是否计满
								begin
									addr <= addr + 1'b1;
									rgb <= q;
								end
							else
								begin
									addr <= 0;
								end
						end
					else	//图像范围之外显示白色
						begin
							rgb <= 8'b111_111_11;
							addr <= addr;
						end
				else		//vga显示范围之外
					begin
						rgb <= 8'b0;
						addr <=addr;
					end
		end


endmodule