library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seg7_mux4 is
	Port (
		clock_50MHz : in std_logic;
		Hex0 : in  std_logic_vector (3 downto 0);
		Hex1 : in  std_logic_vector (3 downto 0);
		Hex2 : in  std_logic_vector (3 downto 0);
		Hex3 : in  std_logic_vector (3 downto 0);
		Dp : in std_logic_vector (3 downto 0);
		anode : out std_logic_vector (3 downto 0);
		SevenSD : out std_logic_vector (7 downto 0)
	);
end seg7_mux4;

architecture Behavioral of seg7_mux4 is

signal p400Hz : std_logic;
signal sel : integer range 0 to 3 := 0;
signal Hex : std_logic_vector (3 downto 0);

begin
with sel select
	anode <=	"1110" when 0,
				"1101" when 1,
				"1011" when 2,
				"0111" when others;

with sel select
	Hex <=	    Hex0 when 0,
				Hex1 when 1,
				Hex2 when 2,
				Hex3 when others;
				
with sel select
	SevenSD(7) <=   Dp(0) when 0,
				    Dp(1) when 1,
				    Dp(2) when 2,
				    Dp(3) when others;
				
--50 MHz / 100 Hz / 4 displays (400 Hz) = 125000
prescaler: entity work.counter generic map(size => 125000) port map(
	clock => clock_50MHz,
	overflow => p400Hz
);
		
sel_cnt: entity work.counter generic map(size => 4) port map(
	clock => p400Hz,
	value => sel
);

seg7: entity work.seg7 port map (
	Hex => Hex,
	SevenSD => SevenSD(6 downto 0)
);

end Behavioral;