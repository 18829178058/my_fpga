module	mux2_1
(
	input [7:0] q1,
	input [7:0] q2,
	input data_sel,
	output reg [7:0] q
);
	always @ (*)
		begin
			case(data_sel)
				0 :	q = q1;
				1 :	q = q2;
				default :	;
			endcase
		end
endmodule