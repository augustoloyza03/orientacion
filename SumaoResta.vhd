library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SumaoResta is
    port (
        o0,  o1 : in std_logic;
        S,reset : in std_logic;
        p0, p1, p2, p3 : out std_logic   -- bits de la posicion actual (salida)
    );
end SumaoResta;

architecture Behavioral of SumaoResta is
    signal a : unsigned(3 downto 0) := "0000"; -- Inicialización en cero (pocision incial del robot que en este caso seria la posicion vieja)
	 signal O:std_logic_vector(1 downto 0);
begin
    O<= (o1 & o0);
	 p3 <= a(3);
	 p2 <= a(2);
	 p1 <= a(1);
	 p0 <= a(0);
    process(S,reset)
    begin
        if reset='0' then
				a<="0000";
		  elsif rising_edge(S) then
            case O is
							when "11" =>
								a<= a+4;
							when "01" =>
								a<= a-1;
							when "10" =>
								a<= a+1;
							when "00" =>
								a<= a-4;
				end case;
        end if;
    end process;
end Behavioral;