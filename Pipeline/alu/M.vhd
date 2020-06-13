----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:36:44 05/01/2020 
-- Design Name: 
-- Module Name:    M - Behavioral 
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

entity M is
    Port ( clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  memWr : in  STD_LOGIC;
           memRead : in  STD_LOGIC;
			  byteOp : in STD_LOGIC;
           branch : in  STD_LOGIC;
			  pc_sel : in STD_LOGIC;
           wrOut : out  STD_LOGIC;
           rdOut : out  STD_LOGIC;
			  byteOpOut: out STD_LOGIC;
           brOut : out  STD_LOGIC;
			  pc_selOut : out STD_LOGIC);
end M;

architecture Behavioral of M is
component register1
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC;
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC);
end component;
begin
wrReg : register1 
						port map ( 
						clk => clk,
						rst => rst,
						input => memWr,
						writeEnable => '1',
						output => wrOut);
rdReg : register1 
						port map ( 
						clk => clk,
						rst => rst,
						input => memRead,
						writeEnable => '1',
						output => rdOut);
						
byteOpReg : register1 
						port map ( 
						clk => clk,
						rst => rst,
						input => byteOp,
						writeEnable => '1',
						output => byteOpOut);
						
brReg : register1 
						port map ( 
						clk => clk,
						rst => rst,
						input => branch,
						writeEnable => '1',
						output => brOut);

pc_selOut1 : register1 
						port map ( 
						clk => clk,
						rst => rst,
						input => pc_sel,
						writeEnable => '1',
						output => pc_selOut);
end Behavioral;

