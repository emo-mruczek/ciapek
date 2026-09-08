--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: register_file_translate.vhd
-- /___/   /\     Timestamp: Mon Sep  7 16:31:35 2026
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm register_file -w -dir netgen/translate -ofmt vhdl -sim register_file.ngd register_file_translate.vhd 
-- Device	: 6slx9csg324-3
-- Input file	: register_file.ngd
-- Output file	: /home/felix/prjcts/ciapek/ciapek/netgen/translate/register_file_translate.vhd
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
  signal dip0_IBUF_3 : STD_LOGIC; 
  signal dip1_IBUF_4 : STD_LOGIC; 
  signal dip2_IBUF_5 : STD_LOGIC; 
  signal dip3_IBUF_6 : STD_LOGIC; 
  signal dip4_IBUF_7 : STD_LOGIC; 
  signal dip5_IBUF_8 : STD_LOGIC; 
  signal dip6_IBUF_9 : STD_LOGIC; 
  signal dip7_IBUF_10 : STD_LOGIC; 
  signal button0_BUFGP : STD_LOGIC; 
  signal disp_state_12 : STD_LOGIC; 
  signal disp_nextstate : STD_LOGIC; 
  signal led1_OBUF_14 : STD_LOGIC; 
  signal led3_OBUF_15 : STD_LOGIC; 
  signal led5_OBUF_16 : STD_LOGIC; 
  signal led7_OBUF_17 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal NlwRenamedSig_IO_button0 : STD_LOGIC; 
  signal NlwRenamedSig_IO_dip0 : STD_LOGIC; 
  signal NlwRenamedSig_IO_dip1 : STD_LOGIC; 
  signal NlwRenamedSig_IO_dip2 : STD_LOGIC; 
  signal NlwRenamedSig_IO_dip3 : STD_LOGIC; 
  signal NlwRenamedSig_IO_dip4 : STD_LOGIC; 
  signal NlwRenamedSig_IO_dip5 : STD_LOGIC; 
  signal NlwRenamedSig_IO_dip6 : STD_LOGIC; 
  signal NlwRenamedSig_IO_dip7 : STD_LOGIC; 
  signal clk_IBUF_97 : STD_LOGIC; 
  signal button0_BUFGP_IBUFG_2 : STD_LOGIC; 
  signal NlwInverterSignal_disp_state_G : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal register_choosen : STD_LOGIC_VECTOR ( 10 downto 10 ); 
