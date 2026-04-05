library verilog;
use verilog.vl_types.all;
entity fifo_wr is
    generic(
        IDLE            : integer := 1;
        SEND            : integer := 2;
        RECV            : integer := 3;
        WORR            : integer := 4;
        ADDR_H          : integer := 5;
        ADDR_L          : integer := 6;
        DATA            : integer := 7;
        STOP            : integer := 8
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_rx         : in     vl_logic_vector(7 downto 0);
        rx_dout_vld     : in     vl_logic;
        done_wr         : in     vl_logic;
        done_iic        : in     vl_logic;
        start           : out    vl_logic;
        data_iic        : out    vl_logic_vector(7 downto 0);
        addr_iic        : out    vl_logic_vector(15 downto 0);
        worr_iic        : out    vl_logic;
        sendnum         : out    vl_logic_vector(7 downto 0);
        recvnum         : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of SEND : constant is 1;
    attribute mti_svvh_generic_type of RECV : constant is 1;
    attribute mti_svvh_generic_type of WORR : constant is 1;
    attribute mti_svvh_generic_type of ADDR_H : constant is 1;
    attribute mti_svvh_generic_type of ADDR_L : constant is 1;
    attribute mti_svvh_generic_type of DATA : constant is 1;
    attribute mti_svvh_generic_type of STOP : constant is 1;
end fifo_wr;
