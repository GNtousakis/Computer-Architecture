----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:18:18 05/10/2020 
-- Design Name: 
-- Module Name:    forward_unit - Behavioral 
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

entity forward_unit is
    Port ( exmemRd : in  STD_LOGIC_VECTOR (4 downto 0);
           memwbRd : in  STD_LOGIC_VECTOR (4 downto 0);
           rs : in  STD_LOGIC_VECTOR (4 downto 0);
           rt : in  STD_LOGIC_VECTOR (4 downto 0);
			  exmemRegWrite: in STD_LOGIC;
			  memwbRegWrite: in STD_LOGIC;
           forwardA : out  STD_LOGIC_VECTOR (1 downto 0);
           forwardB : out  STD_LOGIC_VECTOR (1 downto 0));
end forward_unit;

architecture Behavioral of forward_unit is

begin

process (exmemRd, memwbRd, rs, rt, exmemRegWrite, memwbRegWrite) 
begin
	if (( exmemRegWrite = '1' and exmemRd /= "00000") and ( exmemRd = rs )) then
		forwardA <= "10";
	elsif (( memwbRegWrite = '1' and memwbRd /= "00000") and ( memwbRd = rs )) then
		forwardA <= "01";
	else 
		forwardA <= "00";
	end if;

	if (( exmemRegWrite = '1' and exmemRd /= "00000") and ( exmemRd = rt )) then
		forwardB <= "10";
	elsif (( memwbRegWrite = '1' and memwbRd /= "00000") and ( memwbRd = rt )) then
		forwardB <= "01";
	else 
		forwardB <= "00";
	end if;
end process;

end Behavioral;

