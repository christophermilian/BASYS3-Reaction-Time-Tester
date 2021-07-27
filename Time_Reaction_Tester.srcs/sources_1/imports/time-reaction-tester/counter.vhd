library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter is
	Generic (
		size : integer
	);
	Port (
		clock : in STD_LOGIC;
		reset : in STD_LOGIC := '0';
		reset_value : in integer range 0 to size-1 := 0;
		enable : in STD_LOGIC := '1';
		value : inout integer range 0 to size-1 := 0;
		overflow : out std_LOGIC
	);
end counter;

architecture Behavioral of counter is
begin
	process (clock, reset, reset_value)
	begin
		if reset='1' then
			value <= reset_value;
			overflow <= '0';
		elsif rising_edge(clock) then
			overflow <= '0';
			if enable = '1' then
				if value = size - 1 then
					value <= 0;
					overflow <= '1';
				else
					value <= value + 1;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

