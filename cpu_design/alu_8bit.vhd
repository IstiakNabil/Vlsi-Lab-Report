library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_8bit is
    Port (
        A      : in  STD_LOGIC_VECTOR(7 downto 0);   -- ACC
        B      : in  STD_LOGIC_VECTOR(7 downto 0);   -- operand
        OP     : in  STD_LOGIC_VECTOR(1 downto 0);   -- 00 ADD, 01 XOR, 10 SUB, 11 SHR
        RESULT : out STD_LOGIC_VECTOR(7 downto 0)
    );
end alu_8bit;
architecture Structural of alu_8bit is
    component full_adder_8bit
        Port (
            A    : in  STD_LOGIC_VECTOR(7 downto 0);
            B    : in  STD_LOGIC_VECTOR(7 downto 0);
            CIN  : in  STD_LOGIC;
            SUM  : out STD_LOGIC_VECTOR(7 downto 0);
            COUT : out STD_LOGIC
        );
    end component;
    component xor_gate
        Port ( A : in STD_LOGIC; B : in STD_LOGIC; Y : out STD_LOGIC );
    end component;
    signal ARITH_R, XOR_R, SHR_R : STD_LOGIC_VECTOR(7 downto 0);
    signal B_COND       : STD_LOGIC_VECTOR(7 downto 0);  -- B, or ~B when OP(1)='1'
    signal CARRY_UNUSED : STD_LOGIC;
begin
    GEN_LOGIC: for i in 0 to 7 generate
        -- logic XOR: A xor B
        X:  xor_gate port map (A => A(i), B => B(i),  Y => XOR_R(i));
        -- conditional inversion of B: B xor OP(1)
        XC: xor_gate port map (A => B(i), B => OP(1), Y => B_COND(i));
    end generate;
    -- One adder shared by ADD and SUB (CIN = OP(1))
    ADDSUB: full_adder_8bit
        port map (A => A, B => B_COND, CIN => OP(1), SUM => ARITH_R, COUT => CARRY_UNUSED);

    -- SHR : logical shift right by 1
    SHR_R <= '0' & A(7 downto 1);

    with OP select
        RESULT <= ARITH_R when "00",
                  XOR_R   when "01",
                  ARITH_R when "10",
                  SHR_R   when others;
end Structural;