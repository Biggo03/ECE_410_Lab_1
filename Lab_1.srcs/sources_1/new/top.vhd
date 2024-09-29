----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 03:51:30 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port (
        I_DATA : in std_logic_vector(7 downto 0);
        O_DATA : out std_logic_vector(7 downto 0);
        RED, GREEN : out std_logic);
        
end top;

architecture Behavioral of top is
    signal ENCRYPTED_DATA, KEY : std_logic_vector(7 downto 0);
begin

    KEY <= "01010101";

    Encryption : ENTITY work.Encrypter(Behavioral)
        PORT MAP(I_DATA=>I_DATA, KEY=>KEY, O_DATA=>ENCRYPTED_DATA, GREEN=>GREEN, RED=>RED);
    
    Decryption: ENTITY work.Decrypter(Behavioral)
        PORT MAP(I_DATA=>ENCRYPTED_DATA, KEY=>KEY, O_DATA=>O_DATA);
    
end Behavioral;
