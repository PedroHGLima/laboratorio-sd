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

entity mod is
    Port ( Xmd : in  STD_LOGIC_VECTOR (3 downto 0);
           Ymd : in  STD_LOGIC_VECTOR (3 downto 0);
           C_inmd : in  STD_LOGIC;
           C_outmd : out  STD_LOGIC;
           Zmd : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagsmd :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end mod;

architecture Behavioral of fourbitfa is


Component fourbitfa is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : in  STD_LOGIC_VECTOR (3 downto 0);
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flags :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end component;

signal c1, c2, c3 : STD_LOGIC;

begin

--fa0: fa port map(x(0), a(0), C_in, c1, z(0));
--fa1: fa port map(x(1), a(1), c1, c2, z(1));
--fa2: fa port map(x(2), a(2), c2, c3, z(2));
--fa3: fa port map(x(3), a(3), c3, C_out, z(3));

fa0: fa port map(x(0), y(0), C_in, c1, z(0));
fa1: fa port map(x(1), y(1), c1, c2, z(1));
fa2: fa port map(x(2), y(2), c2, c3, z(2));
fa3: fa port map(x(3), y(3), c3, C_out, z(3));

end Behavioral;

