module fifo_rd
(
	input clk,
	input rst_n,
	input rd_empty,  			//空满信号
	input rd_full,
	output reg rd_req
);

	
	reg state;
	parameter	FULL 	=	1'b0,		//检测满信号状态
				EMPTY 	=	1'b1;		//检测空信号状态


	always@(posedge clk or negedge rst_n)
	begin
		if(!rst_n)
			begin
				rd_req <= 1'b0;
				state <= FULL;
			end
		else
			case(state)
				FULL:	begin
							if(rd_full)
								state <= EMPTY;   //fifo已满，开始读
							else
								state <= FULL;	  //等待空
						end
				EMPTY:	begin
							if(rd_empty)
								begin
									rd_req <= 1'b0;		//fifo已空，停止读
									state <= FULL;
								end
							else
								begin
									rd_req <= 1'b1;		//fifo未空，继续读
									state <=EMPTY;
								end
				
						end
				default:state <= 0;
		endcase
	end

endmodule