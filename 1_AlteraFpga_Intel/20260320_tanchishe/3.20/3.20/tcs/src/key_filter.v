module key_filter(clk, rst_n, key_in, key_pose, key_nege);

	input clk, rst_n;
	
	input key_in;
	
	output key_nege, key_pose;
	
	reg key_out;
	
	reg state;
	
	reg [19:0] cnt;
	parameter	CNT_MAX = 1_000_000;
	
	always  @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					state <= 0;
					cnt <= 0;
					key_out <= 1;
				end
			else
				case(state)
					0	:	begin
								if(key_in == 0)
									if(cnt < CNT_MAX - 1)
										begin
											key_out <= 1;
											state <= 0;
											cnt <= cnt + 1;
										end
									else
										begin
											key_out <= 0;
											state <= 1;
											cnt <= 0;
										end
								else
									begin
										cnt <= 0;
										state <= 0;
										key_out <= 1;
									end
							end
					
					1	:	begin
								if(key_in == 1)
									if(cnt < CNT_MAX - 1)
										begin
											key_out <= 0;
											state <= 1;
											cnt <= cnt + 1;
										end
									else
										begin
											key_out <= 1;
											state <= 0;
											cnt <= 0;
										end
								else
									begin
										key_out <= 0;
										cnt <= 0;
										state <= 1;
									end
							end
					default	:	state <= 0;
				endcase
		end
/*锁沿*/
	reg key_buff1, key_buff2;
	
	always @ (posedge clk ,negedge rst_n)
		if(!rst_n)
			begin
				key_buff1 <= 1;
				key_buff2 <= 1;
			end
		else
			begin
				key_buff1 <= key_out;
				key_buff2 <= key_buff1;
			end
	
	assign	key_pose = (~key_buff2) & key_buff1;
	assign	key_nege = (~key_buff1) & key_buff2;
	
endmodule 