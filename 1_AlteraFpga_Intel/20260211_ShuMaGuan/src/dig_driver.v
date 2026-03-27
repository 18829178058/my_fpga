module  dig_driver
(
//系统相关
input  clk_50mhz,		//系统时钟，50MHz
input  rst_n,       	//系统复位，低电平有效
input  [23:0]  din,		//显示数码
//数码管驱动信号

output reg [7:0]  seg, //段选信号
output [2:0] sel //位选0~5,默认单个数码管显示时间1ms

);

////////////////////确定哪个数码管显示////////////////////////
reg  [15:0]  cnt;
reg [2:0] sel_temp;
always @(posedge clk_50mhz or negedge rst_n)
		if(rst_n === 1'b0)begin
		    sel_temp <= 3'd0;
		    cnt <= 16'd0;
		end else if(cnt == 16'd19999)begin
		    if(sel_temp == 3'd5)
				sel_temp <= 3'd0;
			else
				sel_temp <= sel_temp + 1'b1;
			cnt <= 16'd0;
		end else 
			cnt <= cnt + 1'b1;


////////////////////打两拍

reg [2:0] sel_temp_temp1,sel_temp_temp2;
always @(posedge clk_50mhz)
		begin
			sel_temp_temp1 <= sel_temp;
			sel_temp_temp2 <= sel_temp_temp1; 
		end

assign sel = sel_temp_temp2;

////////////////////给当前数码管分配显示数码////////////////////////
reg  [3:0] data;
always @(posedge clk_50mhz or negedge rst_n)
		if(rst_n === 1'b0)
		   data <= 4'd0;
		else case(sel)
		   5	:data <= din[((1*4)-1):(0*4)];
           4	:data <= din[((2*4)-1):(1*4)];
           3	:data <= din[((3*4)-1):(2*4)];
           2	:data <= din[((4*4)-1):(3*4)];
           1	:data <= din[((5*4)-1):(4*4)];
           0	:data <= din[((6*4)-1):(5*4)];
	   default  :data <= 4'd0;
	   endcase
////////////////////输出数码管编码（共阳）////////////////////////  
always @(posedge clk_50mhz or negedge rst_n)
		if(rst_n === 1'b0)
		    seg <= 		8'hFF;
		else case(data)
			4'h0       :seg <=     8'hC0;
			4'h1       :seg <=     8'hF9;
			4'h2       :seg <=     8'hA4;
			4'h3       :seg <=     8'hB0;   
			4'h4       :seg <=     8'h99;
			4'h5       :seg <=     8'h92;
			4'h6       :seg <=     8'h82;
			4'h7       :seg <=     8'hF8;
			4'h8       :seg <=     8'h80;
			4'h9       :seg <=     8'h90;
			4'hA       :seg <=     8'h88;
			4'hb       :seg <=     8'h83;
			4'hC       :seg <=     8'hC6;
			4'hd       :seg <=     8'hA1;
			4'hE       :seg <=     8'h86;
			4'hF       :seg <=     8'h8E;
			default    :seg <=	   8'hFF;
		endcase
endmodule