library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- TODO: controller fix

entity datapath is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           instruction_or_data : in STD_LOGIC;
           memory_write : in STD_LOGIC;
           register_write : in STD_LOGIC

);
        
          -- memtoreg_in : in  STD_LOGIC;
           --pcsrc_in : in  STD_LOGIC;
           --aluscr_in : in  STD_LOGIC;
           --regdst_in : in  STD_LOGIC;
           --regwrite_in : in  STD_LOGIC;
           --ALU_control_in : in  STD_LOGIC_VECTOR (2 downto 0);
           -- zero_flag_out : out  STD_LOGIC );
           --instruction_in : in  STD_LOGIC_VECTOR (15 downto 0);
           -- read_data_in : in  STD_LOGIC_VECTOR (15 downto 0);
          -- pc_out : out  STD_LOGIC_VECTOR (15 downto 0);
          --  alu_out : out  STD_LOGIC_VECTOR (15 downto 0);
          -- write_data_out : out  STD_LOGIC_VECTOR (15 downto 0));
end datapath;

architecture Structural of datapath is

signal pc_next: STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal pc_out: STD_LOGIC_VECTOR (15 downto 0);
signal ALU_out: STD_LOGIC_VECTOR (15 downto 0);
signal address: STD_LOGIC_VECTOR (15 downto 0);
signal memory_out: STD_LOGIC_VECTOR (15 downto 0);
signal rd1_out: STD_LOGIC_VECTOR (15 downto 0);
signal rd2_out : STD_LOGIC_VECTOR (15 downto 0);
signal a_out: STD_LOGIC_VECTOR (15 downto 0);
signal b_out : STD_LOGIC_VECTOR (15 downto 0);
signal instruction : STD_LOGIC_VECTOR (15 downto 0);
signal data : STD_LOGIC_VECTOR (15 downto 0);


begin


-- let's start with lw 

-- pc constains the address of the instruction to execute 
-- TODO: it should be enable register
program_counter: entity work.flipflop_reset(Behavioral) 
  port map (
    clk => clk,
    reset => reset,
    input => pc_next,
    output => pc_out
);

-- is connected to the multiplexer that decide whether address given to memory is of an instruction or data 

address_source: entity work.multiplexer_two(Behavioral) 
  port map (
    d0_in => pc_out,
    d1_in => ALU_out,
    s_in => instruction_or_data,
    output => address
);

-- Address is connected to the memory 

memory: entity work.instruction_data_memory(Behavioral) 
  port map (
    ra_in => address,
    wd_in => b_out,
    clk => clk,
    we_in => memory_write,
    rd_out => memory_out
);

-- two registers store, respectively, instruction or data, after fetch
-- TODO: it should be enable register
instruction_register: entity work.flipflop_reset(Behavioral)
  port map (
    clk => clk,
    reset => reset,
    input => memory_out,
    output => instruction
);


data_register: entity work.flipflop_reset(Behavioral)
  port map (
    clk => clk,
    reset => reset,
    input => memory_out,
    output => data
);

-- data and the specific bits of the instruction goes to the register file 
-- TODO: ucf
-- TODO: which bits of an instruction
register_file: entity work.register_file(Behavioral)
 port map(
    clk => clk,
    we3_in => register_write,
    ra1_in => ra1_in,
    ra2_in => ra2_in,
    ra3_in => ra3_in,
    wd3_in => data,
    rd1_out => rd1_out,
    rd2_out => rd2_out,
    dip0 => dip0,
    dip1 => dip1,
    dip2 => dip2,
    dip3 => dip3,
    dip4 => dip4,
    dip5 => dip5,
    dip6 => dip6,
    dip7 => dip7,
    led0 => led0,
    led1 => led1,
    led2 => led2,
    led3 => led3,
    led4 => led4,
    led5 => led5,
    led6 => led6,
    led7 => led7,
    button0 => button0
);

-- register file output goes to the "nonarchitectural" registers 

register_A: entity work.flipflop_reset(Behavioral)
 port map(
    clk => clk,
    reset => reset,
    input => rd1_out,
    output => a_out
);

register_B: entity work.flipflop_reset(Behavioral)
 port map(
    clk => clk,
    reset => reset,
    input => rd2_out,
    output => b_out
);

-- multiplexer that decides whether we add to the PC or to the lw base (base address + offset)

pc_or_instruction: entity work.multiplexer_two(Behavioral)
 port map(
    d0_in => d0_in,
    d1_in => d1_in,
    s_in => s_in,
    output => output
);

-- sign extension of immediate field of an instruction (to 16 bit)

sign_extension_inst: entity work.sign_extension(Behavioral)
 port map(
    input => input,
    output => output
);

-- multiplexer that decides the second operand for the ALU 

alu_source_b_decide: entity work.multiplexer_four(Behavioral)
 port map(
    d0_in => d0_in,
    d1_in => d1_in,
    d2_in => d2_in,
    d3_in => d3_in,
    s_in => s_in,
    output => output
);

-- ALU 

ALU_inst: entity work.ALU(Behavioral)
 port map(
    srca_in => srca_in,
    srcb_in => srcb_in,
    control_in => control_in,
    result_out => result_out,
    zero_flag_out => zero_flag_out
);

-- register that holds ALU result 

ALU_result_register: entity work.flipflop_reset(Behavioral)
 port map(
    clk => clk,
    reset => reset,
    input => input,
    output => output
);




end Structural;

