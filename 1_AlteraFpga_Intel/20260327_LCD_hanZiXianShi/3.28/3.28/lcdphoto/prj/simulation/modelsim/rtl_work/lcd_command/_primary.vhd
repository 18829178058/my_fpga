library verilog;
use verilog.vl_types.all;
entity lcd_command is
    port(
        lcd_clk         : in     vl_logic;
        rst_n           : in     vl_logic;
        shift_cnt       : in     vl_logic_vector(3 downto 0);
        data            : out    vl_logic_vector(7 downto 0);
        lcd_rs          : out    vl_logic;
        lcd_res         : out    vl_logic;
        shift_en        : out    vl_logic
    );
end lcd_command;
