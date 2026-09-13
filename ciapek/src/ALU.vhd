library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- TODO: testbench
-- MIPS does not provide a NOT instruction, but A NOR $0 = NOT
--A, so the NOR instruction can substitute.

entity ALU is
    Port ( srca_in : in  STD_LOGIC_VECTOR (15 downto 0);
           srcb_in : in  STD_LOGIC_VECTOR (15 downto 0);
           control_in : in  STD_LOGIC_VECTOR (2 downto 0);
           result_out : out  STD_LOGIC_VECTOR (15 downto 0);
           zero_flag_out : out STD_LOGIC);
            
end ALU;

architecture Behavioral of ALU is 

  signal op_result : STD_LOGIC_VECTOR(15 downto 0);
  
  constant exception : STD_LOGIC_VECTOR(15 downto 0) := (others => 'X');
  constant zero : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');

begin

process(control_in, srca_in, srcb_in)

begin

case control_in is 

    -- when "000" -- AND 
    -- when "001" -- OR 
    when "010" => op_result <= srca_in + srcb_in ; -- ADD 
    -- when "011" -- n/a
    -- when "100" -- XOR  
    -- when "101" -- NOR 
    -- when "110" -- SUB 
    -- when "111" -- SLT
when others =>  op_result <= exception; -- TODO: this may probably break something, but alu_ctr should always be correct, so only at the beggining it may be wrong - if someting break on datapath, i should check this firstly

end case;

end process;

-- SIGNAL ASSIGMENT takes place after process suspension !!!!

result_out <= op_result;
zero_flag_out <= '1' when result_out = zero else '0';


end Behavioral;

