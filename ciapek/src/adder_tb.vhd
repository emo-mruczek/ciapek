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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY adder_tb IS
END adder_tb;
 
ARCHITECTURE behavior OF adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder
    PORT(
         a_in : IN  std_logic_vector(15 downto 0);
         b_in : IN  std_logic_vector(15 downto 0);
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a_in : std_logic_vector(15 downto 0) := (others => '0');
   signal b_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(15 downto 0);

  ----------
  
  constant zero : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
  constant one : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000001";
  constant two : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000010";
  

  ----------
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder PORT MAP (
          a_in => a_in,
          b_in => b_in,
          output => output
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
      -----------------------

      --- 1 + 0 = 1
      a_in <= zero;
      b_in <= one;
      wait for 10 ns;
      assert output = one report "Wrong value: 1 + 0 != 1" severity FAILURE;

      --- 1 + 1 = 2
      a_in <= one;
      wait for 10 ns;
      assert output = two report "Wrong value: 1 + 1 != 2" severity FAILURE;


      report "!!!!!!! Everything's fine !!!!!!";

      -----------------------

      wait;
   end process;

END;
