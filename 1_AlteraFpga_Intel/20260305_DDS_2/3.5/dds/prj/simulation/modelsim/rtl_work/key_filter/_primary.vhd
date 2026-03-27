library verilog;
use verilog.vl_types.all;
entity key_filter is
    generic(
        CNT_MAX         : integer := 1000000
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        key_in          : in     vl_logic;
        key_pose        : out    vl_logic;
        key_nege        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CNT_MAX : constant is 1;
end key_filter;
