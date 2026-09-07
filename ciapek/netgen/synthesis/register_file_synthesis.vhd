--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: register_file_synthesis.vhd
-- /___/   /\     Timestamp: Mon Sep  7 12:54:04 2026
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm register_file -w -dir netgen/synthesis -ofmt vhdl -sim register_file.ngc register_file_synthesis.vhd 
-- Device	: xa7a100t-2I-csg324
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
    switch0 : in STD_LOGIC := 'X'; 
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
  signal dip0_IBUF_0 : STD_LOGIC; 
  signal dip1_IBUF_1 : STD_LOGIC; 
  signal dip2_IBUF_2 : STD_LOGIC; 
  signal dip3_IBUF_3 : STD_LOGIC; 
  signal dip4_IBUF_4 : STD_LOGIC; 
  signal dip5_IBUF_5 : STD_LOGIC; 
  signal dip6_IBUF_6 : STD_LOGIC; 
  signal dip7_IBUF_7 : STD_LOGIC; 
  signal led0_OBUF_8 : STD_LOGIC; 
  signal led7_OBUF_9 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N3 : STD_LOGIC; 
begin
  XST_GND : GND
    port map (
      G => led7_OBUF_9
    );
  Q_n0035_SW0 : LUT4
    generic map(
      INIT => X"FEE9"
    )
    port map (
      I0 => dip3_IBUF_3,
      I1 => dip2_IBUF_2,
      I2 => dip1_IBUF_1,
      I3 => dip0_IBUF_0,
      O => N2
    );
  Q_n0035_SW1 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => dip3_IBUF_3,
      I1 => dip2_IBUF_2,
      I2 => dip1_IBUF_1,
      I3 => dip0_IBUF_0,
      O => N3
    );
  Q_n0035 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFE9FEE8"
    )
    port map (
      I0 => dip6_IBUF_6,
      I1 => dip5_IBUF_5,
      I2 => dip4_IBUF_4,
      I3 => N3,
      I4 => N2,
      I5 => dip7_IBUF_7,
      O => led0_OBUF_8
    );
  dip0_IBUF : IBUF
    port map (
      I => dip0,
      O => dip0_IBUF_0
    );
  dip1_IBUF : IBUF
    port map (
      I => dip1,
      O => dip1_IBUF_1
    );
  dip2_IBUF : IBUF
    port map (
      I => dip2,
      O => dip2_IBUF_2
    );
  dip3_IBUF : IBUF
    port map (
      I => dip3,
      O => dip3_IBUF_3
    );
  dip4_IBUF : IBUF
    port map (
      I => dip4,
      O => dip4_IBUF_4
    );
  dip5_IBUF : IBUF
    port map (
      I => dip5,
      O => dip5_IBUF_5
    );
  dip6_IBUF : IBUF
    port map (
      I => dip6,
      O => dip6_IBUF_6
    );
  dip7_IBUF : IBUF
    port map (
      I => dip7,
      O => dip7_IBUF_7
    );
  led0_OBUF : OBUF
    port map (
      I => led0_OBUF_8,
      O => led0
    );
  led1_OBUF : OBUF
    port map (
      I => led7_OBUF_9,
      O => led1
    );
  led2_OBUF : OBUF
    port map (
      I => led7_OBUF_9,
      O => led2
    );
  led3_OBUF : OBUF
    port map (
      I => led7_OBUF_9,
      O => led3
    );
  led4_OBUF : OBUF
    port map (
      I => led7_OBUF_9,
      O => led4
    );
  led5_OBUF : OBUF
    port map (
      I => led7_OBUF_9,
      O => led5
    );
  led6_OBUF : OBUF
    port map (
      I => led7_OBUF_9,
      O => led6
    );
  led7_OBUF : OBUF
    port map (
      I => led7_OBUF_9,
      O => led7
    );

end Structure;

