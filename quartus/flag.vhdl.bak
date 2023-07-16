----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:39:03 04/18/2023 
-- Design Name: 
-- Module Name:    somador - Behavioral 
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

entity flag is
    Port ( S : in  STD_LOGIC_VECTOR (3 downto 0);
           Cout : in  STD_LOGIC;
           Flag :out STD_LOGIC_VECTOR (3 downto 0));
end flag;

signal F : STD_LOGIC_VECTOR (3 downto 0);

architecture Behavioral of fa is

begin

    process(A) is
	begin
    when S(3) = '1' =>
        -- negativo
        F <= "0001"
    when S = "0000" =>
        -- resulta zero
        F <= "1000"
    when Cout = '1' =>
        -- carry out
        S <= "0100"
    end case;

    Flag <= F;
    
end Behavioral;

