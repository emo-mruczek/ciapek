library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- TODO: controller fix
-- TODO: check the instruction bits

entity datapath is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           instruction_or_data : in STD_LOGIC;
           memory_write : in STD_LOGIC;
           register_write : in STD_LOGIC;
           pc_write : in STD_LOGIC;
           ir_write : in STD_LOGIC;
           alu_src_a : in STD_LOGIC;
           alu_src_b : in STD_LOGIC_VECTOR (1 downto 0);
           ALU_control_in : in  STD_LOGIC_VECTOR (2 downto 0);
           zero_flag_out : out  STD_LOGIC;
           dip0, dip1, dip2, dip3, dip4, dip5, dip6, dip7 : in STD_LOGIC := '0';
           led0, led1, led2, led3, led4, led5, led6, led7 : out STD_LOGIC;
           button0 : in STD_LOGIC

);
        
end datapath;

architecture Structural of datapath is

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
signal src_a : STD_LOGIC_VECTOR (15 downto 0);
signal src_b : STD_LOGIC_VECTOR (15 downto 0);
signal sign_immediate : STD_LOGIC_VECTOR (15 downto 0);
signal ALU_result : STD_LOGIC_VECTOR (15 downto 0);

-- that one constant 

constant two : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000010";

begin


-- let's start with lw 

-- pc constains the address of the instruction to execute 
program_counter: entity work.enable_register(Behavioral) 
  port map (
    clk => clk,
    reset => reset,
    input => alu_result,
    output => pc_out,
    enable => pc_write,    
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
instruction_register: entity work.enable_register(Behavioral)
  port map (
    clk => clk,
    reset => reset,
    input => memory_out,
    output => instruction,
    enable => ir_write
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
register_file: entity work.register_file(Behavioral)
 port map(
    clk => clk,
    we3_in => register_write,
    ra1_in => instruction (13 downto 11),
    ra2_in => instruction (10 downto 7),
    ra3_in => instruction (10 downto 7),
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
    d0_in => pc_out,
    d1_in => a_out,
    s_in => ALU_src_a,
    output => src_a
);

-- sign extension of immediate field of an instruction (to 16 bit)

sign_extension_inst: entity work.sign_extension(Behavioral)
 port map(
    input => instruction (6 downto 0), -- TODO: ?
    output => sign_immediate
);

-- multiplexer that decides the second operand for the ALU 

alu_source_b_decide: entity work.multiplexer_four(Behavioral)
 port map(
    d0_in => two, -- TODO: for now
    d1_in => two, -- for next pc instruction - 
    d2_in => sign_immediate,
    d3_in => two, -- TODO: for now
    s_in => ALU_src_b,
    output => src_b
);

-- ALU 

ALU_inst: entity work.ALU(Behavioral)
 port map(
    srca_in => src_a,
    srcb_in => src_b,
    control_in => ALU_control_in,
    result_out => ALU_result,
    zero_flag_out => zero_flag_out
);

-- register that holds ALU result 

ALU_result_register: entity work.flipflop_reset(Behavioral)
 port map(
    clk => clk,
    reset => reset,
    input => alu_result,
    output => alu_out
);


end Structural;

