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
 
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         srca_in : IN  std_logic_vector(15 downto 0);
         srcb_in : IN  std_logic_vector(15 downto 0);
         control_in : IN  std_logic_vector(2 downto 0);
         result_out : OUT  std_logic_vector(15 downto 0);
         zero_flag_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal srca_in : std_logic_vector(15 downto 0) := (others => '0');
   signal srcb_in : std_logic_vector(15 downto 0) := (others => '0');
   signal control_in : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal result_out : std_logic_vector(15 downto 0);
   signal zero_flag_out : std_logic;

  
  ----------
  
  constant zero : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant one : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000001";
  constant two : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000010";
  constant three : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000011";

  constant ctr_add: STD_LOGIC_VECTOR(2 downto 0) := "010";
  ----------
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          srca_in => srca_in,
          srcb_in => srcb_in,
          control_in => control_in,
          result_out => result_out,
          zero_flag_out => zero_flag_out
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
      -----------------------

      --- 1 + 2 = 3 zero 0

      srca_in <= one;
      srcb_in <= two;
      control_in <= ctr_add;
      wait for 10 ns;
      assert result_out = three report "Wrong value: 1 + 1 != 2" severity FAILURE;
      assert zero_flag_out = '0' report "Wrong zero flag: 1 + 1 zero 1" severity FAILURE; 

      --- 0 + 0 = 0 zero 1 

      srca_in <= zero;
      srcb_in <= zero;
      control_in <= ctr_add;
      wait for 10 ns;
      assert result_out = zero report "Wrong value: 0 + 0 != 0" severity FAILURE;
      assert zero_flag_out = '1' report "Wrong zero flag: 0 + 0 zero 0" severity FAILURE; 

      report "!!!!!!! Everything's fine !!!!!!";

      -----------------------

      wait;
   end process;

END;
