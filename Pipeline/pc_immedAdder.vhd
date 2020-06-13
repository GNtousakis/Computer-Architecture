----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:20:22 05/03/2020 
-- Design Name: 
-- Module Name:    pc_immedAdder - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pc_immedAdder is
    Port ( immed : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_addr : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end pc_immedAdder;

architecture Behavioral of pc_immedAdder is
signal shifted : STD_LOGIC_VECTOR (31 downto 0);
begin

process (immed, pc_addr)
begin
	output <= immed + pc_addr;
end process;
end Behavioral;

