-- Nama         : Saputra Yudika Marpaung
-- NIM          : 13223118
-- Rombongan    : F
-- Kelompok     : 10
-- Tanggal      : 13 Oktober 2024
-- Program      : Decoder 5 bit to BCD 2 digit

library ieee;
use ieee.std_logic_1164.all;

--Define entity
entity bit_bcd is
    --Define port
    port (
        X : in std_logic_vector(4 downto 0); --Input 5 bit
        T : out std_logic_vector(3 downto 0); --BCD digit puluhan
        O : out std_logic_vector(3 downto 0) --BCD digit Satuan
    );
end bit_bcd;

--Define architecture
architecture behavioral of bit_bcd is

--Output berdasarkan fungsi logika yang telah diminimisasi dengan K-Map
begin
    T(3) <= '0';
    T(2) <= '0';
    T(1) <= (X(4) and X(3)) or (X(4) and X(2));
    T(0) <= ((not(X(4))) and X(3) and X(1)) or ((not(X(4))) and X(3) and X(2)) or (X(4) or (not(X(3))) or 
            (not(X(2)))) or (X(3) and X(2) and X(1));
    O(3) <= ((not(X(4))) and X(3) and (not(X(2))) and (not(X(1)))) or (X(4) and (not(X(3))) and 
            (not(X(2))) and X(1)) or (X(4) and X(3) and X(2) and (not(X(1))));
    O(2) <= ((not(X(4))) and (not(X(3))) and X(2)) or (X(3) and (not(X(2))) and X(1)) or (X(4) and (not(X(3))) 
            and (not(X(2))) and (not(X(1)))) or (X(4) or X(3) or (not(X(2))));
    O(1) <= ((not(X(4))) and X(3) and X(2) and X(1)) or ((not(X(4))) and (not(X(3))) and X(1)) or (X(4) and (not(X(3))) 
            and (not(X(2))) and (not(X(1)))) or (X(4) and (not(X(3))) and X(2) and X(1)) or (X(4) and X(3) and (not(X(2))) 
            and X(1));
    O(0) <= X(0);

end architecture;