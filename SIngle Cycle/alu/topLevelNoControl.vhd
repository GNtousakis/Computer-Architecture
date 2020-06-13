----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:54:32 04/02/2020 
-- Design Name: 
-- Module Name:    topLevelNoControl - Behavioral 
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

entity topLevelNoControl is
	port (
		-- General
		clk: in STD_LOGIC;
		rst: in STD_LOGIC;
		-- From control
		nPC_MUX_sel: in STD_LOGIC;	--this goes to IF to choose between +4 and +(4+Immed)
		RegWr: in STD_LOGIC;	-- to write or not to write on registers in DECSTAGE from CONTROL
		RegDst: in STD_LOGIC; -- for choosing between Rd and Rt	
		ExtOp: in STD_LOGIC_VECTOR (1 downto 0); -- this is for the immed extend in cloud	
		ALUSrc: in STD_LOGIC;	-- this is goes to ALU
		ALUctr: in STD_LOGIC_VECTOR (3 downto 0);	-- this is for ALU
		MemWr: in STD_LOGIC;	-- this controls when to write or not to MEMSTAGE
		MemtoReg: in STD_LOGIC;	-- for choosing between ALU and MEM output in DECSTAGE
		controlByteOp: in STD_LOGIC); --for choosing between  lw/sw (0) and lb/sb (1)

end topLevelNoControl;



architecture Behavioral of topLevelNoControl is

component DATAPATH
	port	(
		clk: in STD_LOGIC;
		rst: in STD_LOGIC;
		--This is for IF
		nPC_MUX_sel: in STD_LOGIC;	--this goes to IF to choose between +4 and +(4+Immed) from CONTROL
		pcOutput: out STD_LOGIC_VECTOR (31 downto 0); -- this goes to the memory to read the next command from IF
		--This is for DESTATE
		instruction: in STD_LOGIC_VECTOR (31 downto 0); --the imported instruction set from MEMORY
		RegWr: in STD_LOGIC;	-- to write or not to write on registers in DECSTAGE from CONTROL
		RegDst: in STD_LOGIC; -- for choosing between Rd and Rt from CONTROL
		ExtOp: in STD_LOGIC_VECTOR (1 downto 0); -- this is for the immed extend in cloud from CONTROL
		ALUSrc: in STD_LOGIC;	-- this is goes to ALU from CONTROL
		ALUctr: in STD_LOGIC_VECTOR (3 downto 0);	-- this is for ALU from CONTROL
		MemWr: in STD_LOGIC;	-- this controls when to write or not to MEMSTAGE from CONTROL
		MemtoReg: in STD_LOGIC;	-- for choosing between ALU and MEM output in DECSTAGE from CONTROL
		zero: out STD_LOGIC;	-- this goes to control
		controlByteOp: in STD_LOGIC; --for choosing between  lw/sw (0) and lb/sb (1) from CONTROL
		memoryAddress: out STD_LOGIC_VECTOR (31 downto 0);
		memoryWr: out STD_LOGIC;
		memoryData: out STD_LOGIC_VECTOR (31 downto 0);
		dataFromMemory: in STD_LOGIC_VECTOR (31 downto 0));
end component;

component RAM
	port (
		clk : in std_logic;
		inst_addr : in std_logic_vector(10 downto 0);
		inst_dout : out std_logic_vector(31 downto 0);
		data_we : in std_logic;
		data_addr : in std_logic_vector(10 downto 0);
		data_din : in std_logic_vector(31 downto 0);
		data_dout : out std_logic_vector(31 downto 0));
end component;

--signal 
signal addressFromIFtoMem, getInstr  : std_logic_vector(31 downto 0); --THIS IS FOR IFSTAGE
signal dataAddress, data, dataWrite : std_logic_vector(31 downto 0); --THIS IS FOR MEMSTAGE
signal dataWrEn : std_logic;
begin

datapath1: DATAPATH
				port map (
					clk => clk,
					rst => rst,
					nPC_MUX_sel => nPC_MUX_sel,
					pcOutput => addressFromIFtoMem,
					instruction => getInstr,
					RegWr => RegWr,
					RegDst => RegDst,
					ExtOp => ExtOp,
					ALUSrc => ALUSrc,
					ALUctr => ALUctr,
					MemWr => MemWr,
					MemtoReg => MemtoReg,
					controlByteOp => controlByteOp,
					zero => open,
					memoryAddress => dataAddress,
					memoryWr => dataWrEn,
					memoryData => dataWrite,
					dataFromMemory => data);

ram1 : RAM
				port map (
					clk => clk,
					inst_addr => addressFromIFtoMem(12 downto 2),
					inst_dout => getInstr,
					data_we => dataWrEn,
					data_addr => dataAddress(12 downto 2),
					data_din => dataWrite,
					data_dout => data);
end Behavioral;

