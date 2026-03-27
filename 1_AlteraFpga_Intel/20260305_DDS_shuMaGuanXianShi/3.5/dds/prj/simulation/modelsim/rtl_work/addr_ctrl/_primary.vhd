library verilog;
use verilog.vl_types.all;
entity addr_ctrl is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        f_word          : in     vl_logic_vector(31 downto 0);
        wave_sel        : in     vl_logic_vector(1 downto 0);
        addr            : out    vl_logic_vector(9 downto 0)
    );
end addr_ctrl;
