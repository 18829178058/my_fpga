//音乐播放器
module music_player(
			input 	clk_in,  	 //系统时钟
			input 	rst_n,  	 //系统复位
			input   keySwitch,   //按键切换歌曲
			input   keyPause,   //按键暂停歌曲
			output 	reg beezer  	 //蜂鸣器控制输出
	);

/*======内部变量======*/
reg [5:0]	cnt_num;		//音符个数计数器
wire		add_cnt_num;
wire		end_cnt_num;

reg [23:0]	cnt_time;		//一拍时间计数器
wire		add_cnt_time;
wire		end_cnt_time;

reg [19:0]	cnt_freq;		//音频频率计数器   3816*262
wire		add_cnt_freq;
wire		end_cnt_freq;

reg [19:0]  freq;			//中间信号，存放当前音符频率
wire [18:0]  duty;			//中间信号，比较产生50%占空比

wire [5:0]	NUM	;				//音符个数
assign NUM = (beep_switch_en == 1'b1) ? 6'd34 : 6'd28;

reg beep_pause_en;
reg beep_switch_en;

/*======参数======*/
parameter	CLCK	=	26'd50_000_000;		//系统时钟，50MHz
parameter   TIME	=	24'd50_000_000;		//一拍时间


parameter  	DOL		=	CLCK/262, //低音
			REL		=	CLCK/294,
			MIL		=	CLCK/330,
			FAL		=	CLCK/349,
			SOL		=	CLCK/392,
			LAL		=	CLCK/440,
			SIL		=	CLCK/494,
			DOM		=	CLCK/523,//中音
			REM		=	CLCK/587,
			MIM		=	CLCK/659,
			FAM		=	CLCK/698,
			SOM		=	CLCK/784,
			LAM		=	CLCK/880,
			SIM		=	CLCK/988,
			DOH		=	CLCK/1047,//高音
			REH		=	CLCK/1175,
			MIH		=	CLCK/1319,
			FAH		=	CLCK/1397,
			SOH		=	CLCK/1568,
			LAH		=	CLCK/1760,
			SIH		=	CLCK/1967;

wire keySwitch_out;
wire keyPause_out;

//切换歌曲按键消抖
key_delate key_delate_inst1( .clk(clk_in),               //系统时钟，默认50MHz
							.rst_n(rst_n),             //系统复位，低电平有效
							.s_i(keySwitch),               //按键输入
							.s_o(keySwitch_out));      //按键消抖后输出)


//暂停歌曲按键消抖
key_delate key_delate_inst2( .clk(clk_in),               //系统时钟，默认50MHz
							.rst_n(rst_n),             //系统复位，低电平有效
							.s_i(keyPause),               //按键输入
							.s_o(keyPause_out));      //按键消抖后输出)


////////////边沿检测///////////////////////////////////////////
//检测切换按键使能
reg				keySwitch_out_temp1,	keySwitch_out_temp2;
always 			@(posedge		clk_in)begin
				keySwitch_out_temp1  <=keySwitch_out;
				keySwitch_out_temp2  <= keySwitch_out_temp1;	
end
wire			keySwitch_out_final;
assign 			keySwitch_out_final  =   ({keySwitch_out_temp2, keySwitch_out_temp1}==2'b10)  ? 1'b0:1'b1;

//检测暂停按键使能
reg				keyPause_out1,	keyPause_out2 ;	
always 			@(posedge		clk_in)begin
				keyPause_out1 <= keyPause_out;
				keyPause_out2 <= keyPause_out1;
end		

wire			keyPause_out_final;
assign 			keyPause_out_final  =   ({keyPause_out2,keyPause_out1}==2'b10) ? 1'b0:1'b1;

//按键在一瞬间被置为0，然后恢复，所以当检测到有按键被按下需要置使能
//暂停使能
always @ (posedge clk_in or negedge rst_n)
	begin
		if(!rst_n)
			begin
				beep_pause_en <= 1;
			end
		else
			if(keyPause_out_final == 0)
				beep_pause_en <= ~beep_pause_en;
			else
				beep_pause_en <= beep_pause_en;
			
	end

//切换使能
always @ (posedge clk_in or negedge rst_n)
	begin
		if(!rst_n)
			begin
				beep_switch_en <= 1;
			end
		else
			if(keySwitch_out_final == 0)
				beep_switch_en <= ~beep_switch_en;
			else
				beep_switch_en <= beep_switch_en;
			
	end



//250ms计数器
always@(posedge clk_in or negedge rst_n)
	begin
		if(!rst_n)
			cnt_time <= 1'b0;
		else
			begin
				if(add_cnt_time)
					if(end_cnt_time)
						cnt_time <= 1'b0;
					else
						cnt_time <= cnt_time + 1'b1;
				else
					cnt_time <= cnt_time;
			end
	end

	assign add_cnt_time = beep_pause_en;
	assign end_cnt_time = add_cnt_time && cnt_time == TIME - 1;

//音符个数计数器
always@(posedge clk_in or negedge rst_n)
	begin
		if(!rst_n)
			cnt_num <= 1'b0;
		else
			begin
				if(add_cnt_num)
					if(end_cnt_num)
						cnt_num <= 1'b0;
					else
						cnt_num <= cnt_num + 1'b1;
				else
					cnt_num <= cnt_num;
			end
	end

assign add_cnt_num = end_cnt_time;
assign end_cnt_num = add_cnt_num && cnt_num == NUM - 1'b1;


//音符频率计数器
always@(posedge clk_in or negedge rst_n)
	begin
		if(!rst_n)
			cnt_freq <= 1'b0;
		else
			begin
				if(add_cnt_freq)
					if(end_cnt_freq || end_cnt_time)
						cnt_freq <= 1'b0;
					else
						cnt_freq <= cnt_freq + 1'b1;
				else
					cnt_freq <= cnt_freq;
			end
	end
	
	assign add_cnt_freq = beep_pause_en;
	assign end_cnt_freq = add_cnt_freq && cnt_freq == freq - 1'b1;

/*音符赋值*/
	always@ (*)
			if(beep_switch_en == 1'b0)
				begin		
					case(cnt_num)
						6'd0   :   freq  =	DOH;
						6'd1   :   freq  =	DOH;
						6'd2   :   freq  =	SOH;
						6'd3   :   freq  =	SOH;
						6'd4   :   freq  =	LAH;
						6'd5   :   freq  =	LAH;
						6'd6   :   freq  =	SOH;
											
						6'd7   :   freq  =	FAH;
						6'd8   :   freq  =	FAH;
						6'd9   :   freq  =	MIH;
						6'd10  :   freq  =	MIH;
						6'd11  :   freq  =	REH;
						6'd12  :   freq  =	REH;
						6'd13  :   freq  =	DOH;
											
						6'd14  :   freq  =	SOH;
						6'd15  :   freq  =	SOH;
						6'd16  :   freq  =	FAH;
						6'd17  :   freq  =	FAH;
						6'd18  :   freq  =	MIH;
						6'd19  :   freq  =	MIH;
						6'd20  :   freq  =	REH;
											
						6'd21  :   freq  =	SOH;
						6'd22  :   freq  =	SOH;
						6'd23  :   freq  =	FAH;
						6'd24  :   freq  =	FAH;
						6'd25  :   freq  =	MIH;
						6'd26  :   freq  =	MIH;
						6'd27  :   freq  =	REH;
						default: freq  = 0;
						endcase
				end
			else 
				begin		
					case(cnt_num)
						6'd0   :   freq  =	DOM;
						6'd1   :   freq  =	REM;
						6'd2   :   freq  =	MIM;
						6'd3   :   freq  =	DOM;
						6'd4   :   freq  =	DOM;
						6'd5   :   freq  =	REM;
						6'd6   :   freq  =	MIM;
						6'd7   :   freq  =	DOM;
						6'd8   :   freq  =	MIM;
						6'd9   :   freq  =	FAM;
						6'd10  :   freq  =	SOM;
						6'd11  :   freq  =	MIM;
						6'd12  :   freq  =	FAM;
						6'd13  :   freq  =	SOM;
						6'd14  :   freq  =	SOM;
						6'd15  :   freq  =	LAM;
						6'd16  :   freq  =	SOM;
						6'd17  :   freq  =	FAM;
						6'd18  :   freq  =	MIM;
						6'd19  :   freq  =	DOM;
						6'd20  :   freq  =	SOM;
						6'd21  :   freq  =	LAM;
						6'd22  :   freq  =	SOM;
						6'd23  :   freq  =	FAM;
						6'd24  :   freq  =	MIM;
						6'd25  :   freq  =	DOM;
						6'd26  :   freq  =	REM;
						6'd27  :   freq  =	SOL;
						6'd28  :   freq  =	DOM;
						6'd29  :   freq  =	0;
						6'd30  :   freq  =	REM;
						6'd31  :   freq  =	SOL;
						6'd32  :   freq  =	DOM;
						6'd33  :   freq  =	0;
						default: freq  = 0;
						endcase
					end
		
/*输出赋值*/	

always@(posedge clk_in, negedge rst_n)
	begin
		if(!rst_n)
			beezer <= 1'b1;
		else
			if(cnt_freq < duty  && beep_pause_en)
				beezer <= 1'b0;
			else
				beezer <= 1'b1;
	end

assign duty = freq >> 1;//除以2，置占空比为50%

endmodule

