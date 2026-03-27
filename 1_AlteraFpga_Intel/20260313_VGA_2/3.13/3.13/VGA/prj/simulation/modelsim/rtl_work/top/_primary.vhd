library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        key             : in     vl_logic;
        hsync           : out    vl_logic;
        vsync           : out    vl_logic;
        rgb             : out    vl_logic_vector(7 downto 0)
    );
end top;
