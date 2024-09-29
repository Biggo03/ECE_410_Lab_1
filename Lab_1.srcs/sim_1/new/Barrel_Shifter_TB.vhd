----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 02:59:44 PM
-- Design Name: 
-- Module Name: Barrel_Shifter_TB - Behavioral
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

entity Barrel_Shifter_TB is
--  Port ( );
end Barrel_Shifter_TB;

architecture Behavioral of Barrel_Shifter_TB is
    
    signal DATA_tb, RESULT_tb : std_logic_vector (7 downto 0) := "11010100";
    signal SHAMT_tb : std_logic_vector (2 downto 0) := "000";
    signal SHB_tb : std_logic := '0';
   
    
begin

DUT: ENTITY work.Barrel_Shift(Behavioral)
    PORT MAP (DATA=>DATA_tb, SHAMT=>SHAMT_tb, SHB=>SHB_tb, RESULT=>RESULT_tb);
    
    stimulus : process
    begin
        
        wait for 5 ns;
        SHAMT_tb <= "001";
        wait for 5 ns;
        DATA_tb <= RESULT_tb;
        SHB_tb <= '1';
        wait for 5ns;
        
        
        
        assert (RESULT_tb = DATA_tb) report ("ERROR");
        
        
        SHB_tb <= '0';
        wait for 5 ns;
        SHAMT_tb <= "010";
        wait for 5 ns;
        DATA_tb <= RESULT_tb;
        SHB_tb <= '1';
        wait for 5ns;
        
        assert (RESULT_tb = DATA_tb) report ("Issue");

        SHB_tb <= '0';
        wait for 5 ns;        
        SHAMT_tb <= "011";
        wait for 5 ns;
        DATA_tb <= RESULT_tb;
        SHB_tb <= '1';
        wait for 5ns;
        
        assert (RESULT_tb = DATA_tb) report ("Issue");

        SHB_tb <= '0';
        wait for 5 ns;        
        SHAMT_tb <= "100";
        wait for 5 ns;
        DATA_tb <= RESULT_tb;
        SHB_tb <= '1';
        wait for 5ns;
        
        assert (RESULT_tb = DATA_tb) report ("Issue");

        SHB_tb <= '0';
        wait for 5 ns;        
        SHAMT_tb <= "101";
        wait for 5 ns;
        DATA_tb <= RESULT_tb;
        SHB_tb <= '1';
        wait for 5ns;
        
        assert (RESULT_tb = DATA_tb) report ("Issue");
  
        SHB_tb <= '0';
        wait for 5 ns;      
        SHAMT_tb <= "110";
        wait for 5 ns;
        DATA_tb <= RESULT_tb;
        SHB_tb <= '1';
        wait for 5ns;
        
        assert (RESULT_tb = DATA_tb) report ("Issue");

        SHB_tb <= '0';
        wait for 5 ns;          
        SHAMT_tb <= "111";
        wait for 5 ns;
        DATA_tb <= RESULT_tb;
        SHB_tb <= '1';
        wait for 5ns;
        
        assert (RESULT_tb = DATA_tb) report ("Issue");
        
    end process stimulus;

end Behavioral;
