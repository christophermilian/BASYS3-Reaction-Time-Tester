----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2017 02:05:32 PM
-- Design Name: 
-- Module Name: Reflex_Tester - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
    Port ( start : in STD_LOGIC;
           stop : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           user_input : in STD_LOGIC;
           output_LED : out STD_LOGIC);
end main;

architecture Behavioral of main is

component Dflipflop 
Port ( CLK : in std_logic; 
       Reset : in std_logic; 
       D : in std_logic; 
       start : in std_logic;
       Q : out std_logic); 
end component;

type statetype is (idle, onn, off);
signal state: statetype; 
signal tap_data : std_logic:= '0';
signal count, t, num: integer;
signal data : std_logic_vector (15 downto 0);
signal counter : integer:= 0;
signal slowc : std_logic:= '0';

begin

process(clk,reset)
begin
	if(reset='1') then
	   state<=idle;
	elsif(clk='1' and clk'event) then
	   case state is 
	       when idle =>
            if (user_input = '1') then
                state<= onn;
            end if;
	       when onn => 
	           output_LED <= '1';
               state<= off;
	       when off=>
	           output_LED <= '0';
	           state<= idle;
	       when others =>
	           state<= idle;
	   end case;
	end if;
end process;

process (clk)
begin

-- time period of slow clock is 1s.
    if (counter = 100000000) then
        slowc <= not slowc;
        counter <= 0;
    elsif (clk='1' and clk'event) then
        counter <= counter + 1;
    end if;
end process;

--output_LED <= user_input;


--harsha: Dflipflop
--    port map(CLK=> slowc, reset=>reset, D=>tap_data,start=>start, Q=>data(0)); 
--g0:for i in 0 to 14 generate 
--stageN: Dflipflop 
--    port map(CLK=>slowc, reset=>reset, D=>data(i), start=>start, Q=>data(i+1)); 
--end generate;

end Behavioral;
