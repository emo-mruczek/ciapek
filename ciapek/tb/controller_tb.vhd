--------------------------------------------------------------------------------
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY controller_tb IS
END controller_tb;
 
ARCHITECTURE behavior OF controller_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controller
    PORT(
         opcode_in : IN  std_logic_vector(2 downto 0);
         funct_in : IN  std_logic_vector(2 downto 0);
         zero_flag_in : IN  std_logic;
         memtoreg_out : OUT  std_logic;
         memwrite_out : OUT  std_logic;
         pcsrc_out : OUT  std_logic;
         alusrc_out : OUT  std_logic;
         regdst_out : OUT  std_logic;
         regwrite_out : OUT  std_logic;
         ALU_control_out : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal opcode_in : std_logic_vector(2 downto 0) := (others => '0');
   signal funct_in : std_logic_vector(2 downto 0) := (others => '0');
   signal zero_flag_in : std_logic := '0';

 	--Outputs
   signal memtoreg_out : std_logic;
   signal memwrite_out : std_logic;
   signal pcsrc_out : std_logic;
   signal alusrc_out : std_logic;
   signal regdst_out : std_logic;
   signal regwrite_out : std_logic;
   signal ALU_control_out : std_logic_vector(2 downto 0);


  -- helper (controls + ALU control)
  signal controller_state : STD_LOGIC_VECTOR(6 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controller PORT MAP (
          opcode_in => opcode_in,
          funct_in => funct_in,
          zero_flag_in => zero_flag_in,
          memtoreg_out => memtoreg_out,
          memwrite_out => memwrite_out,
          pcsrc_out => pcsrc_out,
          alusrc_out => alusrc_out,
          regdst_out => regdst_out,
          regwrite_out => regwrite_out,
          ALU_control_out => ALU_control_out
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      -- insert stimulus here 

      -----------------------------

      -- lw 001 op 
      opcode_in <= "001";
      wait for 10 ns;
      controller_state <= memwrite_out & regwrite_out & alusrc_out & memtoreg_out & ALU_control_out;
      wait for 10 ns;
      assert controller_state = "0111010" report "Wrong value" severity FAILURE;
      
      


      report "!!!!!!! Everything's fine !!!!!!";
      ---------------------------

      wait;
   end process;

END;
