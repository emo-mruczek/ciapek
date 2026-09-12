library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- simple left left shift 
-- used to multiply by 4
-- TODO: checkagain after implementing PC and memory
-- whether multiply by 4 is correct
-- if not, fix also the testbench file
-- TODO: testbench
entity left_shift is
    Port ( input : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end left_shift;

architecture Behavioral of left_shift is

begin


  output <= input(13 downto 0) & "00";


end Behavioral;

