library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity caesar is
    Port ( en : in STD_LOGIC; --An input signal that enables the cipher function when high ('1').
           en_de_cryption : in STD_LOGIC; --An input signal. When it is '0', the module performs encryption; when '1', it performs decryption.
           input : in STD_LOGIC_VECTOR (5 downto 0); --A 6-bit input vector representing the data to be encrypted or decrypted.
           output : out STD_LOGIC_VECTOR (5 downto 0)); --A 6-bit output vector that holds the result of the encryption or decryption operation.
end caesar;

architecture Behavioral of caesar is
begin
    process(en, en_de_cryption, input)
    variable temp: integer; --A variable used to hold intermediate results of the cipher computation.
    begin
    temp:=TO_INTEGER(unsigned(input)); --The input signal, which is a 6-bit vector, is first converted to an integer using TO_INTEGER(unsigned(input)).
    if en = '1' then --The cipher operation only proceeds if en is high ('1'). If en is low ('0'), the process does not alter the temp variable, effectively keeping the output unchanged.
        if en_de_cryption = '0' then
            temp:=(temp+10) mod 8; --The value in temp is increased by 10 and then taken modulo 8. This effectively rotates the value within a range of 0 to 7, wrapping around if necessary.
        else
            temp:=(temp-10) mod 8; --The value in temp is decreased by 10 and then taken modulo 8, also ensuring the result stays within a range of 0 to 7.
        end if;
    end if;
    output<=std_logic_vector(TO_UNSIGNED(temp, 6)); --The final value of temp is then converted back to a 6-bit unsigned vector and assigned to the output.
    end process;

end Behavioral;

--SUMMARY
--The Caesar cipher implemented here operates with a very small set (mod 8, values ranging from 0 to 7) which is not typical for a traditional Caesar cipher that operates with a larger range (such as the set of alphabets). The use of mod 8 and the 6-bit width for input and output suggest a very specialized use case or an example used for educational or demonstration purposes.
--The design also assumes that wrapping is handled correctly by using modulo operations to keep the results within the 0-7 range, thus ensuring no overflow or underflow errors occur during the encryption or decryption processes.
