library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity top_level is
    Port ( BTND : in std_logic;
           BTNL : in std_logic;
           CLK100MHZ : in std_logic;
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
    signal output0: std_logic_vector(27 downto 0);

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
           output => output0(6 downto 0) 
);

decoder1 : component bin2seg
port map ( clear =>  '0', 
           input => decode1,
           output => output0(13 downto 7)
);

decoder2 : component bin2seg
port map ( clear => '0', 
           input => decode2,
           output => output0(20 downto 14) 
);

decoder3 : component bin2seg
port map ( clear => '0', 
           input => decode3,
           output => output0(27 downto 21)
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

cipherC : component caesar
port map ( input => SW (4 downto 0),
           output => decode3,
           en => '1',
           en_de_cryption => SW(5)
);
AN<="01110111";
DP <= '1';
LED<= SW;
display: process (CLK100MHZ)
    begin
        if (BTNL='1') and (BTND='0') and (BTNR='0') then
            CA<=output0(13);
            CB<=output0(12);
            CC<=output0(11);
            CD<=output0(10);
            CE<=output0(9);
            CF<=output0(8);
            CG<=output0(7);
        elsif (BTNL='0') and (BTND='0') and (BTNR='1') then
            CA<=output0(20);
            CB<=output0(19);
            CC<=output0(18);
            CD<=output0(17);
            CE<=output0(16);
            CF<=output0(15);
            CG<=output0(14);
        elsif (BTNL='0') and (BTND='1') and (BTNR='0') then
            CA<=output0(27);
            CB<=output0(26);
            CC<=output0(25);
            CD<=output0(24);
            CE<=output0(23);
            CF<=output0(22);
            CG<=output0(21);
        else 
            CA<=output0(6);
            CB<=output0(5);
            CC<=output0(4);
            CD<=output0(3);
            CE<=output0(2);
            CF<=output0(1);
            CG<=output0(0);
        end if;

    end process display;
end Behavioral;
