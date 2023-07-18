----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:08:04 06/06/2023 
-- Design Name: 
-- modnule Name:    Selecao - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Selecao is
    Port ( Op : in  STD_LOGIC_VECTOR (2 downto 0);
			  CLOCK_50: in STD_LOGIC;
           Zop : out  STD_LOGIC_VECTOR (3 downto 0);
			  Flg : out STD_LOGIC_VECTOR (3 downto 0));
end Selecao;
-- Flags sao (Zero, negativo, carry out, overflow)

architecture Behavioral of Selecao is

-- Declaracao do modulo do contador, utilizado para conseguir os inputs
Component counter_seconds is
--    generic(t_max : integer := 100000000);		-- tempo real (~2s)
	 generic(t_max : integer := 10);					-- tempo teste
    port(CLOCK_50: in std_logic;
    counter_out: out unsigned(3 downto 0) := "0000"
    );
end component;

-- Declaracao do fulladder de 4 bits, que sera usado na adicao
Component fourbitfa is
    Port ( X : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : in  STD_LOGIC_VECTOR (3 downto 0);
           C_in : in  STD_LOGIC;
           C_out : out  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (3 downto 0);
		     Flags :out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Declaracao do modulo de complemento a dois
Component compl is
    Port ( Xcpl : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outcpl : out  STD_LOGIC;
           Zcpl : out  STD_LOGIC_VECTOR (3 downto 0);
           Flagscpl :out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Declaracao do modulo de subtracao
component subtraction is
    Port ( Xs : in  STD_LOGIC_VECTOR (3 downto 0);
           Ys : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outs : out  STD_LOGIC;
           Zs : out  STD_LOGIC_VECTOR (3 downto 0);
		   Flagss :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end component;

-- Declaracao do modulo de incremento +1
Component increment is
    Port ( Xi : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outi : out  STD_LOGIC;
           Zi : out  STD_LOGIC_VECTOR (3 downto 0);
           Flagsi :out STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Declaracao do modulo comparador
Component comparador is
    Port ( Xq : in  STD_LOGIC_VECTOR (3 downto 0);
           Yq : in  STD_LOGIC_VECTOR (3 downto 0);
           Zq : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Declaracao do modulo AND
Component MyAND is
	Port ( Xand : in  STD_LOGIC_VECTOR (3 downto 0);
           Yand : in  STD_LOGIC_VECTOR (3 downto 0);
           Zand : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Declaracao do modulo XOR
Component MyXOR is
    Port ( Xxor : in  STD_LOGIC_VECTOR (3 downto 0);
           Yxor : in  STD_LOGIC_VECTOR (3 downto 0);
           Zxor : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

-- Declaracao do modulo multiplicador
Component multiplica is
    Port ( Xm : in  STD_LOGIC_VECTOR (3 downto 0);
           Ym : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outm : out  STD_LOGIC;
           Zm : out  STD_LOGIC_VECTOR (3 downto 0);
		   Flagsm :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end component;

-- Declaracao dos sinais onde serao armazenados os resultados dos modulos
signal A : STD_LOGIC_VECTOR (3 downto 0);
signal B : STD_LOGIC_VECTOR (3 downto 0);

signal counter_val0 : unsigned (3 downto 0);
signal counter_val1 : unsigned (3 downto 0);
signal CLOCK_B : STD_LOGIC;

signal add_out, add_flags, sub_out, sub_flags, comp_out, comp_flags, inc_out, inc_flags, qual_out, qual_flags, mult_out, mult_flags, xor_out, and_out : STD_LOGIC_VECTOR (3 downto 0);
signal add_cin, add_cout, sub_cout, comp_cout, inc_cout, mult_cout : STD_LOGIC;
--signal S : STD_LOGIC_VECTOR (3 downto 0);

begin

	counter0: counter_seconds port map(CLOCK_50, counter_val0);
	counter1: counter_seconds port map(CLOCK_B, counter_val1);
	CLOCK_B <= CLOCK_50 when A="1111";
	A <= STD_LOGIC_VECTOR(counter_val0);
	B <= STD_LOGIC_VECTOR(counter_val1);
    -- 4 operacoes obrigatorias
	 -------------------------------------------------------------------
    -- Soma
   ADD1: fourbitfa port map(A, B, '0', add_cout, add_out, add_flags);

	-- Complemento de 2
	COMT: compl port map(A, comp_cout, comp_out, comp_flags);

	-- Subtracao
	SUB: subtraction port map(A, B, sub_cout, sub_out, sub_flags);

	-- incremento +1
	INC: increment port map(A, inc_cout, inc_out, inc_flags);
	-------------------------------------------------------------------


	-- 4 operacoes livres
	-------------------------------------------------------------------
	-- Comparador
	QUAL: comparador port map(A, B, qual_out);
	
	-- XOR
	Mmyand: myand port map (A, B, and_out);
	
	-- XOR
	Mmyxor: myxor port map (A, B, xor_out);

	-- Multiplicacao
	MULT: multiplica port map(A, B, mult_cout, mult_out, mult_flags);
	-------------------------------------------------------------------

	process (CLOCK_50) is
   begin
		case op is
		-- verifica qual operacao esta sendo selecionada
			when "000" => 
			--soma
				Zop <= add_out;
				Flg <= add_flags;

			when "001" =>
			--complemento 2
				 Zop <= comp_out;
				 Flg <= comp_flags;

			when "010" =>
			--subtrao
				 Zop <= sub_out;
				 Flg <= sub_flags;

			when "011" =>
			--incremento +1
				Zop <= inc_out;
				Flg <= inc_flags;
			----------------------------------------
			when "100" =>
			--comparador
				Zop <= qual_out;
				Flg <= "0000";

			when "101" =>
			--and
				Zop <= and_out;
				Flg <= "0000";

			when "110" =>
			--xor
				Zop <= xor_out;
				Flg <= "0000";

			when "111" =>
			--multiplicacao
				Zop <= mult_out;
				Flg <= mult_flags;
			--------------------------------------------
			when others =>
			--caso de erro
				Zop <= "0000";
				Flg <= "0000";
        end case;
    end process;
end Behavioral;

