library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

-- two read ports (ra1, ra2) and one write port (ra3)
-- each specifies one of the 7 registers
entity register_file is
    Port ( clk : in  STD_LOGIC;
           we3_in : in  STD_LOGIC; -- write enable
	   ra1_in : in  STD_LOGIC_VECTOR (2 downto 0);
           ra2_in : in  STD_LOGIC_VECTOR (2 downto 0);
           ra3_in : in  STD_LOGIC_VECTOR (2 downto 0);
           wd3_in : in  STD_LOGIC_VECTOR (15 downto 0); -- write data
           rd1_out : out  STD_LOGIC_VECTOR (15 downto 0);
           rd2_out : out  STD_LOGIC_VECTOR (15 downto 0);
           -- for debugging on MIMASv2
           dip0, dip1, dip2, dip3, dip4, dip5, dip6, dip7 : in STD_LOGIC;
           led0, led1, led2, led3, led4, led5, led6, led7 : out STD_LOGIC;
           switch0 : in STD_LOGIC);
end register_file;

architecture Behavioral of register_file is

-- register/ram
type registers_type is array (15 downto 0) of STD_LOGIC_VECTOR (15 downto 0);
signal registers: registers_type; -- internal var

begin

-- -- writting on rising edge
-- -- in processes signals keep theri old value
-- -- until an event in the sens. list takes place
-- process(clk) begin 
-- if clk'event and clk = '1' then -- RISING_EDGE(clk)
-- 	if we3_in = '1' then
-- 		registers(CONV_INTEGER(ra3_in)) <= wd3_in;
-- 	end if;
-- end if;
-- end process;
--
-- -- reading 
-- -- clock doesnt matter
-- process(ra1_in, ra2_in) begin
-- 	-- reg 0 always 0
-- 	if (CONV_INTEGER(ra1_in) = 0) then
-- 		rd1_out <= (others => '0');
-- 	else
-- 		rd1_out <= registers(CONV_INTEGER(ra1_in));
-- 	end if;
--
-- 	-- for both ports
-- 	if (CONV_INTEGER(ra2_in) = 0) then
-- 		rd2_out <= (others => '0');
-- 	else
-- 		rd2_out <= registers(CONV_INTEGER(ra2_in));
-- 	end if;
-- end process;

-- TODO: only one dip switch up
process(dip0, dip1, dip2, dip3, dip4, dip5, dip6, dip7)
  -- variables can only be used inside processes 
  -- TODO: check whether is it right
  variable registers_choice : STD_LOGIC_VECTOR(7 downto 0);
  variable register_choosen : STD_LOGIC_VECTOR(15 downto 0);
begin
  registers_choice := dip0 & dip1& dip2 & dip3 & dip4 & dip5 & dip6 & dip7;

  -- DEBUG 
  registers(0) <= "1000000000000001";
  
  -- for now disp only lower bits
  case registers_choice is 
    when "00000001" => register_choosen := registers(0);
    when "00000010" => register_choosen := registers(1);   
    when "00000100" => register_choosen := registers(2);
    when "00001000" => register_choosen := registers(3);
    when "00010000" => register_choosen := registers(4);
    when "00100000" => register_choosen := registers(5);
    when "01000000" => register_choosen := registers(6);
    when "10000000" => register_choosen := registers(7);
    when others => register_choosen := registers(0);
  end case;

  -- disp lb 
  led0 <= register_choosen(0);
  led1 <= register_choosen(1);
  led2 <= register_choosen(2);
  led3 <= register_choosen(3);
  led4 <= register_choosen(4);
  led5 <= register_choosen(5);
  led6 <= register_choosen(6);
  led7 <= register_choosen(7);

end process;



end Behavioral;

