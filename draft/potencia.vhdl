----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:29:38 04/25/2023 
-- Design Name: 
-- Module Name:    potencia - Behavioral 
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
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity potencia is
    Port ( Xp : in  STD_LOGIC_VECTOR (3 downto 0);
           Yp : in  STD_LOGIC_VECTOR (3 downto 0);
           C_inp : in  STD_LOGIC;
           C_outp : out  STD_LOGIC;
           Zp : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagsp :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end potencia;

architecture Behavioral of potencia is

signal convertido : integer
convertido <= conv_integer(unsigned(Yp))

begin
    process is
    begin
    Zp <= Zp sll convertido  

    end process;


end Behavioral;

