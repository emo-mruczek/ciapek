library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- for immediate type instructions
-- for extending the immediate value from 7 to 16 bits
-- TODO: testbench
entity sign_extension is
    Port ( input : in  STD_LOGIC_VECTOR (6 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end sign_extension;

architecture Behavioral of sign_extension is

begin
  
  if input(6) = '0' then 
    output <= "000000000" & a;
  else 
    output <= "111111111" & a;
  end if;


end Behavioral;

