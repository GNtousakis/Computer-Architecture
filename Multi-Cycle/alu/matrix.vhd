--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--
-- https://forums.xilinx.com/t5/Synthesis/Generic-MUX-using-VHDL/td-p/285897
library IEEE;
use IEEE.STD_LOGIC_1164.all;

package matrix32 is
	constant m : integer := 32;       -- size in bits of each inputs , change it if you want to change the size of each input
   type matrix is array (natural range <>) of std_logic_vector (m-1 downto 0);
end package matrix32;


