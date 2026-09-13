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
 
ENTITY flipflop_reset_tb IS
END flipflop_reset_tb;
 
ARCHITECTURE behavior OF flipflop_reset_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT flipflop_reset
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         input : IN  std_logic_vector(15 downto 0);
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal input : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(15 downto 0);

 -- end of sim 
  signal sim_end : STD_LOGIC := '0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;


  ---------

   constant reset_val : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
    constant val1 : STD_LOGIC_VECTOR(15 downto 0) := "0000000000001110";
    constant val2 : STD_LOGIC_VECTOR(15 downto 0) := "0000000000011100";

  ----------
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: flipflop_reset PORT MAP (
          clk => clk,
          reset => reset,
          input => input,
          output => output
        );

 -- Clock process definitions
  clk_process :process
    begin

      if sim_end = '0' then 
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
    else 
      wait;
    end if;
end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      -------------

      reset <= '0';

      -- set value

      input <= val1;
      wait for clk_period;

      assert output = val1 report "Not set val1" severity FAILURE; 

      --- input without reset 

      input <= val2;
     wait for clk_period;

      assert output = val2 report "Not set val2" severity FAILURE; 


      --- reset 

      reset <= '1';
      wait for clk_period;
      
      assert output = reset_val report "Did not reset" severity FAILURE;

      -- holding reset 

      reset <= '1';
      input <= val1;
      wait for clk_period;

       assert output = reset_val report "Did not hold reset" severity FAILURE;


      
      report "!!!!!!! Everything's fine !!!!!!";
      sim_end <= '1';

      ---------------------------
      wait;
   end process;

END;
