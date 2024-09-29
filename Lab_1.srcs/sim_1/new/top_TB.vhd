----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/29/2024 11:01:25 AM
-- Design Name: 
-- Module Name: top_TB - Behavioral
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

entity top_TB is
--  Port ( );
end top_TB;

architecture Behavioral of top_TB is
    signal I_DATA_TB, O_DATA_TB : std_logic_vector(7 downto 0);
    signal GREEN_TB, RED_TB : std_logic;
begin

DUT : ENTITY work.top(Behavioral)
    PORT MAP(I_DATA=>I_DATA_TB, O_DATA=>O_DATA_TB, GREEN=>GREEN_TB, RED=>RED_TB);


    stimulus : process is
    begin
    
        I_DATA_TB <= x"45";
        wait for 5 ns;
        
        assert (O_DATA_TB = x"65" and GREEN_TB = '1' and RED_TB = '0') report("ERROR: Output incorrect for valid input");
        
        I_DATA_TB <= x"70";
        wait for 5 ns;
        
        assert (RED_TB = '1' and GREEN_TB = '0') report("ERROR: Output incorrect for invalid input");
    
    
    end process stimulus;
    


end Behavioral;
