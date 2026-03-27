module vga(
	input clk, 
	input rst_n, 
	output reg [7:0] rgb, 
	output hsyns, 
	output vsync
);

//参数定义
	parameter 	ha = 128,
				hb = 88,
				hc = 800,
				hd = 40,
				he = 1056;
				
	parameter	va = 4,
				vb = 23,
				vc = 600,
				vd = 1,
				ve = 628;
				
	
//内部变量定义
	reg [10:0]	h_cnt;
	reg [9:0]	v_cnt;
	
	
	
//h_cnt
	always @ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				h_cnt <= 0;
			else
				if(h_cnt < he -1)
					h_cnt <= h_cnt + 1;
				else
					h_cnt <= 0;
		end
	
//v_cnt
	always @ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				v_cnt <= 0;
			else
				if(v_cnt == ve -1 && h_cnt == he - 1)
					v_cnt <= 0;
				else
					if(h_cnt == he - 1)
						v_cnt <= v_cnt + 1;
					else
						v_cnt <= v_cnt;
		end
	
	assign hsyns = (h_cnt < ha) ? 1'b0 : 1'b1;
	assign vsync = (v_cnt < va)	? 1'b0 : 1'b1;
	

//屏幕平均分成8份
	always @ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				rgb <= 0;
			else
				if(h_cnt > 216 && h_cnt < 1016)
					case(h_cnt[9:7])
						3'd0 :	rgb <= 8'b111_000_00;
						3'd1 :	rgb <= 8'b000_111_00;
						3'd2 :	rgb <= 8'b000_000_11;
						3'd3 :	rgb <= 8'b111_111_00;
						3'd4 :	rgb <= 8'b111_000_11;
						3'd5 :	rgb <= 8'b000_111_11;
						3'd6 :	rgb <= 8'b111_111_11;
						3'd7 :	rgb <= 8'b000_000_00;
						default: rgb <= 0;
					endcase
				else
					 rgb <= 0;
		end
endmodule