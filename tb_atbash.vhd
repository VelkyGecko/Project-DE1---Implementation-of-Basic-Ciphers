library ieee;
use ieee.std_logic_1164.all;

entity tb_atbash is
end tb_atbash;

architecture tb of tb_atbash is

    component atbash
        port (en     : in std_logic;
              input  : in std_logic_vector (4 downto 0);
              output : out std_logic_vector (4 downto 0));
    end component;

    signal en     : std_logic;
    signal input  : std_logic_vector (4 downto 0);
    signal output : std_logic_vector (4 downto 0);

begin

    dut : atbash
    port map (en     => en,
              input  => input,
              output => output);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        en <= '1';
        input <= "00000"; --a =>z
        wait for 50 ns;
        input <= "00001"; --b =>y
        wait for 100 ns;
        input <= "00101"; --f =>u
        wait for 100 ns;
        input <= "00111"; --h =>s
        wait for 100 ns;
        input <= "01101"; --n =>m
        wait for 100 ns;


        wait;
    end process;

end tb;