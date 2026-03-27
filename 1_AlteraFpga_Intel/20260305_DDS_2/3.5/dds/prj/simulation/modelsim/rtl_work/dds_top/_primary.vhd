library verilog;
use verilog.vl_types.all;
entity dds_top is
    port(
        clk             : in     vl_logic;
        key_sel         : in     vl_logic;
        key_a           : in     vl_logic;
        key_f_add       : in     vl_logic;
        key_f_sub       : in     vl_logic;
        wave_data       : out    vl_logic_vector(10 downto 0)
    );
end dds_top;
