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

entity compl is
    Port ( Xcpl : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outcpl : out  STD_LOGIC;
           Zcpl : out  STD_LOGIC_VECTOR (3 downto 0);
           Flagscpl :out STD_LOGIC_VECTOR (3 downto 0));
end compl;

architecture Behavioral of compl is

Component fourbitfa is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : in  STD_LOGIC_VECTOR (3 downto 0);
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0);
			  Flags : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal A, B : STD_LOGIC_VECTOR (3 downto 0);

begin
	-- Complemento a dois e feito com a inversao do numero e incremento +1
	A <= not Xcpl;
	B <= "0000";
	
	ADD1: fourbitfa port map(A, B, '1', C_outcpl, Zcpl, Flagscpl);

end Behavioral;

