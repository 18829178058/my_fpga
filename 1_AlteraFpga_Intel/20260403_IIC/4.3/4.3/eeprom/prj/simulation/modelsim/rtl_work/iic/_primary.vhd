library verilog;
use verilog.vl_types.all;
entity iic is
    generic(
        sysclk          : integer := 50000000;
        iicclk          : integer := 100000;
        delay           : vl_notype;
        MID             : vl_notype;
        Q_MID           : vl_notype;
        TQ_MID          : vl_notype;
        IDW             : vl_logic_vector(0 to 7) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        IDR             : vl_logic_vector(0 to 7) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        start           : in     vl_logic;
        worr            : in     vl_logic;
        addr            : in     vl_logic_vector(15 downto 0);
        sendnum         : in     vl_logic_vector(7 downto 0);
        recvnum         : in     vl_logic_vector(7 downto 0);
        data_in         : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic_vector(7 downto 0);
        done_send       : out    vl_logic;
        done_recv       : out    vl_logic;
        done_iic        : out    vl_logic;
        sda             : inout  vl_logic;
        scl             : inout  vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of sysclk : constant is 1;
    attribute mti_svvh_generic_type of iicclk : constant is 1;
    attribute mti_svvh_generic_type of delay : constant is 3;
    attribute mti_svvh_generic_type of MID : constant is 3;
    attribute mti_svvh_generic_type of Q_MID : constant is 3;
    attribute mti_svvh_generic_type of TQ_MID : constant is 3;
    attribute mti_svvh_generic_type of IDW : constant is 1;
    attribute mti_svvh_generic_type of IDR : constant is 1;
end iic;
