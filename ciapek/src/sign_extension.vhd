library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- for immediate type instructions
-- for extending the immediate value from 7 to 16 bits
entity sign_extension is
    Port ( input : in  STD_LOGIC_VECTOR (6 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end sign_extension;

architecture Behavioral of sign_extension is

begin

output <=  "000000000" & input when input(6) = '0' else "111111111" & input;
  
end Behavioral;

