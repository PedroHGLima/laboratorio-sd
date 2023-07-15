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
			--A :	in STD_LOGIC_VECTOR (3 downto 0);
			--B :	in STD_LOGIC_VECTOR (3 downto 0);
			--C_in : STD_LOGIC;
           Zop : out  STD_LOGIC_VECTOR (3 downto 0);
			Flg : out STD_LOGIC_VECTOR (3 downto 0)
			);
			
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
           Z : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flags :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end component;

Component subtraction is
    Port ( Xs : in  STD_LOGIC_VECTOR (3 downto 0);
           Ys : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outs : out  STD_LOGIC;
           Zs : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagss :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end component;

Component incremet is
    Port ( Xi : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outi : out  STD_LOGIC;
           Zi : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagsi :out STD_LOGIC_VECTOR (3 downto 0)
		   );
end component;

Component compl is
    Port ( Xcpl : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outcpl : out  STD_LOGIC;
           Zcpl : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagscpl :out STD_LOGIC_VECTOR (3 downto 0)
		   );

Component troca is
    Port ( Xt : in  STD_LOGIC_VECTOR (3 downto 0);
           C_outt : out  STD_LOGIC;
           Zt : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagst :out STD_LOGIC_VECTOR (3 downto 0)
		   );


Component comparador is
    Port ( Xq : in  STD_LOGIC_VECTOR (3 downto 0);
           Yq : in  STD_LOGIC_VECTOR (3 downto 0);
           Zq : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagsq :out STD_LOGIC_VECTOR (3 downto 0)
		   );

Component mod is
    Port ( Xmd : in  STD_LOGIC_VECTOR (3 downto 0);
           Ymd : in  STD_LOGIC_VECTOR (3 downto 0);
           C_inmd : in  STD_LOGIC;
           C_outmd : out  STD_LOGIC;
           Zmd : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagsmd :out STD_LOGIC_VECTOR (3 downto 0)
		   );

Component multiplica is
    Port ( Xm : in  STD_LOGIC_VECTOR (3 downto 0);
           Ym : in  STD_LOGIC_VECTOR (3 downto 0);
           C_inm : in  STD_LOGIC;
           C_outm : out  STD_LOGIC;
           Zm : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagsm :out STD_LOGIC_VECTOR (3 downto 0)
		   );

Component potencia is
    Port ( Xp : in  STD_LOGIC_VECTOR (3 downto 0);
           Yp : in  STD_LOGIC_VECTOR (3 downto 0);
           C_inp : in  STD_LOGIC;
           C_outp : out  STD_LOGIC;
           Zp : out  STD_LOGIC_VECTOR (3 downto 0)
		   Flagsp :out STD_LOGIC_VECTOR (3 downto 0)
		   );


signal A : STD_LOGIC_VECTOR (3 downto 0) := "1100";
signal B : STD_LOGIC_VECTOR (3 downto 0) := "0101";
signal C_in : STD_LOGIC;
--signal S : STD_LOGIC_VECTOR (3 downto 0);

begin
    -- 4 operacoes obrigatorias
    -- Soma
    ADD1: fourbitfa port map(X => A, Y => B, C_in => add_cin, C_out =>add_cout, Z => add_out, Flags => add_flags);

	-- Subtracao
	SUB: subtraction port map(Xs => A, Y => B, C_outs =>sub_cout, Zs => sub_out, Flagss => sub_flags);

	-- Complemento de 2
	COMT: compl port map(Xcpl => A, C_outcpl =>comp_cout, Zcpl => comp_out, Flagscpl => comp_flags);

	-- incremento +1
	INC: incremet port map(Xi => A, C_outi =>inc_cout, Zi => inc_out, Flagsi => inc_flags);

	-- troca de sinal
	TRC: troca port map(Xt => A, C_outt =>trc_cout, Zt => trc_out, Flagst => trc_flags);


	-- 4 operacoes livres
	-- Comparador
	QUAL: comparador port map(Xq => A, Y => B, C_outq =>qual_cout, Zq => qual_out, Flagsq => qual_flags);

	-- Potencia de 2
	POT: potencia port map(Xp => A, Y => B, C_outp =>pot_cout, Zp => pot_out, Flagsp => pot_flags);

	-- mod
	MOD: mod port map(Xmd => A, Ymd => B, C_outmd =>mod_cout, Zmd => mod_out, Flagsmd => mod_flags);

	-- Multiplicacao
	MULT: multiplica port map(Xm => A, Ym => B, C_outm =>mult_cout, Zm => mult_out, Flagsm => mult_flags);

    process(ALU_Control, and_out, or_out, add_out, add_carry_out)
    begin
        case op is
            when "000" => 
			--soma
                Zop <= add_out;
                Flg <= add_flags;

            when "001" =>
			--complemento 2
                Zop <= comp_out;
                Flg <= comp_flags;

            when "010" =>
			--subtração
                Zop <= sub_out;
                Flg <= sub_flags;

			when "011" =>
			--incremento +1
                Zop <= inc_out;
                Flg <= add_flags;
			------------------------------------------
			when "100" =>
			--comparador
                Zop <= qual_out;
                Flg <= qual_flags;
			
			when "101" =>
			--potencia de dois
                Zop <= pot_out;
                Flg <= pot_flags;

			when "110" =>
			--mod
                Zop <= add_out;
                Flg <= add_flags;

			when "111" =>
			--multiplicacao
                Zop <= mult_out;
                Flg <= mult_flags;
			--------------------------------------------
            when others => -- For unsupported operations
                Zop <= (others => '0');
                Flg <= '0000';
        end case;
    end process;

end Behavioral;

end Behavioral;


---commits
--- deixamos o prob do clock p depois 
--- vamos fazer as operações com entrada setada
--- Na subtração precisamos de algo para assinalar que 
--- o resultado é negativo, está em complemento de dois
--- Resolvendo essa problematica devemos conseguir o 
--- comparador bem o comparador

