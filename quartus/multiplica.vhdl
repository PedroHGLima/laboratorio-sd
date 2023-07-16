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

entity multiplica is
    Port ( Xm : in  STD_LOGIC_VECTOR (3 downto 0);
           Ym : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outm : out  STD_LOGIC;
           Zm : out  STD_LOGIC_VECTOR (3 downto 0);
		   Flagsm :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end multiplica;

architecture Behavioral of fourbitfa is


Component fa is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;


signal Adder1_Cout, Adder2_Cout, Adder3_Cout : std_logic;
--para entradas e saidas do component
signal cin : STD_LOGIC;
signal S : STD_LOGIC_VECTOR (3 downto 0); --resultado
signal F : STD_LOGIC_VECTOR (3 downto 0); --flags

begin

    Adder1: fa port map (Xm(0), Ym, '0', Adder1_Cout, S(0));
    Adder2: fa port map (Xm(1), Ym, '0', Adder2_Cout, S(1));
    Adder3: fa port map (Xm(2), Ym, '0', Adder3_Cout, S(2));
    Adder4: fa port map (Xm(3), Ym, '0', '0', S(3));

    Adder5: fa port map ('0', Ym, Adder1_Cout, Adder2_Cout, S(4));
    Adder6: fa port map ('0', Ym, Adder2_Cout, Adder3_Cout, S(5));
    Adder7: fa port map ('0', Ym, Adder3_Cout, '0', S(6));
    Adder8: fa port map ('0', '0', '0', '0', S(7));
    
    C_outm <= cout;
    Zm <= S;
    Flagsm <= F;

end Behavioral;

