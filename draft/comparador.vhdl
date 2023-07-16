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

entity comparador is
    Port ( Xq : in  STD_LOGIC_VECTOR (3 downto 0);
           Yq : in  STD_LOGIC_VECTOR (3 downto 0);
           Zq : out  STD_LOGIC_VECTOR (3 downto 0);
           Flagsq : out STD_LOGIC_VECTOR (3 downto 0)
           );
end comparador;

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

signal cout STD_LOGIC;
signal S STD_LOGIC_VECTOR (3 downto 0);
signal F STD_LOGIC_VECTOR (3 downto 0);

signal D STD_LOGIC_VECTOR (3 downto 0);
signal Sub STD_LOGIC_VECTOR (3 downto 0);
signal R STD_LOGIC_VECTOR (3 downto 0);

begin
    process(A) is
	begin
    when Xq > Uq =>
        S <= "0100"
    when Xq = Uq =>
        S <= "0010"
    when Xq < Uq =>
        S <= "0001"
    end case;

    C_outq <= '0';
    Zq <= S;
    Flagsq <= "0000";

end Behavioral;

