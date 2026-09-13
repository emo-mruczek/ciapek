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
 
ENTITY multiplexer_two_tb IS
END multiplexer_two_tb;
 
ARCHITECTURE behavior OF multiplexer_two_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexer_two
    PORT(
         d0_in : IN  std_logic_vector(15 downto 0);
         d1_in : IN  std_logic_vector(15 downto 0);
         s_in : IN  std_logic;
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d0_in : std_logic_vector(15 downto 0) := (others => '0');
   signal d1_in : std_logic_vector(15 downto 0) := (others => '0');
   signal s_in : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(15 downto 0);

  ----------
  
  constant zero_result : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000001";
  constant one_result : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000010";

  ----------

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexer_two PORT MAP (
          d0_in => d0_in,
          d1_in => d1_in,
          s_in => s_in,
          output => output
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 

      --------------

      d0_in <= zero_result;
      d1_in <= one_result;

      -- choose 0
    
      s_in <= '0'; 
      wait for 10 ns;
      assert output = zero_result report "Wrong choice: 0" severity FAILURE;

      -- choose 1

      s_in <= '1'; 
      wait for 10 ns;
      assert output = one_result report "Wrong choice: 1" severity FAILURE;

      report "!!!!!!! Everything's fine !!!!!!";

      -------------

      wait;
   end process;

END;
