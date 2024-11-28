-- Quartus II VHDL Template
-- Four-State Moore State Machine

-- A Moore machine's outputs are dependent only on the current state.
-- The output is written only when the state changes.  (State
-- transitions are synchronous.)

library ieee;
use ieee.std_logic_1164.all;

entity orientacion is

	port(
		clk		 : in	std_logic;
		gd,gi	 : in	std_logic;
		reset	 : in	std_logic;
		o0,o1	 : out	std_logic
	);

end entity;

architecture rtl of orientacion is

	-- Build an enumerated type for the state machine
	type state_type is (N,S,E,O);

	-- Register to hold the current state
	signal state   : state_type;
	signal g: std_logic_vector (1 downto 0);

begin
g<= (gi & gd);
	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '0' then
			state <= N;
		elsif (rising_edge(clk)) then
			case state is
				when N=>
					case g is
						when "00" =>
							state<=N;
						when "01" =>
							state<=E;
						when "10" =>
							state<=O;
						when "11" =>
							state<=S;
					end case;
				when E=>
					case g is
						when "00" =>
							state<=E;
						when "01" =>
							state<=S;
						when "10" =>
							state<=N;
						when "11" =>
							state<=O;
					end case;
				when S=>
					case g is
						when "00" =>
							state<=S;
						when "01" =>
							state<=O;
						when "10" =>
							state<=E;
						when "11" =>
							state<=N;
					end case;
				when O =>
					case g is
						when "00" =>
							state<=O;
						when "01" =>
							state<=N;
						when "10" =>
							state<=S;
						when "11" =>
							state<=E;
					end case;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when N =>
				o0 <= '1';
				o1 <= '1';
			when E =>
				o0 <= '1';
				o1 <= '0';
			when S =>
				o0 <= '0';
				o1 <= '0';
			when O =>
				o0 <= '0';
				o1 <= '1';
		end case;
	end process;

end rtl;
