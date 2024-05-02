library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity caesar is
    Port ( en : in STD_LOGIC; --An input signal that enables the cipher function when high ('1').
           en_de_cryption : in STD_LOGIC; --An input signal. When it is '0', the module performs encryption; when '1', it performs decryption.
           input : in STD_LOGIC_VECTOR (4 downto 0); --A 5-bit input vector representing the data to be encrypted or decrypted.
           output : out STD_LOGIC_VECTOR (4 downto 0)); --A 5-bit output vector that holds the result of the encryption or decryption operation.
end caesar;

architecture Behavioral of caesar is
constant key : STD_LOGIC_VECTOR (4 downto 0) := "01010"; --A constant 5-bit vector representing the encryption key number. In this code, the key is set to "01010". The key should ideally be as long as the plaintext and randomly generated.

begin
    process(en, en_de_cryption, input)
    variable temp: unsigned(4 downto 0);
    begin
    if en = '1' then --The cipher operation only proceeds if en is high ('1'). If en is low ('0'), the process does not alter the temp variable, effectively keeping the output unchanged.
        if en_de_cryption = '0' then
            temp:=unsigned(input) + unsigned(key);
            output<=std_logic_vector(temp); 
        else
            temp:=unsigned(input) - unsigned(key);
            output<=std_logic_vector(temp); 
        end if;
    end if;
    end process;

end Behavioral;
