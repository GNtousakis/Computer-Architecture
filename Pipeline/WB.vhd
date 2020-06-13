----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:41:34 05/01/2020 
-- Design Name: 
-- Module Name:    WB - Behavioral 
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

entity WB is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           memtoReg : in  STD_LOGIC;
           RegWr : in  STD_LOGIC;
           memtoRegOut : out  STD_LOGIC;
           regWrOut : out  STD_LOGIC);
end WB;

architecture Behavioral of WB is
component register1
	Port ( 
		clk		: in  STD_LOGIC;
		rst 			: in STD_LOGIC;
      input 	: in  STD_LOGIC;
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC);
end component;
begin
memtoRegStore : register1 
						port map ( 
						clk => clk,
						rst => rst,
						input => memtoReg,
						writeEnable => '1',
						output => memtoRegOut);
regWrReg : register1 
						port map ( 
						clk => clk,
						rst => rst,
						input => RegWr,
						writeEnable => '1',
						output => regWrOut);

end Behavioral;

