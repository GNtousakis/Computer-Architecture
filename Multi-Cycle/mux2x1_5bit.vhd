----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:10:13 03/10/2020 
-- Design Name: 
-- Module Name:    mux2x1_5bit - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux2x1_5bit is
    Port ( input1 : in  STD_LOGIC_VECTOR (4 downto 0);
           input2 : in  STD_LOGIC_VECTOR (4 downto 0);
           control : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (4 downto 0));
end mux2x1_5bit;

architecture Behavioral of mux2x1_5bit is
begin
process (input1, input2, control)
begin 
	if ( control = '0') then
		output <= input1;
	else 
		output <= input2;
	end if;
end process;
end Behavioral;
