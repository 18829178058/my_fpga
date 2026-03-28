module lcd_display
(
    input         lcd_pclk,           //时钟
	input         rst_n,              //复位，低电平有效
	input [15:0]  lcd_id,             //LCD屏ID
	input [10:0]  pixel_xpos,         //当前像素点横坐标
	input [10:0]  pixel_ypos,         //当前像素点纵坐标
	input [10:0]  h_disp,             //LCD屏水平分辨率
	input [10:0]  v_disp,             //LCD屏垂直分辨率
	output reg [23:0] pixel_data,     //像素数据

//FFT请求和数据接口
	input [7:0]  fft_point_cnt,       //FFt频谱位置
	input [7:0]  fft_data,            //FFT频率幅度
	output       fft_point_done,      //FFT当前频谱绘制完成
	output       data_req             //请求数据信号
);

//parameter define
localparam BLACK    = 24'b00000000_00000000_00000000;   //黑色
localparam WHITE    = 24'b11111111_11111111_11111111;   //白色
localparam BLUE 	= 24'b00000000_00000000_11111111;   //蓝色
localparam RED      = 24'b11111111_00000000_00000000;   //红色
localparam H_OFFSET = 8'd64;
localparam V_OFFSET = 8'd44;


//reg define
reg [7:0]    fft_point_cnt_d0;
reg [7:0]    fft_point_cnt_d1;
reg          data_req_d0;
reg          data_req_d1;
reg [10:0]   row_axle_addr;
reg [10:0]   col_axle_addr;
reg [7:0]    rom_col_shift_data;
reg [7:0]    cnt_col_en;
reg [7:0]    rom_row_shift_data;
reg          col_y_axle_en;
reg          col_axle_en;
reg          row_y_axle_en;
reg          row_x_axle_en;
reg [5:0]    cnt_row_x_axle_en;
reg          row_axle_en;
reg [2:0]    cnt_row_en;
reg [23:0]   x_frame_data;
reg          col_x_axle_en;
reg [23:0]   y_frame_data;
reg [3:0]    fft_step;
reg [10:0]   fft_y_frame_start;
reg [10:0]   fft_x_frame_start;
reg [10:0]   fft_x_frame_end;
reg [10:0]   fft_y_frame_end;

//wire define
wire [7:0] rom_row_data;
wire [7:0] rom_col_data;
wire [8:0] lcd_fft_data;
wire       col_axle_data;
wire       row_axle_data;

//==========================code====================================

