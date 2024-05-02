library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vernam is
    Port ( en : in STD_LOGIC; --Input signal that enables the cipher function. When high ('1'), the cipher is enabled.
           input : in STD_LOGIC_VECTOR (5 downto 0); --Input data for encryption or ciphertext for decryption. It's a 6-bit vector.
           output : out STD_LOGIC_VECTOR (5 downto 0)); --Output data after encryption or decrypted plaintext. Also a 6-bit vector.
end vernam;

architecture Behavioral of vernam is
constant key : STD_LOGIC_VECTOR (5 downto 0) := "101101"; --A constant 6-bit vector representing the encryption key. In this code, the key is set to "101101". The key should ideally be as long as the plaintext and randomly generated.
begin
    process(en, input)
    begin
        if en = '1' then --If en is high ('1'), indicating the cipher operation is enabled.
            output <= input XOR key; --The input is XORed with the predefined key.
        else --If en is low ('0'), indicating the cipher operation is not enabled.
            output <= (others => '0'); --The output is set to all zeros, effectively passing through the input unchanged.
        end if;
    end process;
end Behavioral;

--SUMMARY
--This VHDL module implements a simple Vernam cipher with XOR-based encryption.
--When the en signal is high, it encrypts the input using the XOR operation with the predefined key.
--When en is low, it passes through the input unchanged.
--Note: In a real-world application, the key should be randomly generated, kept secret, and as long as the plaintext to ensure security.