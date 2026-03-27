module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    wire [4:0] temp_value;
	assign temp_value = {a,b,c,d,e};
    
    genvar i, j;
    generate
        for(j = 4; j >= 0;j = i - 1) begin : A
            for(i = 4; i >= 0 ;i = i - 1)
                begin : B
                    assign  out[5*j + i] = ~temp_value[j]^temp_value[i];
                end
		  end
    endgenerate
endmodule
