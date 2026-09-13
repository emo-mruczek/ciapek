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
 
ENTITY multiplexer_four_tb IS
END multiplexer_four_tb;
 
ARCHITECTURE behavior OF multiplexer_four_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexer_four
    PORT(
         d0_in : IN  std_logic_vector(15 downto 0);
         d1_in : IN  std_logic_vector(15 downto 0);
         d2_in : IN  std_logic_vector(15 downto 0);
         d3_in : IN  std_logic_vector(15 downto 0);
         s_in : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal d0_in : std_logic_vector(15 downto 0) := (others => '0');
   signal d1_in : std_logic_vector(15 downto 0) := (others => '0');
   signal d2_in : std_logic_vector(15 downto 0) := (others => '0');
   signal d3_in : std_logic_vector(15 downto 0) := (others => '0');
   signal s_in : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(15 downto 0);

  ----------
  
  constant zero_result : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000001";
  constant one_result : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000010";
  constant two_result : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000011";
  constant three_result : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000100";

  ----------
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexer_four PORT MAP (
          d0_in => d0_in,
          d1_in => d1_in,
          d2_in => d2_in,
          d3_in => d3_in,
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
      d2_in <= two_result;
      d3_in <= three_result;

      -- choose 0
    
      s_in <= "00"; 
      wait for 10 ns;
      assert output = zero_result report "Wrong choice: 0" severity FAILURE;

      -- choose 1

      s_in <= "01"; 
      wait for 10 ns;
      assert output = one_result report "Wrong choice: 1" severity FAILURE;

      -- choose 2

      s_in <= "10"; 
      wait for 10 ns;
      assert output = two_result report "Wrong choice: 1" severity FAILURE;


      -- choose 3

      s_in <= "11"; 
      wait for 10 ns;
      assert output = three_result report "Wrong choice: 1" severity FAILURE;



      report "!!!!!!! Everything's fine !!!!!!";

      -------------

      wait;
   end process;

END;
