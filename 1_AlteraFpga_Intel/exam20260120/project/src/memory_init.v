module memory_init (
    input wire [7:0] address,
    output wire [7:0] q
);
    
    reg [7:0] rom [0:255];
    
    initial $readmemb("hex_data.txt", rom);
    
	
	assign q = rom[address];
    
endmodule