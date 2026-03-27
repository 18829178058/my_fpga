module	seg_driver
(
	input clk,					//系统时钟
	input rst_n,				//系统复位
	//input [23:0] data,			//需要译码的数据
	
	output reg [2:0] sel,		//片选信号
	output reg [7:0] seg		//段选信号
);

	
	parameter	CNT_MAX	=	50_000;		//1ms，数码管轮流显示时间间隔
	parameter	data = 24'h123456;
	
	
	localparam ZERO		=	7'b100_0000,
			   ONE		=	7'b111_1001,
			   TWO		=	7'b010_0100,
			   THREE	=	7'b011_0000,
			   FOUR		=	7'b001_1001,
			   FIVE		=	7'b001_0010,
			   SIX		=	7'b000_0010,
			   SEVEN	=	7'b111_1000,
			   EIGHT	=	7'b000_0000,
			   NINE		=	7'b001_0000;
//---------------------------内部变量定义-----------------------------  
	
	reg [15:0]	cnt_time;
	wire		add_cnt_time;
	wire 		end_cnt_time;

	reg [3:0]	temp_data;
	reg 		dot;
	
//---------------------------计数器-----------------------------  

	always@ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			cnt_time <= 16'd0;
		else
			if(add_cnt_time)
				if(end_cnt_time)
					cnt_time <= 16'd0;
				else
					cnt_time <= cnt_time + 1'b1;
			else
				cnt_time <= cnt_time;
	end
	
	assign add_cnt_time = 1'b1;
	assign end_cnt_time = add_cnt_time && cnt_time == CNT_MAX - 1'b1;
	
//---------------------------片选信号----------------------------- 
	always@ (posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			sel	<=	3'b000;
		else
			if(end_cnt_time)
				if(sel < 6)
					sel <= sel	+	1'b1;
				else
					sel <= 3'b0;
			else
				sel <=	sel;
	end

//temp_data
	always@ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					temp_data <=	4'd0;    //开始都为0
					dot	<= 1'b1;			 //1为灭
				end
			else
				case(sel)
					0	:	begin temp_data	<=	data[23:20]; dot	<=	1'b1; end
					1	:	begin temp_data	<=	data[19:16]; dot	<=	1'b1; end
					2	:	begin temp_data	<=	data[15:12]; dot	<=	1'b1; end
					3	:	begin temp_data	<=	data[11:8]; dot	<=	1'b1; end
					4	:	begin temp_data	<=	data[7:4]; dot	<=	1'b1; end
					5	:	begin temp_data	<=	data[3:0]; dot	<=	1'b1; end
					default:;
				endcase
		
		end

//---------------------------段选信号----------------------------- 
//sel
	always@ (posedge clk or negedge rst_n)
		begin
			if(!rst_n)
				begin
					seg	<=	8'b0;
				end
			else
				case(temp_data)
					0	:	seg <=	{dot,ZERO};
					1	:	seg <=	{dot,ONE};
					2	:	seg <=	{dot,TWO};
					3	:	seg <=	{dot,THREE};
					4	:	seg <=	{dot,FOUR};
					5	:	seg <=	{dot,FIVE};
					6	:	seg <=	{dot,SIX};
					7	:	seg <=	{dot,SEVEN};
					8	:	seg <=	{dot,EIGHT};
					9	:	seg <=	{dot,NINE};
					default:	seg <= 8'b0;
				endcase
		end

endmodule