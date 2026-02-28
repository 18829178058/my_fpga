/*音乐播放器，PWM原理控制蜂鸣器输出音符*/
/*------------------端口定义-----------------*/
module	music_buzzer(clk, rst_n, beep);
	
	input clk, rst_n;
	
	output	reg	beep;

/*------------------内部变量-----------------*/
	reg	[5	: 0]	cnt_num;		//音符个数计数器
	wire				add_cnt_num;
	wire				end_cnt_num;
	
	reg	[24: 0]	cnt_time;	//一拍时间计数器
	wire				add_cnt_time;
	wire				end_cnt_time;
	
	reg	[19:0]	cnt_frq;		//音符频率计数器
	wire				add_cnt_frq;
	wire				end_cnt_frq;
	
	reg	[19:0]	frq;			//中间信号，存放当前音符频率
	wire	[18:0]	duty;			//中间信号，比较50%占空比
	
/*------------------参数定义-----------------*/
	parameter	CYCLE	=	26'd50_000_000;	//系统时钟，50MHZ
	parameter	TIME	=	25'd25_000_000;	//一拍时间
	parameter	NUM	=	6'd34;				//音符个数
	parameter	DOL	=	CYCLE/262		,	//低音音符
					REL	=	CYCLE/294		,
					MIL	=	CYCLE/330		,
					FAL	=	CYCLE/349		,
					SOL	=	CYCLE/392		,
					LAL	=	CYCLE/440		,
					SIL	=	CYCLE/494		,
					
					DOM	=	CYCLE/523		,	//中音音符
					REM	=	CYCLE/587		,
					MIM	=	CYCLE/659		,
					FAM	=	CYCLE/698		,
					SOM	=	CYCLE/784		,
					LAM	=	CYCLE/880		,
					SIM	=	CYCLE/988		,
					
					DOH	=	CYCLE/1047		,	//高音音符
					REH	=	CYCLE/1175		,
					MIH	=	CYCLE/1319		,
					FAH	=	CYCLE/1397		,
					SOH	=	CYCLE/1568		,
					LAH	=	CYCLE/1760		,
					SIH	=	CYCLE/1967		;
					
/*------------------计数器------------------*/
//250ms计数器
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt_time <= 1'b0;
				end
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
	
	assign	add_cnt_time = 1'b1;//可以改为音乐暂停播放键
	assign	end_cnt_time = add_cnt_time && cnt_time == TIME - 1'b1;

//音符个数计数器
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt_num <= 1'b0;
				end
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
	
	assign	add_cnt_num = end_cnt_time;
	assign	end_cnt_num = add_cnt_num && cnt_num == NUM - 1'b1;
	
//音符频率计数器
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					cnt_frq <= 1'b0;
				end
			else
				if(add_cnt_frq)
					if(end_cnt_frq || end_cnt_time)
						cnt_frq <= 1'b0;
					else
						cnt_frq <= cnt_frq + 1'b1;
				else
					cnt_frq <= cnt_frq;
		end
	
	assign	add_cnt_frq = 1'b1;//可以改为音乐暂停播放键
	assign	end_cnt_frq = add_cnt_frq && cnt_frq == frq - 1'b1;
	
/*------------------音符赋值------------------*/
	always @ (*)
		begin
			case(cnt_num)
				6'd0		:	frq	=	DOM;
				6'd1		:	frq	=	REM;
				6'd2		:	frq	=	MIM;
				6'd3		:	frq	=	DOM;
				6'd4		:	frq	=	DOM;
				6'd5		:	frq	=	REM;
				6'd6		:	frq	=	MIM;	
				6'd7		:	frq	=	DOM;	
				6'd8		:	frq	=	MIM;	
				6'd9		:	frq	=	FAM;	
				6'd10		:	frq	=	SOM;	
				6'd11		:	frq	=	MIM;
				6'd12		:	frq	=	FAM;	
				6'd13		:	frq	=	SOM;	
				6'd14		:	frq	=	SOM;	
				6'd15		:	frq	=	LAM;	
				6'd16		:	frq	=	SOM;	
				6'd17		:	frq	=	FAM;	
				6'd18		:	frq	=	MIM;	
				6'd19		:	frq	=	DOM;	
				6'd20		:	frq	=	SOM;	
				6'd21		:	frq	=	LAM;	
				6'd22		:	frq	=	SOM;	
				6'd23		:	frq	=	FAM;	
				6'd24		:	frq	=	MIM;	
				6'd25		:	frq	=	DOM;	
				6'd26		:	frq	=	REM;	
				6'd27		:	frq	=	SOL;	
				6'd28		:	frq	=	DOM;	
				6'd29		:	frq	=	0;
				6'd30		:	frq	=	REM;
				6'd31		:	frq	=	SOL;
				6'd32		:	frq	=	DOM;
				6'd33		:	frq	=	0;
				
				default	:	frq	=	0;
			endcase
		end
		
/*------------------输出赋值-----------------*/
//beep
	always @ (posedge clk, negedge rst_n)
		begin
			if(!rst_n)
				begin
					beep <= 1;
				end
			else
				if(cnt_frq < duty )
					beep <= 1'b0;
				else
					beep <= 1'b1;
		end
		
//生成一段50%占空比的PWM方波比较信号
	assign	duty = frq >> 1;
	
endmodule 