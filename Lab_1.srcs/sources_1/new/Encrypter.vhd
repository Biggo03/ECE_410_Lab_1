library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Encrypter is
    Port (
        I_DATA : in std_logic_vector(7 downto 0);
        KEY : in std_logic_vector(7 downto 0);
        O_DATA : out std_logic_vector(7 downto 0);
        RED, GREEN : out std_logic);
        
end Encrypter;

architecture Behavioral of Encrypter is
    signal COMP_OUT, SHIFT_OUT : std_logic_vector(7 downto 0);
    signal SHIFT : std_logic_vector(2 downto 0);
begin
    
    --Generate Shift amount
    SHIFT <= KEY(2) & KEY(1) & KEY(0);
    
    --Ensure Data is within expected range
    comparator : ENTITY work.UC_ASCII_comparator(Behavioral)
        PORT MAP(INPUT=>I_DATA, OUTPUT=>COMP_OUT, GREEN=>GREEN, RED=>RED);
    
    --Shift Data by Specified Amount
    shifter : ENTITY work.Barrel_Shift(Behavioral)
        PORT MAP(DATA=>COMP_OUT, SHAMT=>SHIFT, SHB=>'0', RESULT=>SHIFT_OUT);
    
    
    --Encrpyt the data
    Encryption : ENTITY work.XOR_Gate(Behavioral)
        PORT MAP(DATA=>SHIFT_OUT, KEY=>KEY, OUTPUT=>O_DATA);
    

end Behavioral;