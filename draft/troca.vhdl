----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:29:38 04/25/2023 
-- Design Name: 
-- Module Name:    troca - Behavioral 
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

entity troca is
    Port ( Xt : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outt : out  STD_LOGIC;
           Zt : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagst :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end troca;

architecture Behavioral of troca is


Component compl is
    Port ( Xcpl : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outcpl : out  STD_LOGIC;
           Zcpl : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagscpl :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end component;

Component incremet is
    Port ( Xi : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outi : out  STD_LOGIC;
           Zi : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagsi :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end component;


--para entradas e saidas do component
signal cin STD_LOGIC;
signal S STD_LOGIC_VECTOR (3 downto 0); --resultado
signal F STD_LOGIC_VECTOR (3 downto 0); --flags

--para operacao
signal V STD_LOGIC_VECTOR (3 downto 0);
signal K STD_LOGIC_VECTOR (3 downto 0);
signal R STD_LOGIC_VECTOR (3 downto 0); --resposta

begin

    A <= Xt;
    COMT: compl port map(A, cout, V, K);
    INC: incremet port map(V, cout, S, F);
    -- define as saidas da entidade
    C_outt <= cout;
    Zt <= S;
    Flagst <= F;

end Behavioral;

