library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- TODO: testbench
-- simple adder 
entity adder is
    Port ( a_in : in  STD_LOGIC_VECTOR (15 downto 0);
           b_in : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end adder;

architecture Behavioral of adder is
begin
  
output <= a_in + b_in;

end Behavioral;

