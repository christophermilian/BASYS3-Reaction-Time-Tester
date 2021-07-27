library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity counter4 is port(
	clock : in std_logic;
	enable : in std_logic := '1';
	reset : in std_logic := '0';
	v0 : out std_logic_vector(3 downto 0);
	v1 : out std_logic_vector(3 downto 0);
	v2 : out std_logic_vector(3 downto 0);
	v3 : out std_logic_vector(3 downto 0);
	overflow : out std_logic
);
end counter4;

architecture Behavioral of counter4 is

signal integer0 : integer range 0 to 9;
signal integer1 : integer range 0 to 9;
signal integer2 : integer range 0 to 9;
signal integer3 : integer range 0 to 9;

signal o0 : std_logic;
signal o1 : std_logic;
signal o2 : std_logic;

begin

v0 <= std_logic_vector(to_unsigned(integer0, 4));
v1 <= std_logic_vector(to_unsigned(integer1, 4));
v2 <= std_logic_vector(to_unsigned(integer2, 4));
v3 <= std_logic_vector(to_unsigned(integer3, 4));

val_cnt0 : entity work.counter generic map(size => 10) Port map(
	clock => clock,
	reset => reset,
	enable => enable,
	value => integer0,
	overflow => o0
);

val_cnt1 : entity work.counter generic map(size => 10) Port map(
	clock => clock,
	reset => reset,
	enable => o0,
	value => integer1,
	overflow => o1
);

val_cnt2 : entity work.counter generic map(size => 10) Port map(
	clock => clock,
	reset => reset,
	enable => o1,
	value => integer2,
	overflow => o2
);

val_cnt3 : entity work.counter generic map(size => 10) Port map(
	clock => clock,
	reset => reset,
	enable => o2,
	value => integer3,
	overflow => overflow
);

end Behavioral;

