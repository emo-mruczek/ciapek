library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- TODO testbench

entity multiplexer_4 is
    Port ( d0_in : in  STD_LOGIC_VECTOR (15 downto 0);
           d1_in : in  STD_LOGIC_VECTOR (15 downto 0);
           d2_in : in  STD_LOGIC_VECTOR (15 downto 0);
           d3_in : in  STD_LOGIC_VECTOR (15 downto 0);
           s_in : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplexer_4;

architecture Behavioral of multiplexer_4 is

begin


output <= d0_in when s_in = "00" else 
          d1_in when s_in = "01" else
          d2_in when s_in = "10" else
          d3_in;



end Behavioral;

