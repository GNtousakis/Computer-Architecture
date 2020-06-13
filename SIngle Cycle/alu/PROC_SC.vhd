----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:53:49 04/08/2020 
-- Design Name: 
-- Module Name:    PROC_SC - Behavioral 
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

entity PROC_SC is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end PROC_SC;

architecture Behavioral of PROC_SC is

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

component CONTROL
    Port (
		instruction : in  STD_LOGIC_VECTOR (31 downto 0);
      nPC_sel : out  STD_LOGIC;
      regWr : out  STD_LOGIC;
      regDst : out  STD_LOGIC;
      extOp : out  STD_LOGIC_VECTOR (1 downto 0);
      ALUSrc : out  STD_LOGIC;
      ALUctr : out  STD_LOGIC_VECTOR (3 downto 0);
      MemWr : out  STD_LOGIC;
      MemtoReg : out  STD_LOGIC;
		controlByteOp: out STD_LOGIC;
      Zero : in  STD_LOGIC);
end component;

signal zeroSignal, dataWrEn : std_logic;
signal getInstruction, addressFromIFtoMem, dataAddress, data, dataWrite: std_logic_vector(31 downto 0);
signal pcMuxSel, regiWr, regiDst,ALUsource, MemoryWr, MemoryToReg, controlByte: std_logic;
signal exteOp: std_logic_vector(1 downto 0);
signal ALUcontrol: std_logic_vector(3 downto 0);

begin

datapath1: DATAPATH
				port map (
					clk => clk,
					rst => rst,
					nPC_MUX_sel => pcMuxSel,
					pcOutput => addressFromIFtoMem,
					instruction => getInstruction,
					RegWr => regiWr,
					RegDst => regiDst,
					ExtOp => exteOp,
					ALUSrc => ALUsource,
					ALUctr => ALUcontrol,
					MemWr => MemoryWr,
					MemtoReg => MemoryToReg,
					controlByteOp => controlByte,
					zero => zeroSignal,
					memoryAddress => dataAddress,
					memoryWr => dataWrEn,
					memoryData => dataWrite,
					dataFromMemory => data);
					
control1: CONTROL
				port map (
					instruction => getInstruction,
					nPC_sel => pcMuxSel,
					regWr => regiWr,
					regDst => regiDst,
					extOp => exteOp,
					ALUSrc => ALUsource,
					ALUctr => ALUcontrol,
					MemWr => MemoryWr, 
					MemtoReg => MemoryToReg,
					controlByteOp => controlByte,
					Zero => zeroSignal);
					
ram1 : RAM
				port map (
					clk => clk,
					inst_addr => addressFromIFtoMem(12 downto 2),
					inst_dout => getInstruction,
					data_we => dataWrEn,
					data_addr => dataAddress(12 downto 2),
					data_din => dataWrite,
					data_dout => data);


end Behavioral;

