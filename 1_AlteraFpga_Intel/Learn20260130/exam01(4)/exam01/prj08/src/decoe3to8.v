module			decoe3to8
(
				//
				input			clk,//译码器采样时钟
				input			rst_n,//译码器复位，低电平有效
				
				//译码器输入
				input[2:0]		code,//译码输入
				
				//译码器输出
				output reg[7:0]	decoe//译码输出
);
//普通译码器，虽然为普通译码器，但是也实现了全译码，最终为全译码器
reg		[7:0]	decoe_tmp   	;
always 			@(*)
				case(code)
					3'b000:decoe_tmp   =   8'b00000001;
					3'b001:decoe_tmp   =   8'b00000010;
					3'b010:decoe_tmp   =   8'b00000100;
					3'b011:decoe_tmp   =   8'b00001000;
					3'b100:decoe_tmp   =   8'b00010000;
					3'b101:decoe_tmp   =   8'b00100000;
					3'b110:decoe_tmp   =   8'b01000000;
					3'b111:decoe_tmp   =   8'b10000000;
				endcase


//全译码器，最终为全译码
/*
always 			@(*)
				case(code)
					3'b000:decoe_tmp   =   8'b00000001;
					3'b001:decoe_tmp   =   8'b00000010;
					3'b010:decoe_tmp   =   8'b00000100;
					3'b011:decoe_tmp   =   8'b00001000;
					3'b100:decoe_tmp   =   8'b00010000;
					3'b101:decoe_tmp   =   8'b00100000;
					3'b110:decoe_tmp   =   8'b01000000;
					3'b111:decoe_tmp   =   8'b10000000;
					default:decoe_tmp  =   8'b00000000;
				endcase	
*/

always			@(posedge		clk			or			negedge		rst_n	)	
				if(rst_n==1'b0)
						decoe   <=    8'd0;
				else 
						decoe   <=    decoe_tmp;
						
endmodule 