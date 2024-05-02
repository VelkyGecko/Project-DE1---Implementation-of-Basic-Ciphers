library ieee;
use ieee.std_logic_1164.all;

entity tb_vernam is
end tb_vernam;

architecture tb of tb_vernam is

    component vernam
        port (en     : in std_logic;
              input  : in std_logic_vector (5 downto 0);
              output : out std_logic_vector (5 downto 0));
    end component;

    signal en     : std_logic;
    signal input  : std_logic_vector (5 downto 0);
    signal output : std_logic_vector (5 downto 0);

begin

    dut : vernam
    port map (en     => en,
              input  => input,
              output => output);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        en <= '1';
        input <= "000000"; --a =>c
        wait for 50 ns;
        input <= "000001"; --b =>d
        wait for 100 ns;
        input <= "000101"; --f =>h
        wait for 100 ns;
        input <= "000111"; --h =>f
        wait for 100 ns;
        input <= "001101"; --n =>p
        wait for 100 ns;

        wait;
    end process;

end tb;