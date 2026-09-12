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
 
 
ENTITY left_shift_tb IS
END left_shift_tb;
 
ARCHITECTURE behavior OF left_shift_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT left_shift
    PORT(
         input : IN  std_logic_vector(15 downto 0);
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(15 downto 0) := (others => '0');

    --Outputs
   signal output : std_logic_vector(15 downto 0);

  ----------
  
  constant only_zeros : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant only_ones : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
  constant one_shift_result : STD_LOGIC_VECTOR(15 downto 0) := "1111111111111100";
  
  ----------

   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: left_shift PORT MAP (
          input => input,
          output => output
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 


      -----------------



      -- zero shift


      input <= only_zeros;
      wait for 10 ns;
      assert output = only_zeros report "Wrong shift: zero" severity FAILURE;

      ---- one shift

      input <= only_ones;
      wait for 10 ns;
      assert output = one_shift_result report "Wrong shift: ones" severity FAILURE;



      report "!!!!!!! Everything's fine !!!!!!";

      -----------------------


      wait;
   end process;

END;
