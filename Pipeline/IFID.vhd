----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:14:11 05/01/2020 
-- Design Name: 
-- Module Name:    IFID - Behavioral 
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

entity IFID is
    Port ( clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  enable: in STD_LOGIC;
			  pc_plus4 : in  STD_LOGIC_VECTOR (31 downto 0);
           instr : in  STD_LOGIC_VECTOR (31 downto 0);
           pcout : out  STD_LOGIC_VECTOR (31 downto 0);
           instrout : out  STD_LOGIC_VECTOR (31 downto 0));
end IFID;

architecture Behavioral of IFID is

component myregister
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC_VECTOR (31 downto 0);
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC_VECTOR (31 downto 0));
end component;
signal notInstr: STD_LOGIC_VECTOR( 31 downto 0);
begin

pcReg : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => pc_plus4,
						writeEnable => enable,
						output => pcout);
						
instrReg : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => instr,
						writeEnable => enable,
						output => notInstr);
						
process(notInstr)
begin
	if (rst = '1') then
		instrout <= "10000000000000000000000000000000";
	else
		instrout <= notInstr;
	end if;
end process;		
end Behavioral;

