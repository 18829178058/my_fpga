library verilog;
use verilog.vl_types.all;
entity lcd_top is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        lcd_rs          : out    vl_logic;
        lcd_cs          : out    vl_logic;
        lcd_res         : out    vl_logic;
        lcd_sda         : out    vl_logic;
        lcd_scl         : out    vl_logic
    );
end lcd_top;
