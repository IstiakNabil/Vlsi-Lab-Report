library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end nor_gate;
architecture Structural of nor_gate is
    component nand_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;
    signal NA, NB : STD_LOGIC;  -- inverted inputs
    signal OR_OUT : STD_LOGIC;  -- A OR B
begin
    -- NOT A and NOT B (NAND with both inputs tied together)
    N1: nand_gate port map (A => A, B => A, Y => NA);
    N2: nand_gate port map (A => B, B => B, Y => NB);
    -- OR = NAND of the inverted inputs
    N3: nand_gate port map (A => NA, B => NB, Y => OR_OUT);

    -- Invert OR to get NOR
    N4: nand_gate port map (A => OR_OUT, B => OR_OUT, Y => Y);
end Structural;