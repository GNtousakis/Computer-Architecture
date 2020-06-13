----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:16:59 05/01/2020 
-- Design Name: 
-- Module Name:    EX - Behavioral 
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

entity EX is
    Port ( clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  aluSrc : in  STD_LOGIC;
           aluCtr : in  STD_LOGIC_VECTOR (3 downto 0);
           aluReg : in  STD_LOGIC;
          -- shiftOp : in  STD_LOGIC_VECTOR (2 downto 0);
           scrOut : out  STD_LOGIC;
           ctrOut : out  STD_LOGIC_VECTOR (3 downto 0);
           regOut : out  STD_LOGIC);
           --shiftOut : out  STD_LOGIC_VECTOR (2 downto 0));
end EX;

architecture Behavioral of EX is

component register1
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC;
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC);
end component;

component register3
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC_VECTOR (2 downto 0);
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component register4
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC_VECTOR (3 downto 0);
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC_VECTOR (3 downto 0));
end component;


begin
srcReg : register1 
						port map ( 
						clk => clk,
						rst => rst,
						input => aluSrc,
						writeEnable => '1',
						output => scrOut);
						
ctrReg : register1 
						port map ( 
						clk => clk,
						rst => rst,
						input => aluReg,
						writeEnable => '1',
						output => regOut);
						
				
						
shiftReg : register4
						port map ( 
						clk => clk,
						rst => rst,
						input => aluCtr,
						writeEnable => '1',
						output => ctrOut);

end Behavioral;

--needs testbencth

