library verilog;
use verilog.vl_types.all;
entity dds_ctrl is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        wave_f          : in     vl_logic_vector(13 downto 0);
        wave_a          : in     vl_logic_vector(2 downto 0);
        wave_sel        : in     vl_logic_vector(1 downto 0);
        wave_data       : out    vl_logic_vector(10 downto 0)
    );
end dds_ctrl;
