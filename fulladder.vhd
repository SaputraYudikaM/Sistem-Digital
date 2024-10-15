-- Nama         : Saputra Yudika Marpaung
-- NIM          : 13223118
-- Rombongan    : F
-- Kelompok     : 10
-- Tanggal      : 13 Oktober 2024
-- Program      : Full Adder 1 bit

library ieee;
use ieee.std_logic_1164.all;

--Define entity
entity fulladder is
    --Define port
    port (
        X, Y, Cin : in std_logic;
        S,Cout : out std_logic
    );
end fulladder;

--Define architecture
architecture behavioral of fulladder is

begin
    -- Sum adalah hasil penjumlahan dari A, B, dan Cin
    S <= X xor Y xor Cin;

    --Cout aktif jika A dan B sama-sama 1, atau jika Cin aktif
    -- dan hasil XOR dari A dan B juga aktif
    Cout <= (X and Y) or (Cin and (X xor Y));

end architecture;