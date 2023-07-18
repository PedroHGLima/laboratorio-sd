----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:29:38 04/25/2023 
-- Design Name: 
-- Module Name:    fourbitfa - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplica is
    Port ( Xm : in  STD_LOGIC_VECTOR (3 downto 0);
           Ym : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outm : out  STD_LOGIC;
           Zm : out  STD_LOGIC_VECTOR (3 downto 0);
			  Flagsm :out STD_LOGIC_VECTOR (3 downto 0));
end multiplica;

architecture Behavioral of multiplica is

	component fa
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Y : out  STD_LOGIC);	
	end component;
	
	--Definindo termos parciais do produto
	signal pp : STD_LOGIC_VECTOR(8 downto 0);
	
	--Definindo termos parciais da soma
	signal psum : STD_LOGIC_VECTOR (2 downto 0);
	
	--Definindo carries produzidos ao longo das somas parciais
	signal c : STD_LOGIC_VECTOR (5 downto 0);

begin
--Para efeitos de projeto, so seram implementados resultados de 4 bits
--Bit 0:
Zm(0) <= Xm(0) AND Ym(0);

-- Bit 1:
pp(0) <= Xm(1) AND Ym(0);
pp(1) <= Ym(1) AND Xm(0);

FA0 : fa port map (pp(0), pp(1), '0', c(0), Zm(1));

--Bit 2:
pp(2) <= Xm(2) AND Ym(0);
pp(3) <= Ym(1) AND Xm(1);
pp(4) <= Ym(2) AND Xm(0);

FA1 : fa port map (pp(2), pp(3), c(0) , c(1), psum(0));
FA2 : fa port map (psum(0), pp(4), c(1) , c(2), Zm(2));

--Bit 3
pp(5) <= Ym(0) AND Xm(3);
pp(6) <= Ym(1) AND Xm(2);
pp(7) <= Ym(2) AND Xm(1);
pp(8) <= Ym(3) AND Xm(0);

FA3 : fa port map (pp(5), pp(6), c(2) , c(3), psum(1));
FA4 : fa port map (psum(1), pp(7), c(3) , c(4), psum(2));
FA5 : fa port map (psum(2), pp(8), c(4) , c(5), Zm(3));
end Behavioral;
