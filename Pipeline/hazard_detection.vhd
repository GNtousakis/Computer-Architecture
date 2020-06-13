----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:21:24 05/11/2020 
-- Design Name: 
-- Module Name:    hazard_detection - Behavioral 
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

entity hazard_detection is
    Port ( memRdIDEX : in  STD_LOGIC;
           rdIDEX : in  STD_LOGIC_VECTOR (4 downto 0);
           rs : in  STD_LOGIC_VECTOR (4 downto 0);
           rt : in  STD_LOGIC_VECTOR (4 downto 0);
           IFIDenable : out  STD_LOGIC;
           pcWrite : out  STD_LOGIC;
           muxSel : out  STD_LOGIC);
end hazard_detection;

architecture Behavioral of hazard_detection is

begin

process (memRdIDEX, rdIDEX, rs, rt)
begin
	if (memRdIDEX = '1' AND ((rdIDEX = rs) or (rdIDEX = rt))) then
		IFIDenable <= '0';
		pcWrite <= '0';
		muxSel <= '1';
	else
		IFIDenable <= '1';
		pcWrite <= '1';
		muxSel <= '0';		
	end if;
end process;
end Behavioral;

