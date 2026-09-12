--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:19:14 09/12/2026
-- Design Name:   
-- Module Name:   /home/felix/prjcts/ciapek/ciapek/instruction_data_memory_tb.vhd
-- Project Name:  ciapek
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instruction_data_memory
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
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
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
