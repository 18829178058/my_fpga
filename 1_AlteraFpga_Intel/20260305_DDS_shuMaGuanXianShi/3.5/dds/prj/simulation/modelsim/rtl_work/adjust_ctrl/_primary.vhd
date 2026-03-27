library verilog;
use verilog.vl_types.all;
entity adjust_ctrl is
    generic(
        F_IDLE          : integer := 100;
        F_STEP          : integer := 100;
        A_IDLE          : integer := 1;
        A_STEP          : integer := 1
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        key_sel         : in     vl_logic;
        key_a           : in     vl_logic;
        key_f_add       : in     vl_logic;
        key_f_sub       : in     vl_logic;
        wave_f          : out    vl_logic_vector(13 downto 0);
        wave_a          : out    vl_logic_vector(2 downto 0);
        wave_sel        : out    vl_logic_vector(1 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of F_IDLE : constant is 1;
    attribute mti_svvh_generic_type of F_STEP : constant is 1;
    attribute mti_svvh_generic_type of A_IDLE : constant is 1;
    attribute mti_svvh_generic_type of A_STEP : constant is 1;
end adjust_ctrl;
