library verilog;
use verilog.vl_types.all;
entity fifo_rd is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data_rd         : in     vl_logic_vector(7 downto 0);
        done_rd         : in     vl_logic;
        done_iic        : in     vl_logic;
        done_tx         : in     vl_logic;
        worr_iic        : in     vl_logic;
        start_tx        : out    vl_logic;
        data_tx         : out    vl_logic_vector(7 downto 0)
    );
end fifo_rd;
