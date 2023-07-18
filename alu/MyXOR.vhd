----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:01 07/18/2023 
-- Design Name: 
-- Module Name:    MyXOR - Behavioral 
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

entity MyXOR is
    Port ( Xxor : in  STD_LOGIC_VECTOR (3 downto 0);
           Yxor : in  STD_LOGIC_VECTOR (3 downto 0);
           Zxor : out  STD_LOGIC_VECTOR (3 downto 0));
end MyXOR;

architecture Behavioral of MyXOR is

begin

	Zxor <= Xxor xor Yxor;

end Behavioral;