begin
  NlwRenamedSig_IO_dip0 <= dip0;
  NlwRenamedSig_IO_dip1 <= dip1;
  NlwRenamedSig_IO_dip2 <= dip2;
  NlwRenamedSig_IO_dip3 <= dip3;
  NlwRenamedSig_IO_dip4 <= dip4;
  NlwRenamedSig_IO_dip5 <= dip5;
  NlwRenamedSig_IO_dip6 <= dip6;
  NlwRenamedSig_IO_dip7 <= dip7;
  NlwRenamedSig_IO_button0 <= button0;
  XST_GND : X_ZERO
    port map (
      O => register_choosen(10)
    );
  disp_state : X_LATCHE
    generic map(
      INIT => '0'
    )
    port map (
      I => disp_nextstate,
      CLK => NlwInverterSignal_disp_state_G,
      O => disp_state_12,
      GE => VCC,
      SET => GND,
      RST => GND
    );
  register_choosen_14_SW0 : X_LUT6
    generic map(
      INIT => X"977F7FFF7FFFFFFF"
    )
    port map (
      ADR0 => dip5_IBUF_8,
      ADR1 => dip4_IBUF_7,
      ADR2 => dip3_IBUF_6,
      ADR3 => dip2_IBUF_5,
      ADR4 => dip1_IBUF_4,
      ADR5 => dip0_IBUF_3,
      O => N2
    );
  led3_SW0 : X_LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      ADR0 => dip3_IBUF_6,
      ADR1 => dip2_IBUF_5,
      ADR2 => dip1_IBUF_4,
      ADR3 => dip0_IBUF_3,
      O => N4
    );
  led3_5 : X_LUT6
    generic map(
      INIT => X"0800000000000000"
    )
    port map (
      ADR0 => disp_state_12,
      ADR1 => dip7_IBUF_10,
      ADR2 => dip6_IBUF_9,
      ADR3 => dip5_IBUF_8,
      ADR4 => dip4_IBUF_7,
      ADR5 => N4,
      O => led3_OBUF_15
    );
  led7_6 : X_LUT6
    generic map(
      INIT => X"0400000000000000"
    )
    port map (
      ADR0 => disp_state_12,
      ADR1 => dip7_IBUF_10,
      ADR2 => dip6_IBUF_9,
      ADR3 => dip5_IBUF_8,
      ADR4 => dip4_IBUF_7,
      ADR5 => N4,
      O => led7_OBUF_17
    );
  dip0_IBUF : X_BUF
    port map (
      I => NlwRenamedSig_IO_dip0,
      O => dip0_IBUF_3
    );
  dip1_IBUF : X_BUF
    port map (
      I => NlwRenamedSig_IO_dip1,
      O => dip1_IBUF_4
    );
  dip2_IBUF : X_BUF
    port map (
      I => NlwRenamedSig_IO_dip2,
      O => dip2_IBUF_5
    );
  dip3_IBUF : X_BUF
    port map (
      I => NlwRenamedSig_IO_dip3,
      O => dip3_IBUF_6
    );
  dip4_IBUF : X_BUF
    port map (
      I => NlwRenamedSig_IO_dip4,
      O => dip4_IBUF_7
    );
  dip5_IBUF : X_BUF
    port map (
      I => NlwRenamedSig_IO_dip5,
      O => dip5_IBUF_8
    );
  dip6_IBUF : X_BUF
    port map (
      I => NlwRenamedSig_IO_dip6,
      O => dip6_IBUF_9
    );
  dip7_IBUF : X_BUF
    port map (
      I => NlwRenamedSig_IO_dip7,
      O => dip7_IBUF_10
    );
  Mmux_led111 : X_LUT4
    generic map(
      INIT => X"8AAA"
    )
    port map (
      ADR0 => disp_state_12,
      ADR1 => N2,
      ADR2 => dip7_IBUF_10,
      ADR3 => dip6_IBUF_9,
      O => led1_OBUF_14
    );
  Mmux_led511 : X_LUT4
    generic map(
      INIT => X"4555"
    )
    port map (
      ADR0 => disp_state_12,
      ADR1 => N2,
      ADR2 => dip7_IBUF_10,
      ADR3 => dip6_IBUF_9,
      O => led5_OBUF_16
    );
  disp_nextstate1_INV_0 : X_INV
    port map (
      I => disp_state_12,
      O => disp_nextstate
    );
  clk_IBUF : X_BUF
    port map (
      I => clk,
      O => clk_IBUF_97
    );
  dip0_PULLUP : X_PU
    port map (
      O => NlwRenamedSig_IO_dip0
    );
  dip1_PULLUP : X_PU
    port map (
      O => NlwRenamedSig_IO_dip1
    );
  dip2_PULLUP : X_PU
    port map (
      O => NlwRenamedSig_IO_dip2
    );
  dip3_PULLUP : X_PU
    port map (
      O => NlwRenamedSig_IO_dip3
    );
  dip4_PULLUP : X_PU
    port map (
      O => NlwRenamedSig_IO_dip4
    );
  dip5_PULLUP : X_PU
    port map (
      O => NlwRenamedSig_IO_dip5
    );
  dip6_PULLUP : X_PU
    port map (
      O => NlwRenamedSig_IO_dip6
    );
  dip7_PULLUP : X_PU
    port map (
      O => NlwRenamedSig_IO_dip7
    );
  button0_BUFGP_button0_PULLUP : X_PU
    port map (
      O => NlwRenamedSig_IO_button0
    );
  button0_BUFGP_BUFG : X_CKBUF
    port map (
      I => button0_BUFGP_IBUFG_2,
      O => button0_BUFGP
    );
  button0_BUFGP_IBUFG : X_CKBUF
    port map (
      I => NlwRenamedSig_IO_button0,
      O => button0_BUFGP_IBUFG_2
    );
  led0_OBUF : X_OBUF
    port map (
      I => register_choosen(10),
      O => led0
    );
  led1_OBUF : X_OBUF
    port map (
      I => led1_OBUF_14,
      O => led1
    );
  led2_OBUF : X_OBUF
    port map (
      I => led3_OBUF_15,
      O => led2
    );
  led3_OBUF : X_OBUF
    port map (
      I => led3_OBUF_15,
      O => led3
    );
  led4_OBUF : X_OBUF
    port map (
      I => register_choosen(10),
      O => led4
    );
  led5_OBUF : X_OBUF
    port map (
      I => led5_OBUF_16,
      O => led5
    );
  led6_OBUF : X_OBUF
    port map (
      I => led7_OBUF_17,
      O => led6
    );
  led7_OBUF : X_OBUF
    port map (
      I => led7_OBUF_17,
      O => led7
    );
  NlwInverterBlock_disp_state_G : X_INV
    port map (
      I => button0_BUFGP,
      O => NlwInverterSignal_disp_state_G
    );
  NlwBlock_register_file_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlock_register_file_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

