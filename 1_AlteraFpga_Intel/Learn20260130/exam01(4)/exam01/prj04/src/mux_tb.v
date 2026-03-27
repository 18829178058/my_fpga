`timescale 1ns/1ns
module				mux_tb;
//激励信号
reg					clk,rst_n;
initial				begin
					clk   =0;
					rst_n =1;
					#53   rst_n =0;

end
always 				#2  	clk=~clk;



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
wire   [7:0]  		d3;	
wire   [7:0]  		d4;	
wire   [7:0]  		d5;	
wire   [7:0]  		d6;	
wire   [7:0]  		d7;	
wire   [7:0]  		d8;	
wire   [7:0]  		d9;		

mux					mux_ins
(		
					.clk(clk),
					.rst_n(rst_n),
					.a(a),
					.b(b),
					.c(c),
					.sel(sel),
					.d0(d0),
					.d1(d1),
					.d2(d2),
					.d3(d3),
					.d4(d4),
					.d5(d5),
					.d6(d6),
					.d7(d7),
					.d8(d8),
					.d9(d9)
);
endmodule 