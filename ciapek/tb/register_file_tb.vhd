--------------------------------------------------------------------------------
-- VHDL Test Bench Created by ISE for module: register_file
-- 
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY register_file_tb IS
END register_file_tb;
 
ARCHITECTURE behavior OF register_file_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         clk : IN  std_logic;
         we3_in : IN  std_logic;
         ra1_in : IN  std_logic_vector(2 downto 0);
         ra2_in : IN  std_logic_vector(2 downto 0);
         ra3_in : IN  std_logic_vector(2 downto 0);
         wd3_in : IN  std_logic_vector(15 downto 0);
         rd1_out : OUT  std_logic_vector(15 downto 0);
         rd2_out : OUT  std_logic_vector(15 downto 0);
        button0 : IN STD_LOGIC
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal we3_in : std_logic := '0';
   signal ra1_in : std_logic_vector(2 downto 0) := (others => '0');
   signal ra2_in : std_logic_vector(2 downto 0) := (others => '0');
   signal ra3_in : std_logic_vector(2 downto 0) := (others => '0');
   signal wd3_in : std_logic_vector(15 downto 0) := (others => '0');
   signal button0 : std_logic := '0';


   --Outputs
   signal rd1_out : std_logic_vector(15 downto 0);
   signal rd2_out : std_logic_vector(15 downto 0);

  -- end of sim 
  signal sim_end : STD_LOGIC := '0';


   -- Clock period definitions
   constant clk_period : time := 10 ns;

   ------

    constant reg0_val : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
    constant reg1_val : STD_LOGIC_VECTOR(15 downto 0) := "0000000000001110";
    constant reg2_val : STD_LOGIC_VECTOR(15 downto 0) := "0000000000011100";
    constant reg3_val : STD_LOGIC_VECTOR(15 downto 0) := "0000000000111000";
    constant reg4_val : STD_LOGIC_VECTOR(15 downto 0) := "UUUUUUUUUUUUUUUU";
    constant reg0 : STD_LOGIC_VECTOR(2 downto 0):= "000";
    constant reg1 : STD_LOGIC_VECTOR(2 downto 0):= "001";
    constant reg2 : STD_LOGIC_VECTOR(2 downto 0):= "010";
    constant reg3 : STD_LOGIC_VECTOR(2 downto 0):= "011";
    constant reg4 : STD_LOGIC_VECTOR(2 downto 0):= "100";

   -----

BEGIN
 
  -- Instantiate the Unit Under Test (UUT)
  uut: register_file PORT MAP (
          clk => clk,
          we3_in => we3_in,
          ra1_in => ra1_in,
          ra2_in => ra2_in,
          ra3_in => ra3_in,
          wd3_in => wd3_in,
          rd1_out => rd1_out,
          rd2_out => rd2_out,
          button0 => button0
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
      ---------------------------

      -- writting into the register 1, 2, 3

      ra3_in <= reg1;
      wd3_in <= reg1_val;
      we3_in <= '1';

      wait for clk_period;
      we3_in <= '0';

      ra3_in <= reg2;
      wd3_in <= reg2_val;
      we3_in <= '1';

      wait for clk_period;
      we3_in <= '0';

      ra3_in <= reg3;
      wd3_in <= reg3_val;
      we3_in <= '1';

      wait for clk_period;
      we3_in <= '0';

      -- reading register 1, 2, 3

      ra1_in <= reg1;
      wait for clk_period;
      assert rd1_out = reg1_val report "Wrong value: reg1" severity FAILURE;

      ra1_in <= reg2;
      ra2_in <= reg3;
      wait for clk_period;
      assert rd1_out = reg2_val report "Wrong value: reg2" severity FAILURE;
      assert rd2_out = reg3_val report "Wrong value: reg3" severity FAILURE;

      -- writting into the register 0, 1 

      ra3_in <= reg0;
      wd3_in <= reg1_val;
      we3_in <= '1';
     
      wait for clk_period;
      we3_in <= '0';

      ra3_in <= reg1;
      wd3_in <= reg3_val;
      we3_in <= '1';

      wait for clk_period;
      we3_in <= '0';

      -- reading registers 0 1 2 4

      ra1_in <= reg0;
      ra2_in <= reg1;
      wait for clk_period;

      assert rd1_out = reg0_val report "Wrong value: reg0" severity FAILURE;
      assert rd2_out = reg3_val report "Wrong value: reg1_2" severity FAILURE;

      ra1_in <= reg2;
      ra2_in <= reg4;
      wait for clk_period;

      assert rd1_out = reg2_val report "Wrong value: reg2" severity FAILURE;
      assert rd2_out = reg4_val report "Wrong value: reg4" severity FAILURE;


      report "!!!!!!! Everything's fine !!!!!!";
      sim_end <= '1';

      ---------------------------

      wait;
   end process;

END;
