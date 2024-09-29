----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 03:26:20 PM
-- Design Name: 
-- Module Name: Upper_to_Lower - Behavioral
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

entity Upper_to_Lower is
  Port (DATA : in std_logic_vector(7 downto 0);
        RESULT : out std_logic_vector(7 downto 0));
end Upper_to_Lower;

architecture Behavioral of Upper_to_Lower is
    
begin

    conversion : process(DATA) is
    begin
        
        if (DATA(4) = '0') then
            RESULT <= "0110" & DATA(3) & DATA(2) & DATA(1) & DATA(0);
        else
            RESULT <= "0111" & DATA(3) & DATA(2) & DATA(1) & DATA(0);
        
        end if;
    
    end process conversion;
    

end Behavioral;
