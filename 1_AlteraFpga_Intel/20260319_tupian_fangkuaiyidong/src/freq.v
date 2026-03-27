module	freq
(
	input clk,
	input rst_n,
	output reg data_sel
);

	parameter CNT_MAX = 50_000_000;

	reg [25:0] cnt;
	wire add_cnt;
	wire end_cnt;
	
	
	always @ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt <= 0;
					data_sel <= 0;
				end
			else
				if(add_cnt)
					if(end_cnt)
						begin
							cnt <= 0;
							data_sel <= data_sel + 1'b1;
						end
					else
						begin
							cnt <= cnt + 1'b1;
							data_sel <= data_sel;
						end
				else	
					begin
						cnt <= cnt;
						data_sel <= data_sel;
					end
		end
	assign add_cnt = 1'b1;
	assign end_cnt = add_cnt && cnt == CNT_MAX - 1'b1;

endmodule