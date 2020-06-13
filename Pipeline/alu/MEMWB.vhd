----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:47:37 05/01/2020 
-- Design Name: 
-- Module Name:    MEMWB - Behavioral 
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


entity MEMWB is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  RegWrite: in STD_LOGIC;
           MemtoReg : in  STD_LOGIC;
			  rdData : in STD_LOGIC_VECTOR(31 downto 0);
			  aluResult: in STD_LOGIC_VECTOR(31 downto 0);
			  instr5: in STD_LOGIC_VECTOR(4 downto 0);
           RegWriteOut : out  STD_LOGIC;
           MemtoRegOut : out  STD_LOGIC;
			  rdDataOut : out STD_LOGIC_VECTOR(31 downto 0);
			  aluResultOut: out STD_LOGIC_VECTOR(31 downto 0);
			  instr5Out: out STD_LOGIC_VECTOR(4 downto 0));	
end MEMWB;

architecture Behavioral of MEMWB is
component WB
	Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           memtoReg : in  STD_LOGIC;
           RegWr : in  STD_LOGIC;
           memtoRegOut : out  STD_LOGIC;
           regWrOut : out  STD_LOGIC);
end component;

component myregister
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC_VECTOR (31 downto 0);
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component register5
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC_VECTOR (4 downto 0);
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC_VECTOR (4 downto 0));
end component;

begin

wbConnect: WB
				port map(
					clk => clk,
					rst => rst,
					memtoReg => MemtoReg,
					RegWr => RegWrite,
					memtoRegOut => MemtoRegOut,
					regWrOut => RegWriteOut);
					
						
rdDataReg : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => rdData,
						writeEnable => '1',
						output => rdDataOut); 
						
						
aluResultReg : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => aluResult,
						writeEnable => '1',
						output => aluResultOut); 

instr5Reg: register5
						port map ( 
						clk => clk,
						rst => rst,
						input => instr5,
						writeEnable => '1',
						output => instr5Out);	

end Behavioral;

