----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 03:32:34 PM
-- Design Name: 
-- Module Name: Upper_to_Lower_TB - Behavioral
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

entity Upper_to_Lower_TB is
--  Port ( );
end Upper_to_Lower_TB;

architecture Behavioral of Upper_to_Lower_TB is
    signal DATA_tb, RESULT_tb : std_logic_vector(7 downto 0);
begin


    DUT: ENTITY work.Upper_to_Lower(Behavioral)
        PORT MAP(DATA=>DATA_tb, RESULT=>RESULT_tb); 
        
    stimulus : process
    begin
    
        DATA_tb <= x"41";
        wait for 5 ns;
        
        assert (RESULT_tb = x"61") report("Error");
        
        DATA_tb <= x"58";
        wait for 5 ns;
        
        assert (RESULT_tb = x"78") report("Error");
        
        wait;
    
    end process stimulus;

end Behavioral;
