--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: register_file_synthesis.vhd
-- /___/   /\     Timestamp: Mon Sep  7 16:34:42 2026
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm register_file -w -dir netgen/synthesis -ofmt vhdl -sim register_file.ngc register_file_synthesis.vhd 
-- Device	: xc6slx9-3-csg324
-- Input file	: register_file.ngc
-- Output file	: /home/felix/prjcts/ciapek/ciapek/netgen/synthesis/register_file_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: register_file
-- Xilinx	: /home/felix/prjcts/ise/ise/14.7/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity register_file is
  port (
    clk : in STD_LOGIC := 'X'; 
    we3_in : in STD_LOGIC := 'X'; 
    dip0 : in STD_LOGIC := 'X'; 
    dip1 : in STD_LOGIC := 'X'; 
    dip2 : in STD_LOGIC := 'X'; 
    dip3 : in STD_LOGIC := 'X'; 
    dip4 : in STD_LOGIC := 'X'; 
    dip5 : in STD_LOGIC := 'X'; 
    dip6 : in STD_LOGIC := 'X'; 
    dip7 : in STD_LOGIC := 'X'; 
    button0 : in STD_LOGIC := 'X'; 
    led0 : out STD_LOGIC; 
    led1 : out STD_LOGIC; 
    led2 : out STD_LOGIC; 
    led3 : out STD_LOGIC; 
    led4 : out STD_LOGIC; 
    led5 : out STD_LOGIC; 
    led6 : out STD_LOGIC; 
    led7 : out STD_LOGIC; 
    ra1_in : in STD_LOGIC_VECTOR ( 2 downto 0 ); 
    ra2_in : in STD_LOGIC_VECTOR ( 2 downto 0 ); 
    ra3_in : in STD_LOGIC_VECTOR ( 2 downto 0 ); 
    wd3_in : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    rd1_out : out STD_LOGIC_VECTOR ( 15 downto 0 ); 
    rd2_out : out STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end register_file;

architecture Structure of register_file is
  signal clk_BUFGP_0 : STD_LOGIC; 
  signal dip0_IBUF_1 : STD_LOGIC; 
  signal dip1_IBUF_2 : STD_LOGIC; 
  signal dip2_IBUF_3 : STD_LOGIC; 
  signal dip3_IBUF_4 : STD_LOGIC; 
  signal dip4_IBUF_5 : STD_LOGIC; 
  signal dip5_IBUF_6 : STD_LOGIC; 
  signal dip6_IBUF_7 : STD_LOGIC; 
  signal dip7_IBUF_8 : STD_LOGIC; 
  signal button0_IBUF_9 : STD_LOGIC; 
  signal disp_state_10 : STD_LOGIC; 
  signal disp_nextstate : STD_LOGIC; 
  signal led1_OBUF_12 : STD_LOGIC; 
  signal led3_OBUF_13 : STD_LOGIC; 
  signal led5_OBUF_14 : STD_LOGIC; 
  signal led7_OBUF_15 : STD_LOGIC; 
  signal button0_inv : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal register_choosen : STD_LOGIC_VECTOR ( 10 downto 10 ); 
begin
  XST_GND : GND
    port map (
      G => register_choosen(10)
    );
  disp_state : FDE
    port map (
      C => clk_BUFGP_0,
      CE => button0_inv,
      D => disp_nextstate,
      Q => disp_state_10
    );
  register_choosen_14_SW0 : LUT6
    generic map(
      INIT => X"977F7FFF7FFFFFFF"
    )
    port map (
      I0 => dip5_IBUF_6,
      I1 => dip4_IBUF_5,
      I2 => dip3_IBUF_4,
      I3 => dip2_IBUF_3,
      I4 => dip1_IBUF_2,
      I5 => dip0_IBUF_1,
      O => N2
    );
  led3_SW0 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => dip3_IBUF_4,
      I1 => dip2_IBUF_3,
      I2 => dip1_IBUF_2,
      I3 => dip0_IBUF_1,
      O => N4
    );
  led3_5 : LUT6
    generic map(
      INIT => X"0800000000000000"
    )
    port map (
      I0 => disp_state_10,
      I1 => dip7_IBUF_8,
      I2 => dip6_IBUF_7,
      I3 => dip5_IBUF_6,
      I4 => dip4_IBUF_5,
      I5 => N4,
      O => led3_OBUF_13
    );
  led7_6 : LUT6
    generic map(
      INIT => X"0400000000000000"
    )
    port map (
      I0 => disp_state_10,
      I1 => dip7_IBUF_8,
      I2 => dip6_IBUF_7,
      I3 => dip5_IBUF_6,
      I4 => dip4_IBUF_5,
      I5 => N4,
      O => led7_OBUF_15
    );
  dip0_IBUF : IBUF
    port map (
      I => dip0,
      O => dip0_IBUF_1
    );
  dip1_IBUF : IBUF
    port map (
      I => dip1,
      O => dip1_IBUF_2
    );
  dip2_IBUF : IBUF
    port map (
      I => dip2,
      O => dip2_IBUF_3
    );
  dip3_IBUF : IBUF
    port map (
      I => dip3,
      O => dip3_IBUF_4
    );
  dip4_IBUF : IBUF
    port map (
      I => dip4,
      O => dip4_IBUF_5
    );
  dip5_IBUF : IBUF
    port map (
      I => dip5,
      O => dip5_IBUF_6
    );
  dip6_IBUF : IBUF
    port map (
      I => dip6,
      O => dip6_IBUF_7
    );
  dip7_IBUF : IBUF
    port map (
      I => dip7,
      O => dip7_IBUF_8
    );
  button0_IBUF : IBUF
    port map (
      I => button0,
      O => button0_IBUF_9
    );
  led0_OBUF : OBUF
    port map (
      I => register_choosen(10),
      O => led0
    );
  led1_OBUF : OBUF
    port map (
      I => led1_OBUF_12,
      O => led1
    );
  led2_OBUF : OBUF
    port map (
      I => led3_OBUF_13,
      O => led2
    );
  led3_OBUF : OBUF
    port map (
      I => led3_OBUF_13,
      O => led3
    );
  led4_OBUF : OBUF
    port map (
      I => register_choosen(10),
      O => led4
    );
  led5_OBUF : OBUF
    port map (
      I => led5_OBUF_14,
      O => led5
    );
  led6_OBUF : OBUF
    port map (
      I => led7_OBUF_15,
      O => led6
    );
  led7_OBUF : OBUF
    port map (
      I => led7_OBUF_15,
      O => led7
    );
  Mmux_led111 : LUT4
    generic map(
      INIT => X"8AAA"
    )
    port map (
      I0 => disp_state_10,
      I1 => N2,
      I2 => dip7_IBUF_8,
      I3 => dip6_IBUF_7,
      O => led1_OBUF_12
    );
  Mmux_led511 : LUT4
    generic map(
      INIT => X"4555"
    )
    port map (
      I0 => disp_state_10,
      I1 => N2,
      I2 => dip7_IBUF_8,
      I3 => dip6_IBUF_7,
      O => led5_OBUF_14
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_0
    );
  disp_nextstate1_INV_0 : INV
    port map (
      I => disp_state_10,
      O => disp_nextstate
    );
  button0_inv1_INV_0 : INV
    port map (
      I => button0_IBUF_9,
      O => button0_inv
    );

end Structure;

