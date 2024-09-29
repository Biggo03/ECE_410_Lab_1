----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 04:16:53 PM
-- Design Name: 
-- Module Name: Decrypter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Decrypter is
    Port (
        I_DATA, KEY : in std_logic_vector(7 downto 0);
        O_DATA : out std_logic_vector(7 downto 0));
end Decrypter;

architecture Behavioral of Decrypter is
    signal DECRYPT_OUT, SHIFT_OUT : std_logic_vector(7 downto 0);
    signal SHIFT : std_logic_vector(2 downto 0);
begin
    
    SHIFT <= KEY(2) & KEY(1) & KEY(0);
    
    --Decrypt the input data
    Decryption : ENTITY work.XOR_Gate(Behavioral)
        PORT MAP(DATA=>I_DATA, KEY=>KEY, OUTPUT=>DECRYPT_OUT);
    
    --Shift Data by Specified Amount
    Shifter : ENTITY work.Barrel_Shift(Behavioral)
        PORT MAP(DATA=>DECRYPT_OUT, SHAMT=>SHIFT, SHB=>'1', RESULT=>SHIFT_OUT);
    
    --Convert character to lower case as final output
    Convert : ENTITY work.Upper_to_Lower(Behavioral)
        PORT MAP(DATA=>SHIFT_OUT, RESULT=>O_DATA);
    

end Behavioral;
