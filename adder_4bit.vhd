-- Nama         : Saputra Yudika Marpaung
-- NIM          : 13223118
-- Rombongan    : F
-- Kelompok     : 10
-- Tanggal      : 13 Oktober 2024
-- Program      : Adder 4 bit

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

  --Define entity
entity adder_4bit is
    --Define port
    port (
        A, B        : in std_logic_vector(3 downto 0);
        Carry_in    : in std_logic;
        Sum         : out std_logic_vector(3 downto 0);
		Carry_out	  : out std_logic);
end adder_4bit;

--Define architecture
architecture rtl of adder_4bit is
    --Deklarasi pemakaian komponen fulladder kembali
	component fulladder is
		port (
        X, Y, Cin : in  std_logic;
        S, Cout   : out std_logic);
	end component;

--Signal untuk carry antar bit
signal C1, C2, C3 : std_logic;

--Mendefinisikan input dan output full adder per bit secara bertahap
begin
    FA0: fulladder port map (X=>A(0), Y=>B(0), Cin=>Carry_in, S=>Sum(0), Cout=>C1);
    FA1: fulladder port map (X=>A(1), Y=>B(1), Cin=>C1, S=>Sum(1), Cout=>C2);
    FA2: fulladder port map (X=>A(2), Y=>B(2), Cin=>C2, S=>Sum(2), Cout=>C3);
    FA3: fulladder port map (X=>A(3), Y=>B(3), Cin=>C3, S=>Sum(3), Cout=>Carry_out);
end rtl;