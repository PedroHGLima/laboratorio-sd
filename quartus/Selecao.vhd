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
    Port ( Op : in  STD_LOGIC_VECTOR (2 downto 0);
           Zop : out  STD_LOGIC_VECTOR (3 downto 0);
			  Ov : out STD_LOGIC);
			  -- Ov pode ser definido como xor entre Cout(3) e Cout(2)
end Selecao;

architecture Behavioral of Selecao is
	type state_type is (recebe_qqr,recebe_op,mostra_resultado);
	signal state: state_type;

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

signal A : STD_LOGIC_VECTOR (3 downto 0) := "1100";
signal B : STD_LOGIC_VECTOR (3 downto 0) := "0101";
signal X, Y : STD_LOGIC_VECTOR (3 downto 0);
signal C : STD_LOGIC;
signal S : STD_LOGIC_VECTOR (3 downto 0);
signal N : STD_LOGIC;

begin
	process(op) is
	begin
	case op is
	when "000" => 
		--soma
		X <= A;
		Y <= B;
		C <= '0';
		--0001 ov1
	
	when "001" =>
		--complemento 2
		X <= not A;
		Y <= "0000";
		C <= '1';
		--0100
		
	when "010" =>
		--subtração
		X <= A;
		Y <= not B;
		C <= '1';
		--0111
		
	when "011" =>
		--soma 1
		X <= A;
		Y <= "0000";
		C <= '1';
		--1101
		
	----------------------
	
	--when "100" =>
		--Comparador
		--D <= A xor B;
		--Sub <= A - B;
		--if D(3)=
		--X <= R;
		--Y <= "0000";
		--C <= '0';
		
	--when "101" =>
		--X . 2(^Y)
		--Ver se B é maior que 2 3 etc
		--X(3) <= A(2-B(0));
		--X(2) <= A(1-B(0));
		--X(1) <= A(0-B(0));
		--X(0) <= '0';
		--N <= Y;
--		X(3) <= A(2);
--		X(2) <= A(1);
--		X(1) <= A(0);
--		X(0) <= '0';
--		Y <= "0000";
--		C <= '0';
		
	--when "110" =>
		--mod
		
	
	--when "111" =>
		--Multiplicação
	
	when others =>
		X <= "0000";
		Y <= "0000";
		C <= '0';
	
	end case;
	
	end process;
	fulla : fourbitfa port map(X, Y, C, Ov, S);
	Zop <= S;

end Behavioral;


---commits
--- deixamos o prob do clock p depois 
--- vamos fazer as operações com entrada setada
--- Na subtração precisamos de algo para assinalar que 
--- o resultado é negativo, está em complemento de dois
--- Resolvendo essa problematica devemos conseguir o 
--- comparador bem o comparador

