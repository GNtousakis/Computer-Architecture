----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:55:20 02/26/2020 
-- Design Name: 
-- Module Name:    register - Behavioral 
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

entity register4 is
    Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (3 downto 0);
           writeEnable : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end register4;

architecture Behavioral of register4 is
signal tempOut : STD_LOGIC_VECTOR (3 downto 0);

begin
	process (clk, rst) 
	begin
		if (rising_edge(clk)) then
			if (rst = '1') then 
				tempOut <= (others => '0');
			elsif (writeEnable = '1') then 
				tempOut <= input;
			end if;
		end if;
	end process;
	
	output <= tempOut after 10ns;
end Behavioral;

