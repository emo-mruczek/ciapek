--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: register_file_map.vhd
-- /___/   /\     Timestamp: Mon Sep  7 12:55:05 2026
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 2I -pcf register_file.pcf -rpw 100 -tpw 0 -ar Structure -tm register_file -w -dir netgen/map -ofmt vhdl -sim register_file_map.ncd register_file_map.vhd 
-- Device	: xa7a100tcsg324-2i (PRELIMINARY 1.07 2013-10-13)
-- Input file	: register_file_map.ncd
-- Output file	: /home/felix/prjcts/ciapek/ciapek/netgen/map/register_file_map.vhd
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
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

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
  signal led0_OBUF_70 : STD_LOGIC; 
  signal dip6_IBUF_71 : STD_LOGIC; 
  signal dip5_IBUF_72 : STD_LOGIC; 
  signal dip4_IBUF_73 : STD_LOGIC; 
  signal dip7_IBUF_74 : STD_LOGIC; 
  signal dip3_IBUF_75 : STD_LOGIC; 
  signal dip2_IBUF_76 : STD_LOGIC; 
  signal dip1_IBUF_77 : STD_LOGIC; 
  signal dip0_IBUF_78 : STD_LOGIC; 
  signal N3 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal ProtoComp2_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal dip1_ProtoComp2_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal dip2_ProtoComp2_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal dip3_ProtoComp2_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal dip4_ProtoComp2_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal dip5_ProtoComp2_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal dip6_ProtoComp2_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal dip7_ProtoComp2_INTERMDISABLE_GND_0 : STD_LOGIC; 
  signal N3_pack_1 : STD_LOGIC; 
begin
  led0_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y137"
    )
    port map (
      I => led0_OBUF_70,
      O => led0
    );
  led1_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y134"
    )
    port map (
      I => '0',
      O => led1
    );
  led2_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y143"
    )
    port map (
      I => '0',
      O => led2
    );
  led3_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y148"
    )
    port map (
      I => '0',
      O => led3
    );
  led4_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y149"
    )
    port map (
      I => '0',
      O => led4
    );
  led5_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y147"
    )
    port map (
      I => '0',
      O => led5
    );
  led6_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y145"
    )
    port map (
      I => '0',
      O => led6
    );
  led7_OBUF : X_OBUF
    generic map(
      LOC => "IOB_X1Y146"
    )
    port map (
      I => '0',
      O => led7
    );
  ProtoComp2_INTERMDISABLE_GND : X_ZERO
    generic map(
      LOC => "IOB_X1Y144"
    )
    port map (
      O => ProtoComp2_INTERMDISABLE_GND_0
    );
  dip0_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y144"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => ProtoComp2_INTERMDISABLE_GND_0,
      O => dip0_IBUF_78,
      I => dip0,
      TPWRGT => '1'
    );
  ProtoComp2_INTERMDISABLE_GND_1 : X_ZERO
    generic map(
      LOC => "IOB_X1Y136"
    )
    port map (
      O => dip1_ProtoComp2_INTERMDISABLE_GND_0
    );
  dip1_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y136"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => dip1_ProtoComp2_INTERMDISABLE_GND_0,
      O => dip1_IBUF_77,
      I => dip1,
      TPWRGT => '1'
    );
  ProtoComp2_INTERMDISABLE_GND_2 : X_ZERO
    generic map(
      LOC => "IOB_X1Y140"
    )
    port map (
      O => dip2_ProtoComp2_INTERMDISABLE_GND_0
    );
  dip2_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y140"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => dip2_ProtoComp2_INTERMDISABLE_GND_0,
      O => dip2_IBUF_76,
      I => dip2,
      TPWRGT => '1'
    );
  ProtoComp2_INTERMDISABLE_GND_3 : X_ZERO
    generic map(
      LOC => "IOB_X1Y141"
    )
    port map (
      O => dip3_ProtoComp2_INTERMDISABLE_GND_0
    );
  dip3_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y141"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => dip3_ProtoComp2_INTERMDISABLE_GND_0,
      O => dip3_IBUF_75,
      I => dip3,
      TPWRGT => '1'
    );
  ProtoComp2_INTERMDISABLE_GND_4 : X_ZERO
    generic map(
      LOC => "IOB_X1Y142"
    )
    port map (
      O => dip4_ProtoComp2_INTERMDISABLE_GND_0
    );
  dip4_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y142"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => dip4_ProtoComp2_INTERMDISABLE_GND_0,
      O => dip4_IBUF_73,
      I => dip4,
      TPWRGT => '1'
    );
  ProtoComp2_INTERMDISABLE_GND_5 : X_ZERO
    generic map(
      LOC => "IOB_X1Y139"
    )
    port map (
      O => dip5_ProtoComp2_INTERMDISABLE_GND_0
    );
  dip5_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y139"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => dip5_ProtoComp2_INTERMDISABLE_GND_0,
      O => dip5_IBUF_72,
      I => dip5,
      TPWRGT => '1'
    );
  ProtoComp2_INTERMDISABLE_GND_6 : X_ZERO
    generic map(
      LOC => "IOB_X1Y138"
    )
    port map (
      O => dip6_ProtoComp2_INTERMDISABLE_GND_0
    );
  dip6_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y138"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => dip6_ProtoComp2_INTERMDISABLE_GND_0,
      O => dip6_IBUF_71,
      I => dip6,
      TPWRGT => '1'
    );
  ProtoComp2_INTERMDISABLE_GND_7 : X_ZERO
    generic map(
      LOC => "IOB_X1Y135"
    )
    port map (
      O => dip7_ProtoComp2_INTERMDISABLE_GND_0
    );
  dip7_IBUF : X_IBUF_INTERMDISABLE_TPWRGT
    generic map(
      LOC => "IOB_X1Y135"
    )
    port map (
      IBUFDISABLE => '0',
      INTERMDISABLE => dip7_ProtoComp2_INTERMDISABLE_GND_0,
      O => dip7_IBUF_74,
      I => dip7,
      TPWRGT => '1'
    );
  N2_N2_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 50 ps
    )
    port map (
      I => N3_pack_1,
      O => N3
    );
  Q_n0035_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X89Y139",
      INIT => X"FFFCFCC3FFFCFCC3"
    )
    port map (
      ADR0 => '1',
      ADR1 => dip3_IBUF_75,
      ADR2 => dip2_IBUF_76,
      ADR3 => dip1_IBUF_77,
      ADR4 => dip0_IBUF_78,
      ADR5 => '1',
      O => N2
    );
  Q_n0035_SW1 : X_LUT5
    generic map(
      LOC => "SLICE_X89Y139",
      INIT => X"FFFFFFFC"
    )
    port map (
      ADR0 => '1',
      ADR1 => dip3_IBUF_75,
      ADR2 => dip2_IBUF_76,
      ADR3 => dip1_IBUF_77,
      ADR4 => dip0_IBUF_78,
      O => N3_pack_1
    );
  Q_n0035 : X_LUT6
    generic map(
      LOC => "SLICE_X89Y139",
      INIT => X"FFFFFFFFFFE9FEE8"
    )
    port map (
      ADR0 => dip6_IBUF_71,
      ADR1 => dip5_IBUF_72,
      ADR2 => dip4_IBUF_73,
      ADR3 => N3,
      ADR4 => N2,
      ADR5 => dip7_IBUF_74,
      O => led0_OBUF_70
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

