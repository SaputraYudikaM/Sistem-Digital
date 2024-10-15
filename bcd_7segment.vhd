-- Nama         : Saputra Yudika Marpaung
-- NIM          : 13223118
-- Rombongan    : F
-- Kelompok     : 10
-- Tanggal      : 13 Oktober 2024
-- Program      : Decoder BCD to 7 Segment

library ieee;
use ieee.std_logic_1164.all;

--Define entity
entity bcd_7segment is
    --Define port
    port (
        X : in std_logic_vector(3 downto 0); --Input BCD 1 digit
        a, b, c, d, e, f, g : out std_logic -- Ouput 7 segment
    );
end bcd_7segment;

--Define architecture
architecture behavioral of bcd_7segment is

--Output berdasarkan fungsi logika yang telah diminimisasi dengan K-Map
begin
    -- Segmen A aktif untuk 0, 2, 3, 5, 6, 7, 8, 9
    a <= X(3) or X(1) or (X(2) xnor X(0));

    -- Segmen B aktif untuk 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    b <= ((not(X(2))) or ((not(X(1))) and (not (X(0)))) or (X(1) and X(0)));

    -- Segmen C aktif untuk 0, 1, 2, 3, 4, 5, 6, 8, 9
    c <= X(3) or X(2) or (not(X(1))) or X(0);

    -- Segmen D aktif untuk 0, 2, 3, 5, 6, 8, 9
    d <= (X(3) or (X(2) and (not(X(1))) and X(0)) or (X(1) and (not(X(0)))) or 
        (X(2) and not(X(0))) or (X(1) and (not(X(2)))));

    -- Segmen E aktif untuk 0, 2, 6, 8
    e <= (X(1) and (not(X(0)))) or ((not(X(2))) and (not(X(0))));

    -- Segmen F aktif untuk 0, 4, 5, 6, 8, 9
    f <= (X(3) or (X(2) and (not(X(0)))) or (X(2) and (not(X(1)))) or 
        ((not(X(1))) and (not(X(0)))));
   
    -- Segmen G aktif untuk 2, 3, 4, 5, 6, 8, 9
    g <= (X(3) or (X(2) and (not(X(1)))) or ((not(X(2))) and X(1)) 
        or (X(2) and (not(X(0)))));

end architecture;