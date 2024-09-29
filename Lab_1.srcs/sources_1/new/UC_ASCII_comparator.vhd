----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2024 03:55:14 PM
-- Design Name: 
-- Module Name: UC_ASCII_comparator - Behavioral
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

entity UC_ASCII_comparator is
    Port(  
        INPUT: in std_logic_vector (7 downto 0);
        OUTPUT: out std_logic_vector (7 downto 0);
        GREEN, RED : out std_logic);
end UC_ASCII_comparator;

architecture Behavioral of UC_ASCII_comparator is
begin

    -- ensures that the the input is an upper case ASCII character
    UC_compare: process(INPUT) is
    begin
    
        -- Tests the first 3 most significatn bits
        if (INPUT(7) = '0' and INPUT(6) = '1' and INPUT(5) = '0') then
            
            -- Tests the remainng 5 most significant bits
            if((INPUT(1) and (not INPUT(4))) = '1') then
                OUTPUT <= INPUT;
                GREEN <= '1';
                RED <= '0';
            elsif((INPUT(3) and (not INPUT(4))) = '1') then
                OUTPUT <= INPUT;  
                GREEN <= '1';
                RED <= '0';
            elsif(((not INPUT(3)) and INPUT(4)) = '1') then
                OUTPUT <= INPUT;
                GREEN <= '1';
                RED <= '0';
            elsif((INPUT(2) and (not INPUT(4))) = '1') then
                OUTPUT <= INPUT;
                GREEN <= '1';
                RED <= '0';
            elsif(((not INPUT(2)) and (not INPUT(1)) and INPUT(0)) = '1') then
                OUTPUT <= INPUT;
                GREEN <= '1';
                RED <= '0';
            elsif(((not INPUT(2)) and (not INPUT(0)) and INPUT(4)) = '1') then
                OUTPUT <= INPUT;
                GREEN <= '1';
                RED <= '0';
            else 
                OUTPUT <= "00000000";
                GREEN <= '0';
                RED <= '1';
                
            end if; 
        else 
            OUTPUT <= "00000000";
            GREEN <= '0';
            RED <= '1';

        end if;
    end process UC_compare;
end Behavioral;