//在ID为7016和1018的屏上，1个FFT幅度值用2个像素点来表示
assign lcd_fft_data = lcd_id[2] ? fft_data : {fft_data,1'b0};


//从rom出来的数据是高位先出来
assign row_axle_data = rom_row_shift_data[7];
assign col_axle_data = rom_col_shift_data[7];

//对信号打拍
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    begin
			    fft_point_cnt_d0 <= 8'd0;
				fft_point_cnt_d1 <= 8'd0'
				data_req_d0 <= 1'b0;
				data_req_d1 <= 1'b0;
			end
		else
		    begin
			    fft_point_cnt_d0 <= fft_point_cnt;
				fft_point_cnt_d1 <= fft_point_cnt_d0;
				data_req_d0 <= data_req;
				data_req_d1 <= data_req_d0;
			end
	end
	
	
//产生一个采样点的频谱宽度，本次的显示的点是128个，所以采用高4位作为宽度
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    fft_step <= 4'd0;
		else
		    fft_step <= h_disp[10:7] - 4'd1;
	end
	
//产生X方向上的边框结束位置
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    fft_x_frame_end <= 11'd0;
		else
		    fft_x_frame_end <= H_OFFSET + fft_step * 120;
	end
	

//产生X方向上的边框起始位置
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    fft_x_frame_start <= 11'd0;
		else 
		    fft_x_frame_start <= H_OFFSET;
	end
	
	
//产生Y方向上的边框结束位置
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    fft_y_frame_end <= 11'd0;
		else
		    fft_y_frame_end <= v_disp - V_OFFSET;
	end
	

//产生Y方向上的边框起始位置
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    fft_y_frame_start <= 11'd0;
		else 
		    if(lcd_id[7:0] == 8'h)
		        fft_y_frame_start <= v_disp - 11'd250 - V_OFFSET;
			else
			    fft_x_frame_start <= v_disp - 11'd500 - V_OFFSET;			
	end
	

//产生请求数据信号
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    data_req <= 1'b0;
		else
		    begin
			    if((pixel_xpos == (fft_point_cnt + 8'd1)*fft_step - 4'd3 + H_OFFSET) && (pixel_ypos >= fft_y_frame_start)
				    data_req <= 1'b1;
				else
				    data_req <= 1'b0;
			end
	end
	
	
//1行结束，拉高done信号，表示此次的频谱显示已完成
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    fft_point_done <= 1'b0;
		else 
		    begin
			    if(pixel_xpos == h_disp -1)
				    fft_point_done <= 1'b1;
				else
				    fft_point_done <= 1'b0;
			end
	end
	
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    x_frame_data <= WHITE;
		else
		    begin
			    if(pixel_ypos >= fft_y_frame_start && pixel_ypos <= fft_y_frame_end)
				    if((pixel_xpos == fft_x_frame_start - 1) || pixel_xpos == fft_x_frame_start)
					    x_frame_data <= RED;
					else if(data_req_d0 || data_req_d1)
						    if(fft_point_cnt_d1 == 19)
							    x_frame_data <= RED;
							else if(fft_point_cnt_d1 == 39)
								x_frame_data <= RED;
						    else if(fft_point_cnt_d1 == 59)
								x_frame_data <= RED;
							else if(fft_point_cnt_d1 == 79)
								x_frame_data <= RED;
                            else if(fft_point_cnt_d1 == 99)
								x_frame_data <= RED;
                            else if(fft_point_cnt_d1 == 1199)
								x_frame_data <= RED;
                            else
                                x_frame_data <= WHITE;												
					else
					    x_frame_data <= WHITE;
				else
				    x_frame_data <= WHITE;
			end
	end
	
//产生水平方向上的边框数据
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    y_frame_data <= WHITE;
		else
		    begin
			    if((pixel_xpos >= fft_x_frame_start - 11'd1) && (pixel_xpos <= fft_x_frame_end - 11'd1))
				    if(pixel_ypos[10:1] == fft_y_frame_end[10:1])
					    y_frame_data <= RED;
					else
					    if(lcd_id[7:0] == 8'h84)
						    if(pixel_ypos[10:1] == fft_y_frame_end[10:1] - 10'd25)
							    y_frame_data <= RED;
							else if(pixel_ypos[10:1] == fft_y_frame_end[10:1] - 10'd50)
							    y_frame_data <= RED;
						    else if(pixel_ypos[10:1] == fft_y_frame_end[10:1] - 10'd75)
							    y_frame_data <= RED;
							else if(pixel_ypos[10:1] == fft_y_frame_end[10:1] - 10'd100)
							    y_frame_data <= RED;
							else if(pixel_ypos[10:1] == fft_y_frame_end[10:1] - 10'd125)
							    y_frame_data <= RED;
							else 
							    y_frame_data <= WHITE;
						else if(pixel_ypos[10:1] == fft_y_frame_end[10:1] - 10'd50)
							y_frame_data <= RED;
					    else if(pixel_ypos[10:1] == fft_y_frame_end[10:1] - 10'd100)
							y_frame_data <= RED;
						else if(pixel_ypos[10:1] == fft_y_frame_end[10:1] - 10'd150)
							y_frame_data <= RED;
						else if(pixel_ypos[10:1] == fft_y_frame_end[10:1] - 10'd200)
							y_frame_data <= RED;
					    else if(pixel_ypos[10:1] == fft_y_frame_end[10:1] - 10'd250)
							y_frame_data <= RED;
						else 
						    y_frame_data <= WHITE;
					else
					    y_frame_data <= WHITE;
			end
	end

always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
            col_x_axle_en <= 1'b0;
        else
            begin
                if(lcd_id[7:0] == 8'h84 && (pixel_ypos >= fft_y_frame_end - 11'd287) && (pixel_ypos < fft_y_frame_end - 11'd255)) //x256
				    if(pixel_xpos >= 11'd32 && pixel_xpos < 11'd96)
					    col_x_axle_en <= 1'b1;
					else
					    col_x_axle_en <= 1'b0;
				else if((pixel_ypos >= fft_y_frame_end - 11'd537) && (pixel_ypos < fft_y_frame_end - 11'd505))
				    if(pixel_xpos >= 11'd32 && pixel_xpos < 11'd96)
					    col_x_axle_en <= 1'b1;
					else
					    col_x_axle_en <= 1'b0;
				else if(pixel_xpos >= 11'd6 && pixel_xpos < 11'd54)
				         col_x_axle_en <= 1'b1;
				     else
					     col_x_axle_en <= 1'b0;
            end			
	end


//列方向的Y轴范围使能
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    col_y_axle_en <= 1'b0;
		else
		    begin
			    if((pixel_ypos >= fft_y_frame_end - 11'd22) && (pixel_ypos < fft_y_frame_end))
				    col_y_axle_en <= 1'b1;
				else
				    if(lcd_id[7:0] == 8'h84)
					    if((pixel_ypos >= fft_y_frame_end - 11'd82) && pixel_ypos < fft_y_frame_end - 11'd50))
						    col_y_axle_en <= 1'b1;
						else if((pixel_ypos >= fft_y_frame_end - 11'd132) && pixel_ypos < fft_y_frame_end - 11'd100))
						    col_y_axle_en <= 1'b1;
						else if((pixel_ypos >= fft_y_frame_end - 11'd182) && pixel_ypos < fft_y_frame_end - 11'd150))
						    col_y_axle_en <= 1'b1;
						else if((pixel_ypos >= fft_y_frame_end - 11'd232) && pixel_ypos < fft_y_frame_end - 11'd200))
						    col_y_axle_en <= 1'b1;
						else if((pixel_ypos >= fft_y_frame_end - 11'd287) && pixel_ypos < fft_y_frame_end - 11'd255))
						    col_y_axle_en <= 1'b1;
						else
						    col_y_axle_en <= 1'b0;
					else if((pixel_ypos >= fft_y_frame_end - 11'd132) && (pixel_ypos < fft_y_frame_end - 11'd100))
					    col_y_axle_en <= 1'b1;
					else if((pixel_ypos >= fft_y_frame_end - 11'd232) && (pixel_ypos < fft_y_frame_end - 11'd200))
					    col_y_axle_en <= 1'b1;
					else if((pixel_ypos >= fft_y_frame_end - 11'd332) && (pixel_ypos < fft_y_frame_end - 11'd300))
					    col_y_axle_en <= 1'b1;
					else if((pixel_ypos >= fft_y_frame_end - 11'd432) && (pixel_ypos < fft_y_frame_end - 11'd400))
					    col_y_axle_en <= 1'b1;
					else if((pixel_ypos >= fft_y_frame_end - 11'd537) && (pixel_ypos < fft_y_frame_end - 11'd505))
					    col_y_axle_en <= 1'b1;
					else
					    col_y_axle_en <= 1'b0;
			end
	end

//列方向的范围使能
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    col_axle_en <= 1'b0;
		else
		    begin
			    if(col_x_axle_en && col_y_axle_en)
				    col_axle_en <= 1'b1;
				else
				    col_axle_en <= 1'b0;
			end
	end

//行方向的Y轴范围使能
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    row_y_axle_en <= 1'b0;
		else
		    begin
		        if(pixel_ypos >= fft_y_frame_end + 11'd6) && (pixel_ypos < fft_y_frame_end + 11'd38)
			        row_y_axle_en <= 1'b1;
			    else
			        row_y_axle_en <= 1'b0;
			end
	end

always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    row_x_axle_en <= 1'b0;
		else
		    begin
			    if(cnt_row_x_axle_en >= 6'd47)
				    row_x_axle_en <= 1'b0;
				else if(cnt_row_x_axle_en >= 6'd31 && (pixel_xpos < fft_x_frame_end - 11'd10))
				    row_x_axle_en <= 1'b0;
				else if(pixel_xpos == fft_x_frame_start - 11'd16)
				    row_x_axle_en <= 1'b1;
				else if(data_req)
				        if((fft_point_cnt_d0 == 8'd17)||(fft_point_cnt_d0 == 8'd37)||(fft_point_cnt_d0 == 8'd57)
					     ||(fft_point_cnt_d0 == 8'd77)||(fft_point_cnt_d0 == 8'd97)||(fft_point_cnt_d0 == 8'd117))
					        row_x_axle_en <= 1'b1;
					    else
					        row_x_axle_en <= row_x_axle_en;
				else
				    row_x_axle_en <= row_x_axle_en;
			end
	end
	
	
//对行方向的X轴范围使能进行计数
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    cnt_row_x_axle_en <= 6'd0;
		else
		    begin
			    if(row_x_axle_en)
				    cnt_row_x_axle_en <= cnt_row_x_axle_en + 6'd1;
				else
				    cnt_row_x_axle_en <= 6'd0;
			end
	end
	
//行方向的范围使能
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    row_axle_en <= 1'b0;
		else
		    begin
			    if(row_y_axle_en && row_x_axle_en)
				    row_axle_en <= 1'b1;
				else
				    row_axle_en <= 1'b0;
			end
	end

//对行方向的使能进行计数
always @ (posedge lcd_pclk or negedge rst_n)
    begin
	    if(!rst_n)
		    cnt_row_en <= 3'd0;
		else
		    begin
			    if(row_axle_en)
				    cnt_row_en <= cnt_row_en + 3'd1;
				else
				    cnt_row_en <= 3'd0;
			end
	
	
	end


//行方向的ROM地址
always @ (posedge lcd_pclk or negedge rst_n)
    begin
		if(!rst_n)
			row_axle_addr <= 11'd0;
		else
			begin
				if(pixel_ypos == v_disp)
					row_axle_addr <= 11'd0;
				else
					if(row_axle_en && cnt_row_en 3'd5)
						row_axle_addr <= row_axle_addr + 11'd1;
					else
						row_axle_addr <= row_axle_addr;
			end
	end
	
//行方向的移位寄存数据
always @ (posedge lcd_pclk or negedge rst_n)
	begin
		if(!rst_n)
			rom_row_shift_data <= 8'd0;
		else
			begin
				if(cnt_row_en == 3'd7)
					rom_row_shift_data <= rom_row_data;
				else if(row_axle_en)
					rom_row_shift_data <= {rom_row_shift_data[6:0],1'b0};
				else
					rom_row_shift_data <= rom_row_shift_data;
			end
	end
	
//对列方向的使能进行计数
always @ (posedge lcd_pclk or negedge rst_n)
	begin
		if(!rst_n)
			cnt_col_en <= 3'd0;
		else
			if(col_axle_en)
				cnt_col_en <= cnt_col_en + 3'd1;
			else
				cnt_col_en <= 3'd0;
	end
	

//列方向的ROM地址
always @ (posedge lcd_pclk or negedge rst_n)
	begin
		if(!rst_n)
			col_axle_addr <= 11'd0;
		else
			begin
				if(pixel_ypos == v_disp)
					col_axle_addr <= 11'd0;
				else
					if(col_axle_en && cnt_col_en == 3'd5)
						col_axle_addr <= col_axle_addr + 11'd1;
					else
						col_axle_addr <= col_axle_addr;
			end
	end


//列方向的移位寄存器数据
always @ (posedge lcd_pclk or negedge rst_n)
	begin
		if(!rst_n)
			rom_col_shift_data <= 8'd0;
		else
			begin
				if(cnt_col_en == 3'd7)
					rom_col_shift_data <= rom_col_data;
				else if(col_axle_en)
					rom_col_shift_data <= {rom_col_shift_data[6:0], 1'b0};
				else
					rom_col_shift_data <= rom_col_shift_data;
			end
	end


//产生像素数据信号
always @ (posedge lcd_pclk or negedge rst_n)
	begin
		if(!rst_n)
			pixel_data <= WHITE;
		else
			begin
				if(!x_frame_data[0])
					pixel_data <= x_frame_data;
				else if(!y_frame_data[0])
					pixel_data <= y_frame_data;
				else if((row_axle_data && row_axle_en) || (col_axle_data && col_axle_en))
					pixel_data <= BLUE;
				else if(pixel_xpos >= (fft_point_cnt_d0 * fft_step + H_OFFSET))
					 &&(pixel_xpos < (fft_point_cnt_d0 + 1) * fft_step + H_OFFSET))
						if(lcd_fft_data == 0)
							pixel_data <=WHITE;
						else if(pixel_ypos >= v_disp - lcd_fft_data -V_OFFSET)
						     &&(pixel_ypos <= v_disp - V_OFFSET)
							 pixel_data <= BLUE;
						else
							pixel_data <= WHITE;
				else
					pixel_data <= WHITE;
			end
	end

//例化行方向坐标的 ROM
rom_row_axle u_rom_row_axle (
	.clka (lcd_pclk ), // input wire clka
	.addra (row_axle_addr), // input wire [9 : 0] addra
	.douta (rom_row_data ) // output wire [7 : 0] douta
);

//例化列方向坐标的 ROM
rom_col_axle u_rom_col_axle (
	.clka (lcd_pclk ), // input wire clka
	.addra (col_axle_addr), // input wire [9 : 0] addra
	.douta (rom_col_data ) // output wire [7 : 0] douta
);

endmodule