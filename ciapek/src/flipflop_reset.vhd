
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- simple resettable flip-flop used as a register
entity flipflop_reset is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end flipflop_reset;

architecture Behavioral of flipflop_reset is

begin

process(clk, reset) begin 
  if reset = '1' then 
    output <= (others => '0');
  elsif clk'event and clk = '1' then 
     output <= input; 
  end if;
end process;


end Behavioral;

