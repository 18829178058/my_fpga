library verilog;
use verilog.vl_types.all;
entity send_data is
    port(
        lcd_clk         : in     vl_logic;
        rst_n           : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        shift_en        : in     vl_logic;
        shift_cnt       : out    vl_logic_vector(3 downto 0);
        lcd_rs          : in     vl_logic;
        lcd_sda         : out    vl_logic;
        lcd_scl         : out    vl_logic;
        lcd_cs          : out    vl_logic
    );
end send_data;
