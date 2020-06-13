----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:45 03/11/2020 
-- Design Name: 
-- Module Name:    memOffset - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity memOffset is
    Port ( memAddr : in  STD_LOGIC_VECTOR (31 downto 0);
           memAddrOffs : out  STD_LOGIC_VECTOR (31 downto 0));
end memOffset;

architecture Behavioral of memOffset is

signal tempInteger : integer; 

begin
process (memAddr)
begin
	tempInteger	<= to_integer(unsigned(memAddr)) + 1024;
end process;

memAddrOffs	<= std_logic_vector( to_unsigned(tempInteger, memAddrOffs'length));
end Behavioral;

