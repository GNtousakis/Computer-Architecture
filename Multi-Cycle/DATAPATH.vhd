----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:10 03/30/2020 
-- Design Name: 
-- Module Name:    DATAPATH - Behavioral 
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


entity DATAPATH is
	port	(
		clk: in STD_LOGIC;
		rst: in STD_LOGIC;
		--This is for IF
		pc_ldEn: in STD_LOGIC;
		nPC_MUX_sel: in STD_LOGIC;	--this goes to IF to choose between +4 and +(4+Immed) --FROM CONTROL
		pcOutput: out STD_LOGIC_VECTOR (31 downto 0); -- this goes to the memory to read the next command from IF
		--This is for DESTATE
		instruction: in STD_LOGIC_VECTOR (31 downto 0); --the imported instruction set
		RegWr: in STD_LOGIC;	-- to write or not to write on registers in DECSTAGE
		RegDst: in STD_LOGIC; -- for choosing between Rd and Rt	
		ExtOp: in STD_LOGIC_VECTOR (1 downto 0); -- this is for the immed extend in cloud
		ALUSrc: in STD_LOGIC;	-- this is doe ALU
		ALUctr: in STD_LOGIC_VECTOR (3 downto 0);	-- this is for ALU
		MemWr: in STD_LOGIC;	-- this controls when to write or not to MEMSTAGE
		MemtoReg: in STD_LOGIC;	-- for choosing between ALU and MEM output in DECSTAGE
		zero: out STD_LOGIC;
		controlByteOp: in STD_LOGIC; --for choosing between  lw/sw (0) and lb/sb (1)
		memoryAddress: out STD_LOGIC_VECTOR (31 downto 0);
		memoryWr: out STD_LOGIC;
		memoryData: out STD_LOGIC_VECTOR (31 downto 0);
		dataFromMemory: in STD_LOGIC_VECTOR (31 downto 0);
		-- Registers enable
		instrRegEn: in STD_LOGIC;
		rfaRegEn: in STD_LOGIC;
		rfbRegEn: in STD_LOGIC;
		immedRegEn: in STD_LOGIC;
		aluRegEn: in STD_LOGIC;
		memRegEn: in STD_LOGIC);
		
		
end DATAPATH;

architecture Behavioral of DATAPATH is

component myregister
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC_VECTOR (31 downto 0);
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component IFSTAGE 
	port  ( 	
		pc_immed : in  STD_LOGIC_VECTOR (31 downto 0);
		pc_sel : in  STD_LOGIC;
		pc_lden : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		clk : in  STD_LOGIC;
		pc : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component DECSTAGE
	port ( 
		instr : in  STD_LOGIC_VECTOR (31 downto 0);
      rf_wren : in  STD_LOGIC;
      alout : in  STD_LOGIC_VECTOR (31 downto 0);
      memout : in  STD_LOGIC_VECTOR (31 downto 0);
      rf_wrdata_sel : in  STD_LOGIC;
      rf_b_select : in  STD_LOGIC;
      immExt : in  STD_LOGIC_VECTOR (1 downto 0);
      clk : in  STD_LOGIC;
		rst : in 	STD_LOGIC;
      immed : out  STD_LOGIC_VECTOR (31 downto 0);
      rf_a : out  STD_LOGIC_VECTOR (31 downto 0);
      rf_b : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component EXSTAGE
	Port ( 
		rf_a : in  STD_LOGIC_VECTOR (31 downto 0);
      rf_b : in  STD_LOGIC_VECTOR (31 downto 0);
      immed : in  STD_LOGIC_VECTOR (31 downto 0);
      alu_bin_sel : in  STD_LOGIC;
      alu_func : in  STD_LOGIC_VECTOR (3 downto 0);
      alu_out : out  STD_LOGIC_VECTOR (31 downto 0);
      alu_zero : out  STD_LOGIC);
end component;

component MEMSTAGE
	Port ( 
		clk : in  STD_LOGIC;
		ByteOp : in STD_LOGIC;
      mem_wrEn : in  STD_LOGIC;
      alu_mem_addr : in  STD_LOGIC_VECTOR (31 downto 0);
      mem_dataIn : in  STD_LOGIC_VECTOR (31 downto 0);
		mem_dataOut : out  STD_LOGIC_VECTOR (31 downto 0);
      mm_addr : out  STD_LOGIC_VECTOR (31 downto 0);
      mm_wr : out  STD_LOGIC;
      mm_wrData : out  STD_LOGIC_VECTOR (31 downto 0);
      mm_rdData : in  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal instReg, rfaReg, rfbReg, imReg, alouReg, memReg: STD_LOGIC_VECTOR (31 downto 0);
signal immediate, outputALU, busA, busB, dataMemToRF	: STD_LOGIC_VECTOR (31 downto 0);
signal signalZero : STD_LOGIC;
begin

instrRegister : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => instruction,
						writeEnable => instrRegEn,
						output => instReg);
						
rfaRegister : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => rfaReg,
						writeEnable => rfaRegEn,
						output => busA);
						
rfbRegister : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => rfbReg,
						writeEnable => rfbRegEn,
						output => busB);
						
immedRegister : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => imReg,
						writeEnable => immedRegEn,
						output => immediate);

aluRegister : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => alouReg,
						writeEnable => aluRegEn,
						output => outputALU);

memRegister : myregister 
						port map ( 
						clk => clk,
						rst => rst,
						input => memReg,
						writeEnable => memRegEn,
						output => dataMemToRF);
						
ifstage1 : IFSTAGE
					port map (
						pc_immed => immediate,
						pc_sel 	=>	nPC_MUX_sel, --nPC_MUX_sel,
						pc_lden	=> pc_ldEn, --maybe wrong always 1?
						rst 		=>	rst, --maybe on Datapath level
						clk 		=> clk,
						pc			=>	pcOutput); -- this goes to ram
						
decoder1 : DECSTAGE
					port map (
						instr 			=> instReg, --erxete apo tin ram 32 bit
						rf_wren 			=> RegWr, --energopoiisi egrafis sto kataxoriti apo control
						alout 			=>	outputALU,
						memout 			=> dataMemToRF,
						rf_wrdata_sel 	=> MemtoReg, -- erxetai apo to control
						rf_b_select 	=> RegDst, -- comes from control
						immExt 			=> ExtOp, --erxetai apo to control kai mas leei ti extend kanei
						clk				=> clk,
						rst 				=>	rst, -- apo to datapath
						immed 			=> imReg,
						rf_a 				=> rfaReg,
						rf_b 				=> rfbReg);
						
ex1 : EXSTAGE
					port map (
						rf_a 			=> busA,
						rf_b 			=>	busB,
						immed 		=> immediate,
						alu_bin_sel => ALUSrc, -- comes from control
						alu_func 	=>	ALUctr, -- comes from control
						alu_out 		=> alouReg, -- output from ALU
						alu_zero 	=> signalZero);		-- otan einai auto 0 tote mallon mpainei pc_lden = 0 ????
						
memStage1 : MEMSTAGE
					port map (
						clk => clk,
						ByteOp => controlByteOp,	-- comes from control
						mem_wrEn => MemWr, --
						alu_mem_addr => outputALU, --alu output
						mem_dataIn =>	 busB,
						mem_dataOut => memReg,
						mm_addr => memoryAddress,
						mm_wr => memoryWr, 
						mm_wrData => memoryData,
						mm_rdData => dataFromMemory);

zero <= signalZero;
end Behavioral;

