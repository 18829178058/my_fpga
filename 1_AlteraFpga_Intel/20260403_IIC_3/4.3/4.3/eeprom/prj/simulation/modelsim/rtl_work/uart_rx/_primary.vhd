library verilog;
use verilog.vl_types.all;
entity uart_rx is
    generic(
        CLOCK_FRQ       : integer := 50000000;
        BAUD            : integer := 115200;
        DATA_LENTH      : integer := 8;
        CHECKBIT_SELECT : integer := 0;
        CHECK_TYPE      : integer := 0
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        uart_rxd        : in     vl_logic;
        rx_dout         : out    vl_logic_vector;
        rx_dout_vld     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLOCK_FRQ : constant is 1;
    attribute mti_svvh_generic_type of BAUD : constant is 1;
    attribute mti_svvh_generic_type of DATA_LENTH : constant is 1;
    attribute mti_svvh_generic_type of CHECKBIT_SELECT : constant is 1;
    attribute mti_svvh_generic_type of CHECK_TYPE : constant is 1;
end uart_rx;
