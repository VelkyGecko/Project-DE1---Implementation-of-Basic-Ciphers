library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity atbash is
    Port ( en : in STD_LOGIC; --Input signal that enables the cipher function. When high ('1'), the cipher is enabled.
           input : in STD_LOGIC_VECTOR (5 downto 0); --Input data to be encrypted or decrypted. It's a 6-bit vector.
           output : out STD_LOGIC_VECTOR (5 downto 0)); --Output data after encryption or decryption. Also a 6-bit vector.
end atbash;

architecture Behavioral of atbash is
begin
    process(en, input)
    variable temp: integer; --A variable used to hold intermediate results of the cipher computation.
    begin
        if en = '1' then --If en is high ('1'), indicating the cipher operation is enabled.
            temp := TO_INTEGER(unsigned(input)); --The input is converted to an integer.
            temp := 25 - temp; --The integer value is mirrored across the midpoint of the 0-25 range (for a 6-bit input, the range is 0-25).
            output <= std_logic_vector(TO_UNSIGNED(temp, 6)); --The mirrored value is converted back to a 6-bit vector and assigned to the output.
        else --If en is low ('0'), indicating the cipher operation is not enabled.
            output <= input; --The output is set to the input, effectively passing through the input unchanged.
        end if;
    end process;
end Behavioral;

--SUMMARY
--This VHDL module implements the Atbash cipher with symmetric encryption and decryption.
--When the en signal is high, it performs the Atbash transformation on the input data.
--When en is low, it passes through the input unchanged.
--Note: The Atbash cipher works by mirroring each character across the midpoint of the alphabet. For example, 'A' becomes 'Z', 'B' becomes 'Y', and so on. The implementation here assumes a 6-bit input vector, where each bit represents a letter of the alphabet. Adjustments may be needed for different input representations or alphabets.