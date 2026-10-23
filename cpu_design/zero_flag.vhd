library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_flag is
    Port (
        A     : in  STD_LOGIC_VECTOR(7 downto 0);
        ZERO  : out STD_LOGIC
    );
end zero_flag;

architecture Structural_NOR of zero_flag is
    component nor_gate
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;
    component and_gate
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;
    signal G1, G2, G3, G4 : STD_LOGIC;
    signal G5, G6         : STD_LOGIC;
begin
    NOR1: nor_gate port map (A => A(0), B => A(1), Y => G1);
    NOR2: nor_gate port map (A => A(2), B => A(3), Y => G2);
    NOR3: nor_gate port map (A => A(4), B => A(5), Y => G3);
    NOR4: nor_gate port map (A => A(6), B => A(7), Y => G4);
    AND5: and_gate port map (A => G1, B => G2, Y => G5);
    AND6: and_gate port map (A => G3, B => G4, Y => G6);
    AND7: and_gate port map (A => G5, B => G6, Y => ZERO);
end Structural_NOR;