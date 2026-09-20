library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_decoder is
    Port ( opcode_in : in  STD_LOGIC_VECTOR (2 downto 0);
           alu_op_out : out  STD_LOGIC_VECTOR (1 downto 0);
           memtoreg_out : out  STD_LOGIC;
           alusrc_out : out  STD_LOGIC;
           regwrite_out : out  STD_LOGIC;
           memwrite_out : out  STD_LOGIC);
end main_decoder;

architecture Behavioral of main_decoder is

-- helper signal
-- each insruction - different state of the CPU
signal controls: STD_LOGIC_VECTOR(5 downto 0);

begin

  process(opcode_in)
  begin 
    case opcode_in is 

      when "000" => controls <= "000000"; -- register-type
      when "001" => controls <= "011100"; -- lw 
      when "010" => controls <= "000000"; -- sw
      when others => controls <= (others => 'X'); -- illegal

    end case;
  end process;

memwrite_out <= controls(5);
regwrite_out <= controls(4);
alusrc_out <= controls(3);
memtoreg_out <= controls(2);
alu_op_out <= controls (1 downto 0);
  
end Behavioral;

