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
USE IEEE.NUMERIC_STD.ALL;
 
 
ENTITY instruction_data_memory_tb IS
END instruction_data_memory_tb;
 
ARCHITECTURE behavior OF instruction_data_memory_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instruction_data_memory
    PORT(
         ra_in : IN  std_logic_vector(15 downto 0);
         wd_in : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         we_in : IN  std_logic;
         rd_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ra_in : std_logic_vector(15 downto 0) := (others => '0');
   signal wd_in : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal we_in : std_logic := '0';

 	--Outputs
   signal rd_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;

 -- end of sim 
  signal sim_end : STD_LOGIC := '0';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instruction_data_memory PORT MAP (
          ra_in => ra_in,
          wd_in => wd_in,
          clk => clk,
          we_in => we_in,
          rd_out => rd_out
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

      -------------------------

      -- TODO: this tb depends on hardcoded memory value:
        -- signal memory: ram_type := (
        --  0 => "11111111",
        --   1 => "10101010", 
        --  others => (others => '0') 
        -- );

      ---- quick read check from constant written data into instructions
      -- TODO: an actuall testbench
      
      ra_in <= "0000000000000000"; -- simulating sign-extension
      wait for clk_period;
      assert rd_out = "1111111110101010" report "Wrong value: address 0" severity FAILURE;

      -- load something to 2 address of RAM
      -- assuming the sw has correct offset
     
      -- https://electronics.stackexchange.com/questions/4482/vhdl-converting-from-an-integer-type-to-a-std-logic-vector
      ra_in <= STD_LOGIC_VECTOR(TO_UNSIGNED((2 + 256), ra_in'length)); 
      wait for clk_period;
      assert rd_out = "0000000000000000" report "Wrong value: address 2 + 256" severity FAILURE;
      
      we_in <= '1';
      wd_in <= "1110001100011100";
      wait for clk_period;
      we_in <= '0';
      assert rd_out = "1110001100011100" report "Wrong value: address 2 + 256 after write" severity FAILURE;


      report "!!!!!!! Everything's fine !!!!!!";
      sim_end <= '1';

      ---------------------------

      wait;
   end process;

END;
