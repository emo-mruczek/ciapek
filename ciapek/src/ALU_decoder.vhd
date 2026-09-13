library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- TODO: testbench

entity ALU_decoder is
    Port ( ALU_op_in : in  STD_LOGIC_VECTOR (1 downto 0);
           funct_in : in  STD_LOGIC_VECTOR (2 downto 0);
           ALU_ctr_out : out  STD_LOGIC_VECTOR (2 downto 0));
end ALU_decoder;

architecture Behavioral of ALU_decoder is

begin

  process(ALU_op_in, funct_in)
  begin 
    
  case ALU_op_in is 
    when "00" => ALU_ctr_out <= "010"; -- simple add, not an instruction
    when "01" => ALU_ctr_out <= "110"; -- same but sub 
    -- when "10" => case funct_in is -- actuall instructions r type
    --             when "" => ALU_ctr_out <= "000"; -- and
    --             when "" => ALU_ctr_out <= "001"; -- or 
    --             when "" => ALU_ctr_out <= "010"; -- add
    --             when "" => ALU_ctr_out <= "100"; -- xor
    --             when "" => ALU_ctr_out <= "101"; -- nor 
    --             when "" => ALU_ctr_out <= "110"; -- sub
    --             when "" => ALU_ctr_out <= "111"; -- slt
    --             when others => ALU_ctr_out <= "XX";
    --             end case;
    when "10" => ALU_ctr_out <= funct_in; -- my implementation allows it;
    when others => ALU_ctr_out <= "XXX"; -- wrong op
    end case;

  end process;

end Behavioral;

