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

-- DATE "07/12/2023 18:50:50"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
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
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

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
	Zop : BUFFER std_logic_vector(3 DOWNTO 0);
	Ov : BUFFER std_logic
	);
END Selecao;

-- Design Ports Information
-- Zop[0]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Zop[1]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Zop[2]	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Zop[3]	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ov	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op[0]	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op[2]	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op[1]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL \Zop[0]~output_o\ : std_logic;
SIGNAL \Zop[1]~output_o\ : std_logic;
SIGNAL \Zop[2]~output_o\ : std_logic;
SIGNAL \Zop[3]~output_o\ : std_logic;
SIGNAL \Ov~output_o\ : std_logic;
SIGNAL \Op[0]~input_o\ : std_logic;
SIGNAL \Op[2]~input_o\ : std_logic;
SIGNAL \Mux5~0_combout\ : std_logic;
SIGNAL \Op[1]~input_o\ : std_logic;
SIGNAL \fulla|fa2|Y~0_combout\ : std_logic;
SIGNAL \fulla|fa3|Y~0_combout\ : std_logic;
SIGNAL \fulla|fa3|Cout~0_combout\ : std_logic;
SIGNAL \fulla|fa3|ALT_INV_Cout~0_combout\ : std_logic;
SIGNAL \fulla|fa2|ALT_INV_Y~0_combout\ : std_logic;

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
\fulla|fa3|ALT_INV_Cout~0_combout\ <= NOT \fulla|fa3|Cout~0_combout\;
\fulla|fa2|ALT_INV_Y~0_combout\ <= NOT \fulla|fa2|Y~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y9_N9
\Zop[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Mux5~0_combout\,
	devoe => ww_devoe,
	o => \Zop[0]~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\Zop[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Zop[1]~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\Zop[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fulla|fa2|ALT_INV_Y~0_combout\,
	devoe => ww_devoe,
	o => \Zop[2]~output_o\);

-- Location: IOOBUF_X13_Y0_N2
\Zop[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fulla|fa3|Y~0_combout\,
	devoe => ww_devoe,
	o => \Zop[3]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\Ov~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \fulla|fa3|ALT_INV_Cout~0_combout\,
	devoe => ww_devoe,
	o => \Ov~output_o\);

-- Location: IOIBUF_X0_Y11_N15
\Op[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op(0),
	o => \Op[0]~input_o\);

-- Location: IOIBUF_X0_Y11_N22
\Op[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op(2),
	o => \Op[2]~input_o\);

-- Location: LCCOMB_X3_Y11_N24
\Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux5~0_combout\ = (!\Op[0]~input_o\ & !\Op[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Op[0]~input_o\,
	datad => \Op[2]~input_o\,
	combout => \Mux5~0_combout\);

-- Location: IOIBUF_X0_Y6_N22
\Op[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op(1),
	o => \Op[1]~input_o\);

-- Location: LCCOMB_X1_Y11_N24
\fulla|fa2|Y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fulla|fa2|Y~0_combout\ = (\Op[1]~input_o\) # ((\Op[2]~input_o\) # (!\Op[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op[1]~input_o\,
	datab => \Op[0]~input_o\,
	datad => \Op[2]~input_o\,
	combout => \fulla|fa2|Y~0_combout\);

-- Location: LCCOMB_X6_Y11_N24
\fulla|fa3|Y~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fulla|fa3|Y~0_combout\ = (\Op[1]~input_o\ & !\Op[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op[1]~input_o\,
	datad => \Op[2]~input_o\,
	combout => \fulla|fa3|Y~0_combout\);

-- Location: LCCOMB_X1_Y11_N18
\fulla|fa3|Cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \fulla|fa3|Cout~0_combout\ = (\Op[1]~input_o\) # ((\Op[0]~input_o\) # (\Op[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op[1]~input_o\,
	datab => \Op[0]~input_o\,
	datad => \Op[2]~input_o\,
	combout => \fulla|fa3|Cout~0_combout\);

ww_Zop(0) <= \Zop[0]~output_o\;

ww_Zop(1) <= \Zop[1]~output_o\;

ww_Zop(2) <= \Zop[2]~output_o\;

ww_Zop(3) <= \Zop[3]~output_o\;

ww_Ov <= \Ov~output_o\;
END structure;


