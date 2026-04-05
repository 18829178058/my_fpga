module AsyncFIFO
	#(parameter ASIZE = 4, //地址位宽
	  parameter DSIZE = 8) //数据位宽
	(
		input [DSIZE-1:0] wdata,
		input winc, wclk, wrst_n, //写指示信号，写时钟，写复位
		input rinc, rclk, rrst_n, //读指示信号，读时钟，读复位
		output reg [DSIZE-1:0] rdata,
		output reg wfull,
		output reg rempty
	);
		wire [ASIZE-1:0] waddr ;
		wire [ASIZE-1:0] raddr ;
		reg [ASIZE:0] wptr ;
		reg [ASIZE:0] rptr ;
		reg [ASIZE:0] wq2_rptr ;
		reg [ASIZE:0] rq2_wptr ;
	/************************************************************
	* In order to perform FIFO full and FIFO empty tests using 
	* this FIFO style, the read and write pointers must be
	* passed to the opposite clock domain for pointer comparison
	*************************************************************/
	//在检测“满”或“空”状态之前，需要将指针同步到其它时钟域时，使用格雷码，可以降低同步过程中亚稳态出现的概率	
	reg [ASIZE:0] wq1_rptr;
	
	always @(posedge wclk or negedge wrst_n)
		if (!wrst_n)
			{wq2_rptr,wq1_rptr} <= 0;
		else
			{wq2_rptr,wq1_rptr} <= {wq1_rptr,rptr};// rptr读指针
	
	reg [ASIZE:0] rq1_wptr;
	
	always @(posedge rclk or negedge rrst_n)
		if (!rrst_n)
			{rq2_wptr,rq1_wptr} <= 0;
		else
			{rq2_wptr,rq1_wptr} <= {rq1_wptr,wptr};// wptr写指针

	/*
	* DualRAM 
	*/

	localparam RAM_DEPTH = 1 << ASIZE; //RAM 深度 = 2^ADDR_WIDTH
	reg [DSIZE-1:0] Mem[RAM_DEPTH-1:0];
	
	always@(posedge wclk) begin
		if(winc)
			Mem[waddr] <= wdata;
		end
		
	always @(posedge rclk or negedge rrst_n)
		if (!rrst_n)
			rdata <= 0;
		else
			if(rinc)
				rdata <= Mem[raddr];
			else
				rdata <= 0;

	/*
	* 空、满比较逻辑
	*/

	reg [ASIZE:0] rbin;
	wire [ASIZE:0] rgraynext, rbinnext;
	wire rempty_val;
	
	//-------------------
	// GRAYSTYLE2 pointer: gray 码读地址指针
 //-------------------
	always @(posedge rclk or negedge rrst_n) begin
		if (!rrst_n) begin
			rbin <= 0;
			rptr <= 0;
			end
		else begin
			rbin <= rbinnext ;
			rptr <= rgraynext;
			end
	end
	
	// gray 码计数逻辑
	assign rbinnext = !rempty ? (rbin + rinc) : rbin;
	assign rgraynext = (rbinnext>>1) ^ rbinnext; //二进制到 gray 码的转换
	assign raddr = rbin[ASIZE-1:0];
	
	//---------------------------------------------------------------
	// FIFO empty when the next rptr == synchronized wptr or on reset
	//---------------------------------------------------------------
	/*
	* 读指针是一个 n 位的 gray 码计数器，比 FIFO 寻址所需的位宽大一位
	* 当读指针和同步过来的写指针完全相等时(包括 MSB)，说明二者折回次数一致,FIFO 为空
	* 
	*/
	assign rempty_val = (rgraynext == rq2_wptr);
	
	always @(posedge rclk or negedge rrst_n)
		if (!rrst_n)
			rempty <= 1'b1;
		else
			rempty <= rempty_val;
	
	
//	wptr_full
	
	reg [ASIZE:0] wbin;
	wire [ASIZE:0] wgraynext, wbinnext;
	wire wfull_val;
	
	// GRAYSTYLE2 pointer
	always @(posedge wclk or negedge wrst_n) begin
		if (!wrst_n) begin
			wbin <= 0;
			wptr <= 0;
		end
	else begin
		wbin <= wbinnext;
		wptr <= wgraynext;
		end
	end
	
	//gray 码计数逻辑 
	assign wbinnext = !wfull ? wbin + winc : wbin;
	assign wgraynext = (wbinnext>>1) ^ wbinnext;
	assign waddr = wbin[ASIZE-1:0];
	/*由于满标志在写时钟域产生，因此比较安全的做法是将读指针同步到写时钟域*/
	
	/**/
	//------------------------------------------------------------------
	// Simplified version of the three necessary full-tests:
	// assign wfull_val=((wgnext[ASIZE] !=wq2_rptr[ASIZE] ) &&
	// (wgnext[ASIZE-1] !=wq2_rptr[ASIZE-1]) &&
	// (wgnext[ASIZE-2:0]==wq2_rptr[ASIZE-2:0]));
	//------------------------------------------------------------------
	assign wfull_val = (wgraynext=={~wq2_rptr[ASIZE:ASIZE-1],wq2_rptr[ASIZE-2:0]});

	always @(posedge wclk or negedge wrst_n) begin
		if (!wrst_n)
			wfull <= 1'b0;
		else
			wfull <= wfull_val;
		end

endmodule

	


	
