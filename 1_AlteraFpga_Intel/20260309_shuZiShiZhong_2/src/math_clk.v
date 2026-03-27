module math_clk
(
	input clk,
	input rst_n,
	output [23:0] data_bcd
);

	reg [23:0] data;
	//parameter CNT_MAX = 50_000_000;		//一秒种计数
	parameter CNT_MAX = 25_000_000;			//一秒分频计数

	reg clk_1S;
	reg [25:0] cnt;
	wire add_cnt_flag;
	wire end_cnt_flag;
	
//一秒分频
	always@ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt <= 0;
					clk_1S <= 0;
				end
			else
				if(add_cnt_flag)
					if(end_cnt_flag)
						begin
							cnt <= 0;
							clk_1S <= ~clk_1S;
						end
					else
						begin
							cnt <= cnt + 1;
							clk_1S <= clk_1S;
						end
				else
					begin
						cnt <= cnt;
						clk_1S <= clk_1S;
					end
						
		
		end
		
		assign add_cnt_flag = 1'b1;
		assign end_cnt_flag = add_cnt_flag && cnt == CNT_MAX - 1'b1;
		
		
//时钟逻辑

	always@ (posedge clk_1S or negedge rst_n)
		begin
			if(!rst_n)
				data <= 24'h0;
			else
				if(data == 24'h173b3b)
					begin
						data <= 0;
					end
				else
					if(data[15:0] == 16'h3b3b)
						begin
							data[23:16] <= data[23:16] + 1'b1;
							data[15:0] <= 0;
						end
					else
						begin
							if(data[7:0] == 8'h3b)
								begin
									data[23:8] <= data[23:8] + 1'b1;
									data[7:0] <= 0;
								end
							else
								data <= data + 1'b1;
						end
					
		end	
		
		bin_bcd bin_bcd_inst1(.bin(data[7:0]),.bcd(data_bcd[7:0]));
		bin_bcd bin_bcd_inst2(.bin(data[15:8]),.bcd(data_bcd[15:8]));
		bin_bcd bin_bcd_inst3(.bin(data[23:16]),.bcd(data_bcd[23:16]));
		
endmodule