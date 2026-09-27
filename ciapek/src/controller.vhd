
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- TODO: signal names (absolute mess)
-- TODO: testbench
-- TODO: absolutely refactor its not for multicycle rn controller + main decoder

entity controller is
    Port ( opcode_in : in  STD_LOGIC_VECTOR (2 downto 0);
           funct_in : in  STD_LOGIC_VECTOR (2 downto 0);
           zero_flag_in : in  STD_LOGIC;
           memtoreg_out : out  STD_LOGIC;
           memwrite_out : out  STD_LOGIC;
           pcsrc_out : out  STD_LOGIC;
           alusrc_out : out  STD_LOGIC;
           regdst_out : out  STD_LOGIC;
           regwrite_out : out  STD_LOGIC;
           ALU_control_out : out  STD_LOGIC_VECTOR(2 downto 0));
end controller;

architecture Structural of controller is

signal alu_op : STD_LOGIC_VECTOR(1 downto 0);

begin

-- entity instantiation 

main_decoder: entity work.main_decoder(Behavioral)
  port map (
           opcode_in => opcode_in,
           alu_op_out => alu_op ,
           memtoreg_out => memtoreg_out,
           alusrc_out => alusrc_out,
           regwrite_out => regwrite_out,
           memwrite_out => memwrite_out
);

ALU_decoder: entity work.ALU_decoder(Behavioral)
  port map (
           ALU_op_in => alu_op,
           funct_in => funct_in,
           ALU_control_out => ALU_control_out
);

end Structural;

