-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"

-- DATE "07/16/2023 12:52:25"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL a_aALTERA_ASDO_DATA1_a_apadout : std_logic;
SIGNAL a_aALTERA_FLASH_nCE_nCSO_a_apadout : std_logic;
SIGNAL a_aALTERA_DATA0_a_apadout : std_logic;
SIGNAL a_aALTERA_ASDO_DATA1_a_aibuf_o : std_logic;
SIGNAL a_aALTERA_FLASH_nCE_nCSO_a_aibuf_o : std_logic;
SIGNAL a_aALTERA_DATA0_a_aibuf_o : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Selecao IS
    PORT (
	Op : IN std_logic_vector(2 DOWNTO 0);
	Zop : OUT std_logic_vector(3 DOWNTO 0);
	Ov : OUT std_logic
	);
END Selecao;

-- Design Ports Information
-- Zop[0]	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Zop[1]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Zop[2]	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Zop[3]	=>  Location: PIN_141,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ov	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op[2]	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op[0]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op[1]	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Selecao IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Op : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Zop : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_Ov : std_logic;
SIGNAL Zop_a0_a_aoutput_o : std_logic;
SIGNAL Zop_a1_a_aoutput_o : std_logic;
SIGNAL Zop_a2_a_aoutput_o : std_logic;
SIGNAL Zop_a3_a_aoutput_o : std_logic;
SIGNAL Ov_aoutput_o : std_logic;
SIGNAL Op_a2_a_ainput_o : std_logic;
SIGNAL Op_a1_a_ainput_o : std_logic;
SIGNAL Op_a0_a_ainput_o : std_logic;
SIGNAL Mux1_a0_combout : std_logic;
SIGNAL Mux6_a0_combout : std_logic;
SIGNAL fulla_afa2_aY_a0_combout : std_logic;
SIGNAL fulla_afa3_aY_a0_combout : std_logic;
SIGNAL Mux7_a0_combout : std_logic;
SIGNAL ALT_INV_fulla_afa3_aY_a0_combout : std_logic;
SIGNAL ALT_INV_fulla_afa2_aY_a0_combout : std_logic;
SIGNAL ALT_INV_Mux1_a0_combout : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_Op <= Op;
Zop <= ww_Zop;
Ov <= ww_Ov;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
ALT_INV_fulla_afa3_aY_a0_combout <= NOT fulla_afa3_aY_a0_combout;
ALT_INV_fulla_afa2_aY_a0_combout <= NOT fulla_afa2_aY_a0_combout;
ALT_INV_Mux1_a0_combout <= NOT Mux1_a0_combout;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y7_N2
Zop_a0_a_aoutput : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_Mux1_a0_combout,
	devoe => ww_devoe,
	o => Zop_a0_a_aoutput_o);

-- Location: IOOBUF_X0_Y6_N16
Zop_a1_a_aoutput : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Mux6_a0_combout,
	devoe => ww_devoe,
	o => Zop_a1_a_aoutput_o);

-- Location: IOOBUF_X0_Y8_N16
Zop_a2_a_aoutput : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_fulla_afa2_aY_a0_combout,
	devoe => ww_devoe,
	o => Zop_a2_a_aoutput_o);

-- Location: IOOBUF_X5_Y24_N9
Zop_a3_a_aoutput : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_fulla_afa3_aY_a0_combout,
	devoe => ww_devoe,
	o => Zop_a3_a_aoutput_o);

-- Location: IOOBUF_X0_Y9_N9
Ov_aoutput : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Mux7_a0_combout,
	devoe => ww_devoe,
	o => Ov_aoutput_o);

-- Location: IOIBUF_X0_Y11_N15
Op_a2_a_ainput : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op(2),
	o => Op_a2_a_ainput_o);

-- Location: IOIBUF_X0_Y18_N22
Op_a1_a_ainput : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op(1),
	o => Op_a1_a_ainput_o);

-- Location: IOIBUF_X0_Y11_N22
Op_a0_a_ainput : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op(0),
	o => Op_a0_a_ainput_o);

-- Location: LCCOMB_X5_Y11_N24
Mux1_a0 : cycloneive_lcell_comb
-- Equation(s):
-- Mux1_a0_combout = (Op_a2_a_ainput_o) # ((!Op_a1_a_ainput_o & Op_a0_a_ainput_o))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Op_a2_a_ainput_o,
	datac => Op_a1_a_ainput_o,
	datad => Op_a0_a_ainput_o,
	combout => Mux1_a0_combout);

-- Location: LCCOMB_X5_Y11_N26
Mux6_a0 : cycloneive_lcell_comb
-- Equation(s):
-- Mux6_a0_combout = (!Op_a2_a_ainput_o & (Op_a1_a_ainput_o & !Op_a0_a_ainput_o))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Op_a2_a_ainput_o,
	datac => Op_a1_a_ainput_o,
	datad => Op_a0_a_ainput_o,
	combout => Mux6_a0_combout);

-- Location: LCCOMB_X5_Y11_N4
fulla_afa2_aY_a0 : cycloneive_lcell_comb
-- Equation(s):
-- fulla_afa2_aY_a0_combout = (Op_a2_a_ainput_o) # ((!Op_a1_a_ainput_o & !Op_a0_a_ainput_o))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Op_a2_a_ainput_o,
	datac => Op_a1_a_ainput_o,
	datad => Op_a0_a_ainput_o,
	combout => fulla_afa2_aY_a0_combout);

-- Location: LCCOMB_X5_Y11_N6
fulla_afa3_aY_a0 : cycloneive_lcell_comb
-- Equation(s):
-- fulla_afa3_aY_a0_combout = (Op_a2_a_ainput_o) # ((!Op_a0_a_ainput_o) # (!Op_a1_a_ainput_o))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Op_a2_a_ainput_o,
	datac => Op_a1_a_ainput_o,
	datad => Op_a0_a_ainput_o,
	combout => fulla_afa3_aY_a0_combout);

-- Location: LCCOMB_X4_Y11_N24
Mux7_a0 : cycloneive_lcell_comb
-- Equation(s):
-- Mux7_a0_combout = (!Op_a0_a_ainput_o & !Op_a2_a_ainput_o)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Op_a0_a_ainput_o,
	datac => Op_a2_a_ainput_o,
	combout => Mux7_a0_combout);

ww_Zop(0) <= Zop_a0_a_aoutput_o;

ww_Zop(1) <= Zop_a1_a_aoutput_o;

ww_Zop(2) <= Zop_a2_a_aoutput_o;

ww_Zop(3) <= Zop_a3_a_aoutput_o;

ww_Ov <= Ov_aoutput_o;
END structure;


