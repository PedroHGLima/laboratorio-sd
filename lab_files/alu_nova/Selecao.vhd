----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:08:04 06/06/2023 
-- Design Name: 
-- Module Name:    Selecao - Behavioral 
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

entity Selecao is
    Port ( N : in  STD_LOGIC;
           Op : in  STD_LOGIC_VECTOR (3 downto 0);
           Z : out  STD_LOGIC_VECTOR (3 downto 0));
end Selecao;

architecture Behavioral of Selecao is

Component fourbitfa is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : in  STD_LOGIC_VECTOR (3 downto 0);
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

Component fa is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           Y : out  STD_LOGIC);
end component;

signal num: STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal B : STD_LOGIC_VECTOR (3 downto 0) := "0101";
signal n0, n1, n2, n3 : STD_LOGIC;
signal c1, c2, c3, c4 : STD_LOGIC;

begin

fa0: fa port map(num(0), N, "0", c1, n0);
fa1: fa port map(num(1), "0", c1, c2, n1);
fa2: fa port map(num(2), "0", c2, c3, n2);
fa3: fa port map(num(3), "0", c3, c4, n3);

num(0) <= n0;
num(1) <= n1;
num(2) <= n2;
num(3) <= n3;

Z <= num;

--fa0: fa port map(num(0), N, C_in, c1, num(0));
--fa1: fa port map(num(1), "0", c1, c2, num(1));
--fa2: fa port map(num(2), "0", c2, c3, num(2));
--fa3: fa port map(num(3), "0", c3, C_out, num(3));

end Behavioral;

