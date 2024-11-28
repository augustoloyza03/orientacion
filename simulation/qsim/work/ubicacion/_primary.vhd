library verilog;
use verilog.vl_types.all;
entity ubicacion is
    port(
        o0              : out    vl_logic;
        clock           : in     vl_logic;
        Gder            : in     vl_logic;
        Gizq            : in     vl_logic;
        reset           : in     vl_logic;
        o1              : out    vl_logic;
        p0              : out    vl_logic;
        S               : in     vl_logic;
        p1              : out    vl_logic;
        p2              : out    vl_logic;
        p3              : out    vl_logic
    );
end ubicacion;
