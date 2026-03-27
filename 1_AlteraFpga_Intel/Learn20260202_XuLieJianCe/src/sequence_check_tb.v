`timescale   1ns/1ns
module sequence_check_tb;

      reg  clk;         //系统时钟，默�?50MHz
      reg  rst_n;    	//系统复位，低电平有效
		

	  
	  
initial begin
       clk    = 1'b0;
	   rst_n  = 1'b0;
	   #53 
       rst_n  = 1'b1;
end
	  
always	  #10 clk = ~clk;

wire  seq_i;       //随机待检测序�?
reg  [7:0] data_radom;
	   
assign	  seq_i = data_radom[6]^data_radom[2];
	  
always    @(posedge clk or negedge rst_n)
          if(rst_n == 1'b0)
		      data_radom <= 8'd0;
		  else
		      data_radom <= {$random} % 256;


wire seq_o;       //当检测到10

sequence_check   sequence_check_inst
(
      .clk(clk),          //系统时钟，默�?50MHz
      .rst_n(rst_n),      //系统复位，低电平有效
      .seq_i(seq_i),      //随机待检测序�?
      .seq_o(seq_o)       //当检测到1011的时候程序输出一个clk周期的高电平，其余为低电�?
);

endmodule