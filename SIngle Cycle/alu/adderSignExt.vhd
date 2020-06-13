----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:39:27 03/09/2020 
-- Design Name: 
-- Module Name:    adderSignExt - Behavioral 
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adderSignExt is
    Port ( inputNumber : in  STD_LOGIC_VECTOR (31 downto 0);
           immed16 : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end adderSignExt;

architecture Behavioral of adderSignExt is
signal immed32 : STD_LOGIC_VECTOR (31 downto 0);
begin
immed32 		<= std_logic_vector(shift_left(resize(signed(immed16), 32), 2));

process (inputNumber, immed32)
begin 
	output <= inputNumber + immed32;
end process;
end Behavioral;

