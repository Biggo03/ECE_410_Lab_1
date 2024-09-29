----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 02:38:06 PM
-- Design Name: 
-- Module Name: Barrel_Shift - Behavioral
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
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Barrel_Shift is
    Port ( 
        DATA : in std_logic_vector(7 downto 0);
        SHAMT : in std_logic_vector (2 downto 0);
        SHB : in std_logic;
        RESULT : out std_logic_vector (7 downto 0));
end Barrel_Shift;

architecture Behavioral of Barrel_Shift is
    signal TEMP_RESULT : SIGNED(7 downto 0);
begin

    shifter : process (DATA, SHB, SHAMT) is
    begin
        
        if (SHB = '1') then
            TEMP_RESULT <= rotate_right(SIGNED(DATA), to_integer(UNSIGNED(SHAMT)));
        else
            TEMP_RESULT <= rotate_left(SIGNED(DATA), to_integer(UNSIGNED(SHAMT)));
        
        end if;
    
    end process shifter;
    
    RESULT <= std_logic_vector(TEMP_RESULT);

end Behavioral;
