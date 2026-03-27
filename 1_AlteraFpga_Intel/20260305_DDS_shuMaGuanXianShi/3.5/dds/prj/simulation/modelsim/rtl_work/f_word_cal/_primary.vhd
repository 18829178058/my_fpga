library verilog;
use verilog.vl_types.all;
entity f_word_cal is
    port(
        wave_f          : in     vl_logic_vector(13 downto 0);
        f_word          : out    vl_logic_vector(31 downto 0)
    );
end f_word_cal;
