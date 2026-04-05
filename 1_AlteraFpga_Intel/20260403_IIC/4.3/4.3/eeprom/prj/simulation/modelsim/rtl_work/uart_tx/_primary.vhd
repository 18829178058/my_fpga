library verilog;
use verilog.vl_types.all;
entity uart_tx is
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
        tx_din          : in     vl_logic_vector;
        tx_vld          : in     vl_logic;
        uart_txd        : out    vl_logic;
        tx_done         : out    vl_logic;
        ready           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLOCK_FRQ : constant is 1;
    attribute mti_svvh_generic_type of BAUD : constant is 1;
    attribute mti_svvh_generic_type of DATA_LENTH : constant is 1;
    attribute mti_svvh_generic_type of CHECKBIT_SELECT : constant is 1;
    attribute mti_svvh_generic_type of CHECK_TYPE : constant is 1;
end uart_tx;
