module lut_xor (
    input  a,
	input  b,
    output  wire c
);
  
  wire temp_1;
  wire temp_2;
  wire temp_3;
  wire temp_4;
//  wire temp_5;
  
  
	lut_not not_inst
	(
	   .a(b),
	   .c(temp_1)
	);

	
    lut_and and_inst
	(
    .a(a),
	.b(temp_1),
    .c(temp_2)
	);
	
	lut_not not2_inst
	(
	   .a(a),
	   .c(temp_3)
	);
	
    lut_and and2_inst
	(
    .a(b),
	.b(temp_3),
    .c(temp_4)
	);
	
     lut_or or_inst
	 (
    .a(temp_2),
	.b(temp_4),
    .c(c)
	);
/*	
	always  @(*) begin
	$display(" lut_xor temp_1 = %d ", temp_1);
	$display(" lut_xor temp_2 = %d ", temp_2);
	$display(" lut_xor temp_3 = %d ", temp_3);
	$display(" lut_xor temp_4 = %d ", temp_4);
	$display(" lut_xor a = %d ", a);
	$display(" lut_xor b = %d ", b);
	$display(" lut_xor c = %d ", c);
	end
*/
endmodule