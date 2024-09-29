----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 04:14:26 PM
-- Design Name: 
-- Module Name: XOR_Gate - Behavioral
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

entity XOR_Gate is
  Port (
     DATA, KEY : in std_logic_vector(7 downto 0);
     OUTPUT : out std_logic_vector (7 downto 0));
end XOR_Gate;

architecture Behavioral of XOR_Gate is
    
    
begin

    OUTPUT <= DATA XOR KEY;

end Behavioral;

