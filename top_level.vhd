library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity top_level is
    Port ( BTNC : in std_logic;
           BTNL : in std_logic;
           --BTNU : in std_logic;
           BTNR : in std_logic;
           SW : in STD_LOGIC_VECTOR (5 downto 0);
           LED : out STD_LOGIC_VECTOR (5 downto 0);                          
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out std_logic;        
           AN : out std_logic_vector(7 downto 0) );
end entity top_level;

architecture Behavioral of top_level is
    signal decode1: std_logic_vector(4 downto 0);
    signal decode2: std_logic_vector(4 downto 0);
    signal decode3: std_logic_vector(4 downto 0);
    signal output0: std_logic_vector(6 downto 0);
    signal output1: std_logic_vector(6 downto 0);
    signal output2: std_logic_vector(6 downto 0);
    signal output3: std_logic_vector(6 downto 0);

    component atbash is
        Port ( en : in STD_LOGIC; --Input signal that enables the cipher function. When high ('1'), the cipher is enabled.
               input : in STD_LOGIC_VECTOR (4 downto 0); --Input data to be encrypted or decrypted. It's a 5-bit vector.
               output : out STD_LOGIC_VECTOR (4 downto 0)); --Output data after encryption or decryption. Also a 5-bit vector.
    end component;

    component bin2seg is
        Port ( input : in STD_LOGIC_VECTOR (4 downto 0); --A 5-bit input which is the binary value to be converted.
               output : out STD_LOGIC_VECTOR (6 downto 0); --A 7-bit which represents the segments of a 7-segment display.
               clear : in STD_LOGIC);
    end component;
  
    component caesar is
        Port ( en : in STD_LOGIC; --An input signal that enables the cipher function when high ('1').
               en_de_cryption : in STD_LOGIC; --An input signal. When it is '0', the module performs encryption; when '1', it performs decryption.
               input : in STD_LOGIC_VECTOR (4 downto 0); --A 5-bit input vector representing the data to be encrypted or decrypted.
               output : out STD_LOGIC_VECTOR (4 downto 0)); --A 5-bit output vector that holds the result of the encryption or decryption operation.
    end component;

    component vernam is
        Port ( en : in STD_LOGIC; --Input signal that enables the cipher function. When high ('1'), the cipher is enabled.
               input : in STD_LOGIC_VECTOR (4 downto 0); --Input data for encryption or ciphertext for decryption. It's a 5-bit vector.
               output : out STD_LOGIC_VECTOR (4 downto 0)); --Output data after encryption or decrypted plaintext. Also a 5-bit vector.
    end component;
 
begin
decoder0 : component bin2seg
port map ( clear => '0', 
           input => SW(4 downto 0),
           output => output0 
);

decoder1 : component bin2seg
port map ( clear =>  '0', 
           input => decode1,
           output => output1 
);

decoder2 : component bin2seg
port map ( clear => '0', 
           input => decode2,
           output => output2 
);

decoder3 : component bin2seg
port map ( clear => '0', 
           input => decode3,
           output => output3
);

cipherL : component atbash
port map ( input => SW (4 downto 0),
           output => decode1,
           en => BTNL
);

cipherR : component vernam
port map ( input => SW (4 downto 0),
           output => decode2,
           en => BTNR
);

cipherU : component caesar
port map ( input => SW (4 downto 0),
           output => decode3,
           en => BTNC,
           en_de_cryption => SW(5)
);

display: process (BTNL, BTNC, BTNR)
    begin
        if (BTNL) ='1' then
            AN <= "01110111";
            CA <= output1(6);
            CB <= output1(5);
            CC <= output1(4);
            CD <= output1(3);
            CE <= output1(2);
            CF <= output1(1);
            CG <= output1(0);
        end if;
        if (BTNC) = '1' then
            AN <= "01111011";
            CA <= output2(6);
            CB <= output2(5);
            CC <= output2(4);
            CD <= output2(3);
            CE <= output2(2);
            CF <= output2(1);
            CG <= output2(0);
        end if;
        if (BTNR) = '1' then
            AN <= "01111101";
            CA <= output3(6);
            CB <= output3(5);
            CC <= output3(4);
            CD <= output3(3);
            CE <= output3(2);
            CF <= output3(1);
            CG <= output3(0);
        end if;
        if (BTNR)='0' and (BTNL)='0' and (BTNC)='0' then
            AN <= "01111101";
            CA <= output0(6);
            CB <= output0(5);
            CC <= output0(4);
            CD <= output0(3);
            CE <= output0(2);
            CF <= output0(1);
            CG <= output0(0);
        end if;
    end process display;

DP <= '1';
LED<= SW;
--AN <= "00001111";
end Behavioral;
