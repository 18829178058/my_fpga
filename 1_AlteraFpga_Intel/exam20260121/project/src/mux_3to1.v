module mux_3to1 (
    input  [7:0] a,
	input  [7:0] b,
	input  [7:0] c,
	input  [1:0] sel,
	input wire sys_clk,      // 系统时钟
   output  reg [7:0] d
);
  

//always @(posedge sys_clk)  
//begin
//    if(sel == 0)
//	    d <= a;
//	else if(sel ==  1)
//		d <= b;
//	else if(sel == 2 || sel == 3)
//	    d <= c;
//end

always @(*) begin
    case (sel)
        2'b00: d = a;
        2'b01: d = b;
        2'b10: d = c;
        2'b11: d = c;
        default: d = c;  // 推荐添加default
    endcase
end
endmodule