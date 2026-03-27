`timescale 1ns/1ns
module			memery_tb;
wire      [7:0]	rddata;//表示存储器读数据
reg		[7:0]	addr;//表示存储器读地址
initial			begin
				#		   200			;
				addr   =   {$random}%256;
				
				#		   200			;
				addr   =   {$random}%256;
				
				#		   200			;
				addr   =   {$random}%256;
				
				#		   200			;
				addr   =   {$random}%256;
				
				
				#		   200			;
				addr   =   {$random}%256;
				
				
				#		   200			;
				addr   =   {$random}%256;
				
				#		   200			;
				$stop					;
				
				
end
memery		memery_ins
(
			.rddata(rddata),//表示存储器读数据
			.addr(addr)//表示存储器读地址
);
endmodule 