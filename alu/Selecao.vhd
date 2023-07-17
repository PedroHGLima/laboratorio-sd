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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Selecao is
    Port ( Op : in  STD_LOGIC_VECTOR (2 downto 0);
--			  A :	in STD_LOGIC_VECTOR (3 downto 0);
--			  B :	in STD_LOGIC_VECTOR (3 downto 0);
			  C_in : STD_LOGIC;
           Zop : out  STD_LOGIC_VECTOR (3 downto 0);
			  Flg : out STD_LOGIC_VECTOR (3 downto 0));
end Selecao;
-- Flags sao (Zero, negativo, carry out, overflow)

architecture Behavioral of Selecao is
	type state_type is (recebe_qqr,recebe_op,mostra_resultado);
	signal state: state_type;

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


--Component modn is
--    Port ( Xmd : in  STD_LOGIC_VECTOR (3 downto 0);
--           Ymd : in  STD_LOGIC_VECTOR (3 downto 0);
--           C_inmd : in  STD_LOGIC;
--           C_outmd : out  STD_LOGIC;
--           Zmd : out  STD_LOGIC_VECTOR (3 downto 0);
--		   Flagsmd :out STD_LOGIC_VECTOR (3 downto 0)
--		   );
--end component;
--
--
--Component multiplica is
--    Port ( Xm : in  STD_LOGIC_VECTOR (3 downto 0);
--           Ym : in  STD_LOGIC_VECTOR (3 downto 0);
--           C_outm : out  STD_LOGIC;
--           Zm : out  STD_LOGIC_VECTOR (3 downto 0);
--		   Flagsm :out STD_LOGIC_VECTOR (3 downto 0)
--		   );
--end component;
--
--
--Component potencia is
--    Port ( Xp : in  STD_LOGIC_VECTOR (3 downto 0);
--           Yp : in  STD_LOGIC_VECTOR (3 downto 0);
--           C_inp : in  STD_LOGIC;
--           C_outp : out  STD_LOGIC;
--           Zp : out  STD_LOGIC_VECTOR (3 downto 0);
--		   Flagsp :out STD_LOGIC_VECTOR (3 downto 0)
--		   );
--end component;

-- Declaracao dos sinais onde serao armazenados os resultados dos modulos
signal A : STD_LOGIC_VECTOR (3 downto 0) := "1100";
signal B : STD_LOGIC_VECTOR (3 downto 0) := "0101";
signal add_out, add_flags, sub_out, sub_flags, comp_out, comp_flags, inc_out, inc_flags, qual_out, qual_flags : STD_LOGIC_VECTOR (3 downto 0);
signal add_cin, add_cout, sub_cout, comp_cout, inc_cout : STD_LOGIC;
--signal S : STD_LOGIC_VECTOR (3 downto 0);

begin
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
--
--	-- Potencia de 2
--	POT: potencia port map(Xp => A, Y => B, C_outp =>pot_cout, Zp => pot_out, Flagsp => pot_flags);
--
--	-- modn
--	MODN: modn port map(Xmd => A, Ymd => B, C_outmd =>modn_cout, Zmd => modn_out, Flagsmd => modn_flags);
--
--	-- Multiplicacao
--	MULT: multiplica port map(Xm => A, Ym => B, C_outm =>mult_cout, Zm => mult_out, Flagsm => mult_flags);
	-------------------------------------------------------------------

	process (op) is
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

--			when "101" =>
--			--potencia de dois
--				Zop <= pot_out;
--				Flg <= pot_flags;
--
--			when "110" =>
--			--modn
--				Zop <= add_out;
--				Flg <= add_flags;
--
--			when "111" =>
--			--multiplicacao
--				Zop <= mult_out;
--				Flg <= mult_flags;
--			--------------------------------------------
			when others =>
			--caso de erro
				Zop <= "0000";
				Flg <= "0000";
        end case;
    end process;
end Behavioral;

