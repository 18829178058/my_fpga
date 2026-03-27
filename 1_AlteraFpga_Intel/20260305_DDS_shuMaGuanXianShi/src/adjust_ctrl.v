//===================按键加减控制===============

//===================顶层端口声明===============
module	adjust_ctrl
(
	input clk,
	input rst_n,
	input key_sel,					//波形
	input key_a,					//幅度
	input key_f_add,				//频率加
	input key_f_sub,				//频率减
	
	output reg [2:0] wave_a,		//幅度值
	output reg [16:0] wave_f,		//频率值		
	output reg [1:0] wave_sel		//当前波形

);

//===================内部参数声明===============
parameter F_IDLE	=	100;	//频率初始值
parameter F_STEP	=	100;	//频率步进
parameter A_IDLE	=	1;		//幅度初始值
parameter A_STEP	=	1;		//幅度步进


//===================内部变量定义===============

reg	[16:0] wave_f1, wave_f2, wave_f3, wave_f4;	//四个波形分别寄存的频率
reg	[2:0] wave_a1, wave_a2, wave_a3, wave_a4;	//四个波形分别寄存的幅度

//===================频率加减===============
//wave_f1
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave_f1 <= F_IDLE;
	else
		if(wave_sel == 2'b00)
			if(key_f_add == 1)
				if(wave_f1 < 17'd99900)
					wave_f1 <= wave_f1 + F_STEP;
				else
					wave_f1 <=F_IDLE;
			else if(key_f_sub == 1)
					begin
						if(wave_f1 < F_IDLE)
							wave_f1 <= wave_f1 - F_STEP;
						else
							wave_f1 <= 17'd99900;
					end
			else
				wave_f1 <=wave_f1;
		else
			wave_f1 <=wave_f1;
end

//wave_f2
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave_f2 <= F_IDLE;
	else
		if(wave_sel == 2'b01)
			if(key_f_add == 1)
				if(wave_f2 < 17'd99900)
					wave_f2 <= wave_f2 + F_STEP;
				else
					wave_f2 <=F_IDLE;
			else if(key_f_sub == 1)
					begin
						if(wave_f2 < F_IDLE)
							wave_f2 <= wave_f2 - F_STEP;
						else
							wave_f2 <= 17'd99900;
					end
			else
				wave_f2 <=wave_f2;
		else
			wave_f2 <=wave_f2;
end

//wave_f3
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave_f3 <= F_IDLE;
	else
		if(wave_sel == 2'b10)
			if(key_f_add == 1)
				if(wave_f3 < 17'd99900)
					wave_f3 <= wave_f3 + F_STEP;
				else
					wave_f3 <=F_IDLE;
			else if(key_f_sub == 1)
					begin
						if(wave_f3 < F_IDLE)
							wave_f3 <= wave_f3 - F_STEP;
						else
							wave_f3 <= 17'd99900;
					end
			else
				wave_f3 <=wave_f3;
		else
			wave_f3 <=wave_f3;
end

//wave_f4
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave_f4 <= F_IDLE;
	else
		if(wave_sel == 2'b11)
			if(key_f_add == 1)
				if(wave_f4 < 17'd99900)
					wave_f4 <= wave_f4 + F_STEP;
				else
					wave_f4 <=F_IDLE;
			else if(key_f_sub == 1)
					begin
						if(wave_f4 < F_IDLE)
							wave_f4 <= wave_f4 - F_STEP;
						else
							wave_f4 <= 17'd99900;
					end
			else
				wave_f4 <=wave_f4;
		else
			wave_f4 <=wave_f4;
end

//===================幅度加减===============
//wave_a1
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave_a1 <= A_IDLE;
	else
		if(wave_sel == 2'b00)
			if(key_a == 1)
				if(wave_a1 < 3'd5)
					wave_a1 <= wave_a1 + A_STEP;
				else
					wave_a1 <= A_IDLE;
			else
				wave_a1 <= wave_a1;
	else
		wave_a1 <= wave_a1;
end

//wave_a2
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave_a2 <= A_IDLE;
	else
		if(wave_sel == 2'b01)
			if(key_a == 1)
				if(wave_a2 < 3'd5)
					wave_a2 <= wave_a2 + A_STEP;
				else
					wave_a2 <= A_IDLE;
			else
				wave_a2 <= wave_a2;
	else
		wave_a2 <= wave_a2;
end

//wave_a3
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave_a3 <= A_IDLE;
	else
		if(wave_sel == 2'b10)
			if(key_a == 1)
				if(wave_a3 < 3'd5)
					wave_a3 <= wave_a3 + A_STEP;
				else
					wave_a3 <= A_IDLE;
			else
				wave_a3 <= wave_a3;
	else
		wave_a3 <= wave_a3;
end

//wave_a4
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave_a4 <= A_IDLE;
	else
		if(wave_sel == 2'b11)
			if(key_a == 1)
				if(wave_a4 < 3'd5)
					wave_a4 <= wave_a4 + A_STEP;
				else
					wave_a4 <= A_IDLE;
			else
				wave_a4 <= wave_a4;
	else
		wave_a4 <= wave_a4;
end

//===================波形切换===============
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave_sel <= 2'b00;
	else
		if(key_sel == 1)
			wave_sel <= wave_sel + 1;
		else
			wave_sel <=wave_sel;
end

//===================输出赋值===============
//wave_f
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave_f <= F_IDLE;
	else
		case(wave_sel)
			2'b00 :wave_f <= wave_f1;
			2'b01 :wave_f <= wave_f2;
			2'b10 :wave_f <= wave_f3;
			2'b11 :wave_f <= wave_f4;
			default: wave_f <= 2'b00;
		endcase
end

//wave_a
always@ (posedge clk or negedge rst_n)
begin
	if(!rst_n)
		wave_a <= A_IDLE;
	else
		case(wave_sel)
			2'b00 :wave_a <= wave_a1;
			2'b01 :wave_a <= wave_a2;
			2'b10 :wave_a <= wave_a3;
			2'b11 :wave_a <= wave_a4;
			default: wave_a <= 2'b00;
		endcase
end

endmodule