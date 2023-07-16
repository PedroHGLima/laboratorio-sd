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

signal Greater : STD_LOGIC;
signal Equal   : STD_LOGIC;
signal Less    : STD_LOGIC;

begin
    process(Xq, Yq)
    begin
        if Xq > Yq then
            Greater <= '1';
            Equal   <= '0';
            Less    <= '0';
        elsif Xq = Yq then
            Greater <= '0';
            Equal   <= '1';
            Less    <= '0';
        else
            Greater <= '0';
            Equal   <= '0';
            Less    <= '1';
        end if;
    end process;
	 Zq(0) <= Less;
	 Zq(1) <= Equal;
	 Zq(2) <= Greater;

end Behavioral;

