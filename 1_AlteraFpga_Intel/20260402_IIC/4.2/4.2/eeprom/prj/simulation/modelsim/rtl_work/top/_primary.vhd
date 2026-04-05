library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        rx              : in     vl_logic;
        tx              : out    vl_logic;
        scl             : inout  vl_logic;
        sda             : inout  vl_logic
    );
end top;
