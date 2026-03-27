module	sort4
(
	input [3:0] a, b, c, d,
	output reg [3:0] ra, rb, rc, rd
);

	reg [3:0] va, vb, vc, vd;
	
	
	always @ (a or b or c or d)
		begin
			{va, vb, vc, vd} = {a, b, c, d};
			sort2(va, vd);
			sort2(vb, vd);
			sort2(vc, vd);
			sort2(va, vc);
			sort2(vb, vc);
			sort2(va, vb);
			{ra, rb, rc, rd} = {va, vb, vc, vd};
		end


		task sort2(inout [3:0] x, y);   //x与y的变量内容互换，要求顺序执行，则采用阻塞赋值方式
			reg [3:0] temp;
			if(x > y)
				begin
					temp = x;
					x = y;
					y = temp;
				end
			else
				begin
					x = x;
					y = y;
				end
				
		endtask
endmodule