library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- simple multiplexer with two inputs 
entity multiplexer_two is
    Port ( d0_in : in  STD_LOGIC_VECTOR (15 downto 0);
           d1_in : in  STD_LOGIC_VECTOR (15 downto 0);
           s_in : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplexer_two;

architecture Behavioral of multiplexer_two is 

begin

output <= d0_in when s_in = '0' else d1_in;

end Behavioral;

