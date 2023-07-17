----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:29:38 04/25/2023 
-- Design Name: 
-- Module Name:    subtraction - Behavioral 
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

entity subtraction is
    Port ( Xs : in  STD_LOGIC_VECTOR (3 downto 0);
           Ys : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outs : out  STD_LOGIC;
           Zs : out  STD_LOGIC_VECTOR (3 downto 0);
		   Flagss :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end subtraction;

architecture Behavioral of subtraction is


Component fourbitfa is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : in  STD_LOGIC_VECTOR (3 downto 0);
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0);
		   Flags :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end component;

--para entradas e saidas do component
signal A, B : STD_LOGIC_VECTOR (3 downto 0);

begin
	-- adicao de A + (-B) em complemento de dois
	-- Adicionamos A + C2(B), fazendo o complemento com o not e Cin=1
	A <= Xs;
	B <= not Ys;
	
	fulla : fourbitfa port map(X => A, Y => B, C_in => '1', C_out => C_outs, Z => Zs, Flags => Flagss);

end Behavioral;

