module decode_3to8
(
	input clk,    //译码器采样时钟
	input rst_n,
    input [2:0] code,
	output reg [7:0] decode
);

reg [7:0] decode_temp;

//普通译码器，最终为全译码
always @(*) begin
        case(code)
        3'b000 : decode_temp = 8'b0000_0001;
		3'b001 : decode_temp = 8'b0000_0010;
		3'b010 : decode_temp = 8'b0000_0100;
		3'b011 : decode_temp = 8'b0000_1000;
		3'b100 : decode_temp = 8'b0001_0000;
		3'b101 : decode_temp = 8'b0010_0000;
		3'b110 : decode_temp = 8'b0100_0000;
		3'b111 : decode_temp = 8'b1000_0000;
		endcase
end

/*
//全译码器，最终为全译码
always @(*) begin

        if(rs == 0)
		   d = 8'b0000_0000;

        $display("temp_1 = %d", temp_1);
        case(code)
        3'b000 : decode = 8'b0000_0001;
		3'b001 : decode = 8'b0000_0010;
		3'b010 : decode = 8'b0000_0100;
		3'b011 : decode = 8'b0000_1000;
		3'b100 : decode = 8'b0001_0000;
		3'b101 : decode = 8'b0010_0000;
		3'b110 : decode = 8'b0100_0000;
		3'b111 : decode = 8'b1000_0000;
		default: decode = 8'b0000_0000;
		endcase
end
*/

always   @(posedge clk or negedge rst_n)
begin
     if(rst_n == 1'b0)
	       decode <= 8'b0;
	 else
	       decode <= decode_temp;
end

endmodule