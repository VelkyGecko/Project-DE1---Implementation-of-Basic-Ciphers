library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bin2seg is
    Port ( input : in STD_LOGIC_VECTOR (4 downto 0); --A 5-bit input which is the binary value to be converted.
           output : out STD_LOGIC_VECTOR (6 downto 0); --A 7-bit which represents the segments of a 7-segment display.
           clear : in STD_LOGIC);
end bin2seg;

architecture Behavioral of bin2seg is
signal temp : STD_LOGIC_VECTOR (6 downto 0); --A 7-bit signal used to hold the intermediate display codes for the 7-segment display.
begin
    process (clear, input)
    begin
    if (clear = '1') then
    temp <= "1111111";  -- Clear the display
    else
        case input is
            when b"00000" =>   -- 0
            temp <= "0001000"; -- a
            when b"00001" =>   -- 1
            temp <= "1100000"; -- b
            when b"00010" =>   -- 2
            temp <= "1110010"; -- c
            when b"00011" =>   -- 3
            temp <= "1000010"; -- d
            when b"00100" =>   -- 4
            temp <= "0110000"; -- e
            when b"00101" =>   -- 5
            temp <= "0111000"; -- f
            when b"00110" =>   -- 6
            temp <= "0100001"; -- g
            when b"00111" =>   -- 7
            temp <= "1101000"; -- h
            when b"01000" =>   -- 8
            temp <= "0111011"; -- i
            when b"01001" =>   -- 9
            temp <= "0100111"; -- j
            when b"01010" =>
            temp <= "0101000"; -- k
            when b"01011" =>
            temp <= "1110001"; -- l
            when b"01100" =>
            temp <= "0101010"; -- m
            when b"01101" =>
            temp <= "1101010"; -- n
            when b"01110" =>
            temp <= "1100010"; -- o 
            when b"01111" =>
            temp <= "0011000"; -- p
            when b"10000" =>
            temp <= "0001100"; -- q
            when b"10001" =>
            temp <= "1111010"; -- r
            when b"10010" =>
            temp <= "0100101"; -- s
            when b"10011" =>
            temp <= "0001111"; -- t
            when b"10100" =>
            temp <= "1100011"; -- u
            when b"10101" =>
            temp <= "1010101"; -- v
            when b"10110" =>
            temp <= "1010100"; -- w
            when b"10111" =>
            temp <= "1101011"; -- x
            when b"11000" =>
            temp <= "1000100"; -- y
            when b"11001" =>
            temp <= "0010011"; -- z
            when b"11111" =>
            temp <= "1111110"; --(-)
            when others =>
            temp <= "1111111"; --off
        end case;
        output <= temp;
    end if;
    end process;
end Behavioral;

--SUMMARY
--7-Segment Display Encoding: The output encodings for each character (a to z and some additional characters like - and off) are hard-coded based on the binary input.
--Usage of Clock Signal: The process block is clock-driven, suggesting that it updates its output at every clock edge when input changes. This can help synchronize the display updates with other parts of a larger system.
--Extensible: The entity is designed to be simple and extensible for different characters or symbols by modifying or adding to the case conditions.
--This entity can be integrated into larger systems where binary to 7-segment decoding is needed, particularly useful in FPGA applications such as user interfaces or display panels.
