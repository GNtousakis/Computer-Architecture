----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:08:57 03/09/2020 
-- Design Name: 
-- Module Name:    myCloud - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_SIGNED.ALL;


entity myCloud is
    Port ( immediate : in  STD_LOGIC_VECTOR (15 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end myCloud;

architecture Behavioral of myCloud is

begin
process(control, immediate)
begin
	case (control) is
		when "00" => output <= std_logic_vector(resize(signed(immediate), 32));							-- sign extend
		when "01" => output <= std_logic_vector(shift_left(resize(signed(immediate), 32), 2));		-- sign extend // shift by 2
		when "10" => output <= std_logic_vector(resize(unsigned(immediate), 32));						-- zero extend
		when "11" => output <= std_logic_vector(shift_left(resize(unsigned(immediate), 32), 16));	-- zero extend // shift by 16
		when others => output <= (others => '0');
	end case;
end process;
end Behavioral;

