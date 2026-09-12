--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:19:47 09/12/2026
-- Design Name:   
-- Module Name:   /home/felix/prjcts/ciapek/ciapek/multiplexer_four_tb.vhd
-- Project Name:  ciapek
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: multiplexer_four
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
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
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

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
