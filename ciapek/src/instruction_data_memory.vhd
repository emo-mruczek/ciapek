library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

-- instruction and data memory as one module
-- as it is a multicycle processor
-- "After all, RAM and ROM are the same thing in FPGAs, ROM is a RAM that you only read from." 
entity instruction_data_memory is
    Port ( ra_in : in  STD_LOGIC_VECTOR (15 downto 0);
           wd_in : in  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;
           we_in : in  STD_LOGIC;
           rd_out : out  STD_LOGIC_VECTOR (15 downto 0));
end instruction_data_memory;

architecture Behavioral of instruction_data_memory is

-- -- TODO: ram from fpga
type ram_type is array (31 downto 0) of STD_LOGIC_VECTOR (15 downto 0);

----- CONSTANT INSTRUCTIONS ------

-- no idea (for now) how to make ROM load from .mem file not for simulation

constant instructions: ram_type := (
  0 => "1111111111111111",
  others => X"0"
);

----------------------------------

-- TODO: memory addresations, check book
-- maybe use also sd card to load memory?

begin

  -- multiple rd_out drivers or sth how to actually distinguish between 
  -- instruction and data?
  -- add another output 
  -- SINGLE MEMORY FOR RAM AND ROM

  -- ROM initialization
  -- 7 segment as a debugger of current instruction number 
  -- number all instructions 
  -- speed down clock
  
  -- TODO: difference whether ra-in is an adress or data
  -- ADD INSTRUCTION REGISTER

  -- load instruction
  process(ra_in) is 
  begin

    rd_out <= instructions(CONV_INTEGER(ra_in)); -- TODO: correctness + bits of ra

  end process;

-- data memory 
process(clk, ra_in) is 

variable memory: ram_type := (others => (others => '0'));

begin 
      if clk'event and clk = '1' then 
        if (we_in = '1') then 
          memory(CONV_INTEGER(ra_in)) := wd_in; -- TODO: which bits of ra
        end if;
      end if;
      
      rd_out <= memory(CONV_INTEGER(ra_in)); -- TODO: which bits of ra
end process;


end Behavioral;

