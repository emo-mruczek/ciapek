library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

-- i do not like the way it is implemented...

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

-- "MIPS uses a byte-addressable memory. That is, each byte in memory
-- has a unique address" 

type ram_type is array (0 to 511) of STD_LOGIC_VECTOR (7 downto 0);

---------- INSTRUCTIONS ------

-- instruction can have a maximum size of 128 TODO: how to determine whether i can use the offsett?
constant INSTRUCTIONS_MAX : INTEGER := 128;

signal memory: ram_type := (
  0 => "11111111",
  1 => "10101010", -- one instruction is 16 bit so two adresses for 1. instruction
  
------------ RAM ---------------------
  others => (others => '0') -- 0-initialized
);

----------------------------------

-- TODO: intructions offset

signal address : INTEGER := 0;

begin

  -- ROM initialization
  -- 7 segment as a debugger of current instruction number
  -- number all instructions
  -- speed down clock

  -- the input is an address and whether it is a addres to read from or to store from
  -- read from: if it is a instruction, the PC knows the address, if RAM, the programmer must know the address to use (no offset for instructions is implemented).

  address <= CONV_INTEGER(ra_in); -- TODO: all bits? immediate is only 7 bits so prob i can use this

    -- writting only on a rising edge of a clock
    process(clk)is 
    begin 
    
    if clk'event and clk = '1' then 
      if (we_in = '1') then 
        memory(address) <= wd_in(15 downto 8);
        memory(address) <= wd_in(7 downto 0);
      end if;
    end if;
    end process;

    -- value under address always out, insensitive to clk 
    process(ra_in) is 
    begin 
      rd_out <= memory(address) & memory(address + 1);
    end process;
  
end Behavioral;


-- so next instruction is prev + 2
-- pc stores addres of the prev instruction so it holds this mem 


