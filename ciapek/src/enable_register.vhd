library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity enable_register is
    Port ( clk : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           reset : in STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end enable_register;

architecture Behavioral of enable_register is

begin

-- TODO:correctness of this logis

process(clk, reset, enable) begin 
  if reset = '1' then 
      output <= (others => '0');
  elsif enable = '1' then 
    if clk'event and clk = '1' then 
     output <= input; 
    end if;
  end if;
end process;

end Behavioral;

