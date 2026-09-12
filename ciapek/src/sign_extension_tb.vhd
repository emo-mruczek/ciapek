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
 
ENTITY sign_extension_tb IS
END sign_extension_tb;
 
ARCHITECTURE behavior OF sign_extension_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sign_extension
    PORT(
         input : IN  std_logic_vector(6 downto 0);
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(6 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(15 downto 0);


  ----------
  
  constant only_zeros : STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
  constant only_ones : STD_LOGIC_VECTOR(6 downto 0) := (others => '1');
  constant only_ones_result : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
  constant only_zeros_result : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant one_extend : STD_LOGIC_VECTOR(6 downto 0) := "1000000";
  constant one_extend_result : STD_LOGIC_VECTOR(15 downto 0) := "1111111111000000";
  constant zero_extend : STD_LOGIC_VECTOR(6 downto 0) := "0111111";
  constant zero_extend_result : STD_LOGIC_VECTOR(15 downto 0) := "0000000000111111";

  
  ----------
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sign_extension PORT MAP (
          input => input,
          output => output
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 

      -----------------------

      --- only ones
      input <= only_ones; 
      wait for 10 ns;
      assert output = only_ones_result report "Wrong extension: only ones" severity FAILURE;

      --- only zeros

      input <= only_zeros; 
      wait for 10 ns;
      assert output = only_zeros_result report "Wrong extension: only zeros" severity FAILURE;


      --- one extend 

      input <= one_extend; 
      wait for 10 ns;
      assert output = one_extend_result report "Wrong extension: one" severity FAILURE;

      -- zero extend


      input <= zero_extend; 
      wait for 10 ns;
      assert output = zero_extend_result report "Wrong extension: zero" severity FAILURE;



      report "!!!!!!! Everything's fine !!!!!!";

      -----------------------



      wait;
   end process;

END;
