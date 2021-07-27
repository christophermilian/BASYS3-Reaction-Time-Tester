library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is 
    Port ( clock : in  STD_LOGIC;
           reset: in std_logic;
           user_input : in std_logic;
           ready_led : out std_logic;
           reflex_led : out std_logic;
           anode : out  STD_LOGIC_VECTOR (3 downto 0);
           SevenSD : out  STD_LOGIC_VECTOR (7 downto 0) );
end main;

architecture Behavioral of main is
type statetype is (idle, delay, counting, score, configured);
signal state: statetype := configured;

-- Set to 9999 so we can replace it with the user's score 
signal highscore : std_logic_vector(15 downto 0) := "1001100110011001"; 
signal count, segment : std_logic_vector(15 downto 0);

signal p10KHz, p1KHz : std_logic := '0';

signal delay_overflow, delay_reset, delay_en, delay_en0, cnt_r, cnt_en, cnt_en0, cnt_o, scoretime_o, scoretime_r : std_logic;
signal delay_rand : integer range 0 to 2999;

begin

------State Register------
process (clock)
begin
	if rising_edge(clock) then
		case state is
		    when configured =>
		      if user_input = '1' then
		          state <= idle;
		      else 
		          state <= configured;
		      end if; 
			when idle => 
				if user_input = '1' then
					state <= delay;
				elsif reset = '1' then 
				    state <= idle;
				end if;

			when delay =>
				if user_input = '1' then
					state <= idle;
				else 
					state <= counting;
				end if;
				
			when counting => 
				if user_input = '1' then
					state <= score;
				elsif cnt_o = '1' then
					state <= idle;
				elsif reset = '1' then 
				    state <= idle;
				end if;
				
			when score =>
				if scoretime_o = '1' then
					if count < highscore then
						highscore <= count;
					end if;
				elsif reset = '1' then 
				    state <= idle;
				end if;
				
			when others => null;
		end case;
	end if;
end process;

------Output Logic------
ready_led <= '1' when state = delay or state = score else '0';
reflex_led <= '1' when state = counting else '0';

delay_reset <= '0' when state = delay else '1';
delay_en <= '1' when state = delay else '0';

scoretime_r <= '0' when state = score else '1';

cnt_r <= '1' when state = idle else '0';
cnt_en <= '1' when state = counting else '0';

segment <= "0000001111110010" when state = configured 
        else 
            highscore when state = idle 
        else
		  "0000000000000000" when state = delay 
		else
		  count;
		  
cnt_en0 <= '1' when p1KHz = '1' and cnt_en = '1' else '0';
delay_en0 <= '1' when p1KHz = '1' and delay_en = '1' else '0';

------Utilizing Libraries------
mux : entity work.seg7_mux4 
    port map(
        clock_50MHz => clock,
        anode => anode,
        SevenSD => SevenSD,
        dp => "1111",
        Hex0 => segment(3 downto 0),
        Hex1 => segment(7 downto 4),
        Hex2 => segment(11 downto 8),
        Hex3 => segment(15 downto 12)
);

counter_delay : entity work.counter generic map(size => 4000) 
    port map(
	   clock => clock,
	   enable => delay_en0,
	   overflow => delay_overflow,
	   reset => delay_reset,
	   reset_value => delay_rand
);

counter_scoretimer : entity work.counter generic map(size => 3000) 
    port map(
        clock => clock,
        enable => p1KHz,
        reset => scoretime_r,
        overflow => scoretime_o
);

counter4 : entity work.counter4 
    port map(
        clock => clock,
        enable => cnt_en0,
        reset => cnt_r,
        v0 => count(3 downto 0), 
        v1 => count(7 downto 4), 
        v2 => count(11 downto 8),
        v3 => count(15 downto 12),
        overflow => cnt_o
);

prescaler_10Khz: entity work.counter Generic map(size => 5000) 
    Port map(
	   clock => clock,
	   overflow => p10KHz
);

prescaler_1Khz: entity work.counter Generic map(size => 50000) 
    Port map(
	   clock => clock,
	   overflow => p1KHz
);

end Behavioral;