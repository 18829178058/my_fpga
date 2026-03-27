module  seven_segment_display //七段数码显示
(
   input clk,
   input rst_n,
   output reg [2:0] sel,
   output reg [7:0] sevenSegmentOut
);

function  [7:0] covertFunction;
    input [3:0] nums;
	case(nums)
	    0:covertFunction = 8'b1100_0000;
		1:covertFunction = 8'b1111_1001;
		2:covertFunction = 8'b1010_0100;
		3:covertFunction = 8'b1011_0000;
		4:covertFunction = 8'b1001_1001;
		5:covertFunction = 8'b1001_0010;
		6:covertFunction = 8'b1000_0010;
		7:covertFunction = 8'b1111_1000;
		8:covertFunction = 8'b1000_0000;
		9:covertFunction = 8'b1001_0000;
	    default:covertFunction = 8'b0000_0000;
	endcase
endfunction


reg [28:0]  cnt_1s;

always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin  //复位时初始化各参数
	    sel <= 3'b000;
		sevenSegmentOut <= 8'b0000_0000;
		cnt_1s <= 29'd0;
	end else if(cnt_1s == 29'd500_000_000) begin  //10s时重置，开始新的循环
		sel <= 3'b000;
		sevenSegmentOut <= 8'b0000_0000;
		cnt_1s <= 29'd0;
	end else begin
        sevenSegmentOut <= covertFunction(cnt_1s/29'd50_000_000);
		cnt_1s <= cnt_1s + 1'b1;
   end
end

endmodule