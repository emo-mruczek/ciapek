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
  constant nor_res: STD_LOGIC_VECTOR(15 downto 0) := "1111111111111100";

  constant ctr_add: STD_LOGIC_VECTOR(2 downto 0) := "010";
  constant ctr_or: STD_LOGIC_VECTOR(2 downto 0) := "001";
  constant ctr_and: STD_LOGIC_VECTOR(2 downto 0) := "000";
  constant ctr_xor: STD_LOGIC_VECTOR(2 downto 0) := "100";
  constant ctr_nor: STD_LOGIC_VECTOR(2 downto 0) := "101";
  constant ctr_sub: STD_LOGIC_VECTOR(2 downto 0) := "110";
  constant ctr_slt: STD_LOGIC_VECTOR(2 downto 0) := "111";
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


      --- 2 and 3 = 2 zero 0
      srca_in <= two;
      srcb_in <= three;
      control_in <= ctr_and;
      wait for 10 ns;
      assert result_out = two report "Wrong value: 2 and 3 != 2" severity FAILURE;
      assert zero_flag_out = '0' report "Wrong zero flag: 2 and 3 zero 1" severity FAILURE; 

      --- 2 or 3 = 3 zero 0

      srca_in <= two;
      srcb_in <= three;
      control_in <= ctr_or;
      wait for 10 ns;
      assert result_out = three report "Wrong value: 2 or 3 != 3" severity FAILURE;
      assert zero_flag_out = '0' report "Wrong zero flag: 2 or 3 zero 1" severity FAILURE;


      --- 2 xor 3 = 1 zero 0
      srca_in <= two;
      srcb_in <= three;
      control_in <= ctr_xor;
      wait for 10 ns;
      assert result_out = one report "Wrong value: 2 xor 3 != 1" severity FAILURE;
      assert zero_flag_out = '0' report "Wrong zero flag: 2 xor 3 zero 1" severity FAILURE; 

      --- 2 nor 3 = !3 zero 0

      srca_in <= two;
      srcb_in <= three;
      control_in <= ctr_nor;
      wait for 10 ns;
      assert result_out = nor_res report "Wrong value: 2 nor 3 != not 3" severity FAILURE;
      assert zero_flag_out = '0' report "Wrong zero flag: 2 nor 3 zero 1" severity FAILURE; 

      -- TODO: what would happen if undevflow? what if overflow?

      --- 3 - 2 = 1 zero 0

      srca_in <= three;
      srcb_in <= two;
      control_in <= ctr_sub;
      wait for 10 ns;
      assert result_out = one report "Wrong value: 3 - 2 != 1" severity FAILURE;
      assert zero_flag_out = '0' report "Wrong zero flag: 3 - 2 zero 1" severity FAILURE; 

      --- 3 - 3 = 0 zero 1

      srca_in <= three;
      srcb_in <= three;
      control_in <= ctr_sub;
      wait for 10 ns;
      assert result_out = zero report "Wrong value: 3 - 3 != 0" severity FAILURE;
      assert zero_flag_out = '1' report "Wrong zero flag: 3 - 3 zero 0" severity FAILURE; 

      --- 2 slt 3 = 1 zero 0

      srca_in <= two;
      srcb_in <= three;
      control_in <= ctr_slt;
      wait for 10 ns;
      assert result_out = one report "Wrong value: 2 slt 3 != 1" severity FAILURE;
      assert zero_flag_out = '0' report "Wrong zero flag: 2 slt 3 zero 1" severity FAILURE; 


      --- 3 slt 2 = 0 zero 1

      srca_in <= three;
      srcb_in <= two;
      control_in <= ctr_slt;
      wait for 10 ns;
      assert result_out = zero report "Wrong value: 3 slt 2 != 0" severity FAILURE;
      assert zero_flag_out = '1' report "Wrong zero flag: 3 slt 2 zero 0" severity FAILURE; 

      --- 3 slt 3 = 0 zero 1

      srca_in <= three;
      srcb_in <= three;
      control_in <= ctr_slt;
      wait for 10 ns;
      assert result_out = zero report "Wrong value: 3 slt 3 != 0" severity FAILURE;
      assert zero_flag_out = '1' report "Wrong zero flag: 3 slt 3 zero 0" severity FAILURE; 


      
      
  

      report "!!!!!!! Everything's fine !!!!!!";

      -----------------------

      wait;
   end process;

END;
