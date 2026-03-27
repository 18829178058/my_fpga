module		memery
(
			output      [7:0]	rddata,//表示存储器读数据
			input		[7:0]	addr//表示存储器读地址
);
reg			[7:0]        		mem   			[255:0];//定义了256个寄存器，相当与存储器，可以存放256个数据，每个数据为8位


assign 							rddata   		=   mem[addr];


//通过for   循环对mem存储器原型进行初始化



integer  						i;//定义循环变量,默认为整数类型的循环变量
reg	[7:0]						mem_data_i;
initial  begin 
mem_data_i									  =  0;  						
for(i=0;i<=255;i=i+1)  		begin 
									mem[i]     =    mem_data_i;//{$random}%256; 该系统任务quartuss ii 综合器不能准确识别
									mem_data_i = mem_data_i  +  1;
end
									
end


always 						   @(*)
							      $display("memery=%h",rddata);
            

endmodule 