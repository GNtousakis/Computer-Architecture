----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:31:43 05/01/2020 
-- Design Name: 
-- Module Name:    EXMEM - Behavioral 
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

entity EXMEM is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           memWrite : in  STD_LOGIC;
           memRead : in  STD_LOGIC;
			  controlByteOp: in STD_LOGIC;
           branch : in  STD_LOGIC;
			  pc_sel: in STD_LOGIC;
           RegWrite : in  STD_LOGIC;
           MemtoReg : in  STD_LOGIC;
			  zero: in STD_LOGIC;
			  pcImmed: in STD_LOGIC_VECTOR(31 downto 0);
			  aluRst: in STD_LOGIC_VECTOR(31 downto 0);
			  rfb: in STD_LOGIC_VECTOR(31 downto 0);
			  inst5: in STD_LOGIC_VECTOR(4 downto 0);
           memWriteOut : out STD_LOGIC;
           memReadOut : out  STD_LOGIC;
			  controlByteOpOut : out STD_LOGIC;
           branchOut : out  STD_LOGIC;
			  pc_selOut: out STD_LOGIC;
           RegWriteOut : out  STD_LOGIC;
           MemtoRegOut : out  STD_LOGIC;
			  zeroOut: out STD_LOGIC;
			  pcImmedOut: out STD_LOGIC_VECTOR(31 downto 0);
			  aluRstOut: out STD_LOGIC_VECTOR(31 downto 0);
			  rfbOut: out STD_LOGIC_VECTOR(31 downto 0);
			  inst5Out: out STD_LOGIC_VECTOR(4 downto 0));	
end EXMEM;

architecture Behavioral of EXMEM is

component WB
	Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           memtoReg : in  STD_LOGIC;
           RegWr : in  STD_LOGIC;
           memtoRegOut : out  STD_LOGIC;
           regWrOut : out  STD_LOGIC);
end component;

component M
	Port ( clk : in STD_LOGIC;
			 rst : in STD_LOGIC;
			 memWr : in  STD_LOGIC;
          memRead : in  STD_LOGIC;
			 byteOp: in STD_LOGIC;
          branch : in  STD_LOGIC;
			 pc_sel: in STD_LOGIC;
          wrOut : out  STD_LOGIC;
          rdOut : out  STD_LOGIC;
			 byteOpOut: out STD_LOGIC;
          brOut : out  STD_LOGIC;
			 pc_selOut: out STD_LOGIC);
end component;


component myregister
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC_VECTOR (31 downto 0);
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component register1
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC;
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC);
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
					
mConnect: M
				port map(
					clk => clk,
					rst => rst,
					memWr => memWrite,
					memRead => memRead,
					byteOp => controlByteOp,
					branch => branch,
					pc_sel => pc_sel,
					wrOut => memWriteOut,
					rdOut => memReadOut,
					byteOpOut => controlByteOpOut,
					brOut => branchOut,
					pc_selOut => pc_selOut);
					
rfbReg : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => rfb,
						writeEnable => '1',
						output => rfbOut); 
						
aluRstReg : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => aluRst,
						writeEnable => '1',
						output => aluRstOut); 

pcImmedReg : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => pcImmed,
						writeEnable => '1',
						output => pcImmedOut); 

zeroReg : register1 
						port map ( 
						clk => clk,
						rst => rst,
						input => zero,
						writeEnable => '1',
						output => zeroOut);
						
inst5Reg: register5
						port map ( 
						clk => clk,
						rst => rst,
						input => inst5,
						writeEnable => '1',
						output => inst5Out);	

end Behavioral;

