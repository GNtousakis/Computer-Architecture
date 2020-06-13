----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:51:26 05/01/2020 
-- Design Name: 
-- Module Name:    IDEX - Behavioral 
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

entity IDEX is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  adderImmed : in STD_LOGIC_VECTOR(31 downto 0);
           aluSrc : in  STD_LOGIC;
           aluCtr : in  STD_LOGIC_VECTOR (3 downto 0);
           RegDst : in  STD_LOGIC;
           memWrite : in  STD_LOGIC;
           memRead : in  STD_LOGIC;
			  controlByteOp: in STD_LOGIC;
           branch : in  STD_LOGIC;
			  pc_sel : in STD_LOGIC;
           RegWrite : in  STD_LOGIC;
           MemtoReg : in  STD_LOGIC;
           rd1 : in  STD_LOGIC_VECTOR (31 downto 0);
           rd2 : in  STD_LOGIC_VECTOR (31 downto 0);
           instrExt : in  STD_LOGIC_VECTOR (31 downto 0);
           instr25_21 : in  STD_LOGIC_VECTOR (4 downto 0);
           instr15_11 : in  STD_LOGIC_VECTOR (4 downto 0);
           instr20_16 : in  STD_LOGIC_VECTOR (4 downto 0);
			  adderImmedOut : out STD_LOGIC_VECTOR(31 downto 0);
			  aluSrcOut : out  STD_LOGIC;
           aluCtrOut : out STD_LOGIC_VECTOR (3 downto 0);
           RegDstOut : out  STD_LOGIC;
           memWriteOut : out STD_LOGIC;
           memReadOut : out  STD_LOGIC;
			  controlByteOpOut : out STD_LOGIC;
           branchOut : out  STD_LOGIC;
			  pc_selOut : out STD_LOGIC;
           RegWriteOut : out  STD_LOGIC;
           MemtoRegOut : out  STD_LOGIC;
           rd1Out : out  STD_LOGIC_VECTOR (31 downto 0);
           rd2Out : out STD_LOGIC_VECTOR (31 downto 0);
           instrExtOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  instr25_21Out : out  STD_LOGIC_VECTOR (4 downto 0);
           instr15_11Out : out  STD_LOGIC_VECTOR (4 downto 0);
           instr20_16Out : out  STD_LOGIC_VECTOR (4 downto 0));
end IDEX;

architecture Behavioral of IDEX is

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
			 pc_sel : in STD_LOGIC;
          wrOut : out  STD_LOGIC;
          rdOut : out  STD_LOGIC;
			 byteOpOut: out STD_LOGIC;
          brOut : out  STD_LOGIC;
			 pc_selOut : out STD_LOGIC);

end component;

component EX
    Port ( clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  aluSrc : in  STD_LOGIC;
           aluCtr : in  STD_LOGIC_VECTOR (3 downto 0);
           aluReg : in  STD_LOGIC;
           scrOut : out  STD_LOGIC;
           ctrOut : out  STD_LOGIC_VECTOR (3 downto 0);
           regOut : out  STD_LOGIC);	
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

exConnect: EX
				port map(
					clk => clk,
					rst => rst,
					aluSrc => aluSrc,
					aluCtr => aluCtr,
					aluReg => RegDst,
					scrOut => aluSrcOut,
					ctrOut => aluCtrOut,
					regOut => RegDstOut);
					
pcImmed : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => adderImmed,
						writeEnable => '1',
						output => adderImmedOut); 
						
rfaReg : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => rd1,
						writeEnable => '1',
						output => rd1Out); 
					
rfbReg : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => rd2,
						writeEnable => '1',
						output => rd2Out);

immedReg : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => instrExt,
						writeEnable => '1',
						output => instrExtOut);

instr5Reg: register5
						port map ( 
						clk => clk,
						rst => rst,
						input => instr20_16,
						writeEnable => '1',
						output => instr20_16Out);						

instr5_2Reg: register5
						port map ( 
						clk => clk,
						rst => rst,
						input => instr25_21,
						writeEnable => '1',
						output => instr25_21Out);	
						
instr5_3Reg: register5
						port map ( 
						clk => clk,
						rst => rst,
						input => instr15_11,
						writeEnable => '1',
						output => instr15_11Out);		 						
end Behavioral;

