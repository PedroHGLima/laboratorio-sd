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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
			  Flagsm :out STD_LOGIC_VECTOR (3 downto 0));
end multiplica;

architecture Behavioral of multiplica is

component fourbitfa is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : in  STD_LOGIC_VECTOR (3 downto 0);
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0);
			  Flags : out STD_LOGIC_VECTOR (3 downto 0));	  
end component;

    signal XY: std_logic_vector(15 downto 0);
	 -- Produto P
	 signal P: std_logic_vector(7 downto 0);
-- AND Product terms:
    signal K0, K1, K2:  std_logic_vector (3 downto 0);
-- Y Inputs (B0 has three bits of AND product)
    signal conn0, conn1, conn2:  std_logic_vector (3 downto 0);

begin
    XY(0)<= Xm(0) and Ym(0);
	 XY(1)<= Xm(1) and Ym(0);
	 XY(2)<= Xm(2) and Ym(0);
	 XY(3)<= Xm(3) and Ym(0);
	 
    XY(4)<= Xm(0) and Ym(1);
	 XY(5)<= Xm(1) and Ym(1);
	 XY(6)<= Xm(2) and Ym(1);
	 XY(7)<= Xm(3) and Ym(1);
	
    XY(8)<= Xm(0) and Ym(2);
	 XY(9)<= Xm(1) and Ym(2);
	 XY(10)<= Xm(2) and Ym(2);
	 XY(11)<= Xm(3) and Ym(2);
	 
    XY(12)<= Xm(0) and Ym(3);
	 XY(13)<= Xm(1) and Ym(3);
	 XY(14)<= Xm(2) and Ym(3);
	 XY(15)<= Xm(3) and Ym(3);
	 
	 K0 <= (XY(7),XY(6),XY(5),XY(4));
	 K1 <= (XY(11),XY(10),XY(9),XY(8));
	 K2 <= (XY(15),XY(14),XY(13),XY(12));
	 conn0 <= ('0',XY(3),XY(2),XY(1));
	 
	 P(0) <= XY(0);
	 
FBM1: fourbitfa port map ( X=>K0,Y=>conn0,C_in=>'0',
                                   C_out=>conn1(3),
                                   Z(3)=>conn1(2),Z(2)=>conn1(1)
											  ,Z(1)=>conn1(0),Z(0)=>P(1));
											
FBM2: fourbitfa port map ( X=>K1,Y=>conn1,C_in=>'0',
                                   C_out=>conn2(3),
                                   Z(3)=>conn2(2),Z(2)=>conn2(1)
											  ,Z(1)=>conn2(0),Z(0)=>P(2));
											  
FBM3: fourbitfa port map ( X=>K2,Y=>conn2,C_in=>'0',
                                   C_out=>P(7),
                                   Z => P(6 downto 3)
											  );
											  
Zm(0) <= P(0);
Zm(1) <= P(1);
Zm(2) <= P(2);
Zm(3) <= P(3);

-- conferindo overflow											  
Flagsm(0) <= '1' when P > "00001111" else '0';

-- conferind zero
Flagsm(3) <= '1' when P = "00000000" else '0';

--cout
Flagsm(1) <= '0';

--negativo
Flagsm(2) <= Xm(3) xor Ym(3);

end Behavioral;