----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:19:27 06/06/2023 
-- Design Name: 
-- Module Name:    Contador - Behavioral 
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

entity Contador is
    Port ( A : in  STD_LOGIC;
			  N : in STD_LOGIC;
           R : out  STD_LOGIC_VECTOR (3 downto 0));
end Contador;

architecture Behavioral of Contador is

Component fa is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

signal fim : STD_LOGIC_VECTOR (

---Begin
---	if ( N = 1 and ) then
	---	fa port map(A(0), "1", C_in, c1, R(0));

---fa port map(A, "1", C_in, c1, R(0));


begin



end Behavioral;

