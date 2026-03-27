module sale_auto_3
(
				//系统相关
				input clk,   //系统时钟，50MHz
				input rst_n, //系统复位，默认低电平有效
				//传感器输入信号
				input s0_i,   //0.5元硬币投币，通过按键模拟
				input s1_i,   //1元硬币投币，通过按键模拟
				//出货找零信号
				output led_sale, //当出货的时候led点亮10s
				output led_z0ps //当找零的时候led点亮10s
);
/*
total:
001:0.5元
010:1元
011:1.5元
100：2


*/

reg S0_o1, S0_o2;

always @(posedge clk) begin
           S0_o1 <=    s0_i;
		   S0_o2 <=    S0_o1;
end
wire f_s0_0;
assign  f_s0_0 = {S0_o2,S0_o1} == 2'b10 ?  1'b1 : 1'b0;

reg S1_o1, S1_o2;

always @(posedge clk) begin
           S1_o1 <=    s0_i;
		   S1_o2 <=    S1_o1; 
end
wire f_s1_0;
assign  f_s1_0 = {S1_o2,S1_o1} == 2'b10 ?  1'b1 : 1'b0;



wire s0,s1;

assign s0 = ~s0_i;
assign s1 = ~s1_i;

reg s1_temp,s0_temp;
reg[2:0] total,total_tmep;
always   @(posedge clk)begin
    s1_temp <= s1;
    s0_temp <= s0;
	total_tmep <= total;
end

localparam  ML_INPUT       = 2'd0,
            ML_INPUT_OFF   = 2'd1,
		    ML_0p5		   = 2'd2,
		    ML_1	       = 2'd3;


reg [1:0] state_cs,state_ns;
///第一段
always  @(posedge clk or negedge rst_n)
        if(rst_n == 1'b0)
		    state_cs    <= ML_INPUT;
		else
		    state_cs <= state_ns;

///第二段
always  @(*) begin
        state_ns = ML_INPUT;
		case(state_cs)
			ML_INPUT: if(f_s0_0 | f_s1_0)
							state_ns = ML_INPUT_OFF;
					  else
							state_ns = ML_INPUT;
			ML_0p5  : if(f_s0_0 | f_s1_0)
				      		state_ns = ML_INPUT_OFF;
				      else
				      		state_ns = ML_0p5;
			ML_1    : if(f_s0_0 | f_s1_0)
				      		state_ns = ML_INPUT_OFF;
				      else
				      		state_ns = ML_1;
			ML_INPUT_OFF  : if({f_s0_0 | f_s1_0} == 2'b00)
								case(total_tmep)
									3'b001:state_ns = ML_0p5;
									3'b010:state_ns = ML_1;
									3'b011:state_ns = ML_INPUT;
									3'b100:state_ns = ML_INPUT;
								    default:state_ns = ML_INPUT;
								endcase
							else
							    state_ns = ML_INPUT_OFF;
			         default: state_ns = ML_INPUT;
			endcase
end
			
			
always  @(posedge clk or negedge rst_n)
        if(rst_n == 1'b0)
		    total    <= 3'b000;
		else case(state_ns)
			ML_INPUT        : case({s1,s0})
									2'b01:total <= 3'b001;
									2'b10:total <= 3'b010;
									default:total <= 3'b000;
							  endcase
			ML_0p5		    :case({s1,s0})
									2'b01:total <= 3'b010;
									2'b10:total <= 3'b011;
									default:total <= total;
							  endcase
			ML_1	        :case({s1,s0})
									2'b01:total <= 3'b011;
									2'b10:total <= 3'b100;
									default:total <= total;
							  endcase
			default				:total <= total;
		endcase
			
///第三段状态输出           


reg led_sale_temp,led_z0ps_temp;
always  @(posedge clk or negedge rst_n)
            if(rst_n == 1'b0)begin
			     led_sale_temp <= 1'b0;
			     led_z0ps_temp <= 1'b0;
			end else if((state_ns == ML_INPUT_OFF)&({s1,s0} == 2'b00))
			      case(total)
				      3'b011:begin led_sale_temp <=1'b1; led_z0ps_temp <= 1'b0;  end
					  3'b100:begin led_sale_temp <=1'b1; led_z0ps_temp <= 1'b1;  end
					  default: begin led_sale_temp <=1'b0; led_z0ps_temp <= 1'b0;  end
                  endcase
		    else begin
			      led_sale_temp <=1'b0;
				  led_z0ps_temp <= 1'b0;
			end

////////////点亮led灯/////////

reg [29:0]   cnt0,cnt1;

always  @(posedge clk or negedge rst_n)
            if(rst_n == 1'b0)
			     cnt0 <= 30'd0;
		    else if(led_sale_temp)
			     cnt0 <= cnt0 + 1'b1;
		    else if(cnt0 > 0 && cnt0 < 30'd500000000)
			     cnt0 <= cnt0 + 1'b1;
		    else 
			     cnt0 <= 30'd0;

always  @(posedge clk or negedge rst_n)
            if(rst_n == 1'b0)
			     cnt1 <= 30'd0;
		    else if(led_z0ps_temp)
			     cnt1 <= cnt1 + 1'b1;
		    else if(cnt1 > 1'b0 && cnt1 < 30'd500000000)
			     cnt1 <= cnt1 + 1'b1;
		    else
			     cnt1 <= 30'd0;
		    

assign led_sale = cnt0>0 ? 1'b0:1'b1;
assign led_z0ps = cnt1>0 ? 1'b0:1'b1;

endmodule