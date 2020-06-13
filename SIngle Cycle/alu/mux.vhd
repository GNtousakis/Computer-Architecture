----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:11:52 02/26/2020 
-- Design Name: 
-- Module Name:    mux - Behavioral 
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
---------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;
use work.matrix32.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity mux is
   Port ( 
		input		: in 	matrix(0 to 31);
		control  : in  STD_LOGIC_VECTOR (4 downto 0);
		output   : out  STD_LOGIC_VECTOR (31 downto 0));
end mux;

architecture Behavioral of mux is
signal tempOut : STD_LOGIC_VECTOR (31 downto 0);
begin
process (input, tempOut, control)
	begin
		tempOut <= input ( to_integer(unsigned(control)));	
end process;
output <= tempOut after 10 ns;	
end Behavioral;

