module bin_bcd
(
	input [11:0] bin,
	output reg [11:0] bcd
);

	always@(*)
		begin
			bcd[11:8]	=	bin/100;
			bcd[7:4]	=	(bin/10) % 10;
			bcd[3:0]	=	bin%10;
		end

endmodule