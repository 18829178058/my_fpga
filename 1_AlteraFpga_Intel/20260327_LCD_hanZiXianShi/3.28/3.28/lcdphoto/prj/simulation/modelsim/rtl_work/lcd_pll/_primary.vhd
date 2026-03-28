library verilog;
use verilog.vl_types.all;
entity lcd_pll is
    port(
        inclk0          : in     vl_logic;
        c0              : out    vl_logic
    );
end lcd_pll;
