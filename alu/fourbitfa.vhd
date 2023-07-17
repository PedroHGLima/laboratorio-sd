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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fourbitfa is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : in  STD_LOGIC_VECTOR (3 downto 0);
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0);
			  Flags : out STD_LOGIC_VECTOR (3 downto 0));
end fourbitfa;

architecture Behavioral of fourbitfa is


Component fa is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

signal c1, c2, c3, c4 : STD_LOGIC;
signal s : STD_LOGIC_VECTOR (3 downto 0);

begin

-- fa de 4 bits e composto de 4 fas de 1 bit
fa0: fa port map(x(0), y(0), C_in, c1, s(0));
fa1: fa port map(x(1), y(1), c1, c2, s(1));
fa2: fa port map(x(2), y(2), c2, c3, s(2));
fa3: fa port map(x(3), y(3), c3, c4, s(3));

Z <= s;
C_out <= c4;

Flags(3) <= '1' when S = "0000" else '0'; 		-- zero
Flags(2) <= not c4 and C_in;							-- negativo
Flags(1) <= c4;											-- cout
Flags(0) <= c4 and (not C_in); 						-- overflow

end Behavioral;
