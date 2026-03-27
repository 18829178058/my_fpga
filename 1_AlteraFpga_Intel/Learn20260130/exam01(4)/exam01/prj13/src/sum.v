module			sum
(
				input  [7:0]		a,//加法器运算数a[7:0]
				input  [7:0]		b,//加法器运算数b[7:0]
				input				si,//加法器初始进位
				
				
				output [7:0]		sum,//加法器运算结果b[7:0]
				output 				so//加法器运算结进位输出
);
//第1个全加器/////////////////////////////////
wire			so0;	
full_sum		full_sum0_ins
(
				.a(a[0]),
				.b(b[0]),
				.si(si),
				
				
				.sum(sum[0])  ,
				.so(so0)
);
//第2个全加器/////////////////////////////////
wire			so1;	
full_sum		full_sum1_ins
(
				.a(a[1]),
				.b(b[1]),
				.si(so0),
				
				
				.sum(sum[1])  ,
				.so(so1)
);
//第3个全加器/////////////////////////////////
wire			so2;	
full_sum		full_sum2_ins
(
				.a(a[2]),
				.b(b[2]),
				.si(so1),
				
				
				.sum(sum[2])  ,
				.so(so2)
);
//第4个全加器/////////////////////////////////
wire			so3;	
full_sum		full_sum3_ins
(
				.a(a[3]),
				.b(b[3]),
				.si(so2),
				
				
				.sum(sum[3])  ,
				.so(so3)
);
//第5个全加器/////////////////////////////////
wire			so4;	
full_sum		full_sum4_ins
(
				.a(a[4]),
				.b(b[4]),
				.si(so3),
				
				
				.sum(sum[4])  ,
				.so(so4)
);
//第6个全加器/////////////////////////////////
wire			so5;	
full_sum		full_sum5_ins
(
				.a(a[5]),
				.b(b[5]),
				.si(so4),
				
				
				.sum(sum[5])  ,
				.so(so5)
);
//第7个全加器/////////////////////////////////
wire			so6;	
full_sum		full_sum6_ins
(
				.a(a[6]),
				.b(b[6]),
				.si(so5),
				
				
				.sum(sum[6])  ,
				.so(so6)
);
//第8个全加器/////////////////////////////////	
full_sum		full_sum7_ins
(
				.a(a[7]),
				.b(b[7]),
				.si(so6),
				
				
				.sum(sum[7])  ,
				.so(so)
);

endmodule 