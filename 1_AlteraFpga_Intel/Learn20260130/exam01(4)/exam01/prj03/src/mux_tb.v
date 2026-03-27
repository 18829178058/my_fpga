module				mux_tb;
//激励信号
reg	  [7:0]  		a;
reg   [7:0]  		b;
reg   [7:0]  		c;
reg	  [1:0]			sel;
initial				begin
					#200							;
					sel				=		   2'b00;
					a				=  {$random}%256;
					b				=  {$random}%256;
					c				=  {$random}%256;
					
					#200							;
					
					sel				=		   2'b01;
					a				=  {$random}%256;
					b				=  {$random}%256;
					c				=  {$random}%256;
					
					#200							;
					sel				=		   2'b10;
					a				=  {$random}%256;
					b				=  {$random}%256;
					c				=  {$random}%256;
					
					#200							;
					sel				=		   2'b11;
					a				=  {$random}%256;
					b				=  {$random}%256;
					c				=  {$random}%256;
					
					#200							;
					$stop							;
					
					
end						
//响应信号
wire  [7:0]  		d0;
wire  [7:0]  		d1;
wire   [7:0]  		d2;	

mux					mux_ins
(		
					.a(a),
					.b(b),
					.c(c),
					.sel(sel),
					.d0(d0),
					.d1(d1),
					.d2(d2)			

);
endmodule 