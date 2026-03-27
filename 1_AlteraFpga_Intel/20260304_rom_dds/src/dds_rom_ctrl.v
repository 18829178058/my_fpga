module dds_rom_ctrl
(
	input clk,
	input rst_n,
	input key,
	output reg [9:0] addr
);

reg [1:0] state_c, state_n;


parameter 	SIN 	=	2'b00,
			JUCHI	=	2'b01,
			SANJIAOBO	=	2'b10,
			FANGBO		=	2'b11;
			


always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		state_c <= FANGBO;
	else
		state_c <= state_n;
end

always@ (*)
begin
	state_n = FANGBO;
	case(state_c)
		FANGBO:		if(key)
						state_n = JUCHI;
					else
						state_n = FANGBO;
		
		JUCHI:		if(key)
						state_n = SANJIAOBO;
					else
						state_n = JUCHI;
		
		SANJIAOBO:	if(key)
						state_n = SIN;
					else
						state_n = SANJIAOBO;
		SIN:		if(key)
						state_n = FANGBO;
					else
						state_n = SIN;
		default:	state_n = FANGBO;
	endcase
end



//三段式第三段，输出
always@ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			begin
				addr <= 10'd0;
			end
		else
			begin
				case(state_c)
					FANGBO:		begin
									if(addr < 255)
										addr <= addr + 1;
									else
										addr <= 0;
								end
					JUCHI:	begin
									if(addr < 511)
										if(addr < 255)
											addr <= 256;
										else
											addr <= addr + 1;
									else
										addr <= 256;
								end
			
					SANJIAOBO:		begin
									if(addr < 767)
										if(addr < 511)
											addr <= 512;
										else
											addr <= addr + 1;
									else
										addr <= 512;
								end
					SIN:		begin
									if(addr < 1023)
										if(addr < 767)
											addr <= 768;
										else
											addr <= addr + 1;
									else
										addr <= 768;
								end
					default:   	begin 
									addr <= 10'd0;
								end
				endcase
			end
	end
endmodule