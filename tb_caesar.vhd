library ieee;
use ieee.std_logic_1164.all;

entity tb_caesar is
end tb_caesar;

architecture tb of tb_caesar is

    component caesar
        port (en             : in std_logic;
              en_de_cryption : in std_logic;
              input          : in std_logic_vector (4 downto 0);
              output         : out std_logic_vector (4 downto 0));
    end component;

    signal en             : std_logic;
    signal en_de_cryption : std_logic;
    signal input          : std_logic_vector (4 downto 0);
    signal output         : std_logic_vector (4 downto 0);

begin

    dut : caesar
    port map (en             => en,
              en_de_cryption => en_de_cryption,
              input          => input,
              output         => output);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        en <= '1';
        en_de_cryption <= '1';
        input <= "00000"; --a =>
        wait for 50 ns;
        input <= "00001"; --b =>
        wait for 100 ns;
        input <= "00101"; --f =>
        wait for 100 ns;
        input <= "00111"; --h =>
        wait for 100 ns;
        input <= "01101"; --n =>
        wait for 100 ns;
        
        en_de_cryption <= '0';
        input <= "00000"; --a =>
        wait for 50 ns;
        input <= "00001"; --b =>
        wait for 100 ns;
        input <= "00101"; --f =>
        wait for 100 ns;
        input <= "00111"; --h =>
        wait for 100 ns;
        input <= "01101"; --n =>
        wait for 100 ns;


        wait;
    end process;

end tb;