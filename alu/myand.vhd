----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:34:19 07/18/2023 
-- Design Name: 
-- Module Name:    myand - Behavioral 
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

entity myand is
    Port ( Xand : in  STD_LOGIC_VECTOR (3 downto 0);
           Yand : in  STD_LOGIC_VECTOR (3 downto 0);
           Zand : out  STD_LOGIC_VECTOR (3 downto 0));
end myand;

architecture Behavioral of myand is

begin

Zand <= Xand and Yand;

end Behavioral;

