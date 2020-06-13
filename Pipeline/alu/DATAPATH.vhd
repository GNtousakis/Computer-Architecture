library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DATAPATH is
	port	(
		clk: in STD_LOGIC;
		rst: in STD_LOGIC;
		--This comes from MEM
		instruction: in STD_LOGIC_VECTOR (31 downto 0); --the imported instruction set
		--This comes from control
		ALUSrc: in STD_LOGIC;	-- this is doe ALU
		ALUctr: in STD_LOGIC_VECTOR (3 downto 0);	-- this is for ALU
		RegDst: in STD_LOGIC; -- for choosing between Rd and Rt	
		ExtOp: in STD_LOGIC_VECTOR (1 downto 0); -- this is for the immed extend in cloud
		MemWr: in STD_LOGIC;	-- this controls when to write or not to MEMSTAGE
		MemRd: in STD_LOGIC;	-- this controls when to write or not to MEMSTAGE
		nPC_MUX_sel: in STD_LOGIC;	--this goes to IF to choose between +4 and +(4+Immed) --FROM CONTROL
		branch: in STD_LOGIC; 
		MemtoReg: in STD_LOGIC;	-- for choosing between ALU and MEM output in DECSTAGE
		RegWr: in STD_LOGIC;	-- to write or not to write on registers in DECSTAGE
		--This is for IF
		pcOutput: out STD_LOGIC_VECTOR (31 downto 0); -- this goes to the memory to read the next command from IF
		--This is for DESTATE
		controlSignal: out STD_LOGIC_VECTOR(31 downto 0); --this goes to control
		controlByteOp: in STD_LOGIC; --for choosing between  lw/sw (0) and lb/sb (1)
		memoryAddress: out STD_LOGIC_VECTOR (31 downto 0);
		memoryWr: out STD_LOGIC;
		memoryData: out STD_LOGIC_VECTOR (31 downto 0);
		dataFromMemory: in STD_LOGIC_VECTOR (31 downto 0));
end DATAPATH;

architecture Behavioral of DATAPATH is

component IFSTAGE 
	port  ( 	
		pc_immed : in  STD_LOGIC_VECTOR (31 downto 0);
		pc_sel : in  STD_LOGIC;
		pc_lden : in  STD_LOGIC;
		rst : in  STD_LOGIC;
		clk : in  STD_LOGIC;
		pc : out  STD_LOGIC_VECTOR (31 downto 0);
		adderOut: out STD_LOGIC_VECTOR(31 downto 0));
end component;

component IFID 
    Port ( 
		clk : in STD_LOGIC;
		rst : in STD_LOGIC;
		enable: in STD_LOGIC;
		pc_plus4 : in  STD_LOGIC_VECTOR (31 downto 0);
      instr : in  STD_LOGIC_VECTOR (31 downto 0);
      pcout : out  STD_LOGIC_VECTOR (31 downto 0);
      instrout : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component hazard_detection
    Port ( memRdIDEX : in  STD_LOGIC;
           rdIDEX : in  STD_LOGIC_VECTOR (4 downto 0);
           rs : in  STD_LOGIC_VECTOR (4 downto 0);
           rt : in  STD_LOGIC_VECTOR (4 downto 0);
           IFIDenable : out  STD_LOGIC;
           pcWrite : out  STD_LOGIC;
           muxSel : out  STD_LOGIC);
end component;

component mux_hazard
	    Port ( control: in STD_LOGIC;
           regDst : in  STD_LOGIC;
           extOp : in  STD_LOGIC_VECTOR (1 downto 0);
           ALUSrc : in  STD_LOGIC;
           ALUctr : in  STD_LOGIC_VECTOR (3 downto 0);
           MemWr : in  STD_LOGIC;
			  MemRd : in  STD_LOGIC;
			  nPC_sel : in  STD_LOGIC; -- bne, beq
			  branch : in STD_LOGIC; -- branch
			  regWr : in  STD_LOGIC;
           MemtoReg : in STD_LOGIC;
			  controlByteOp: in STD_LOGIC;
			  regDstOut : out  STD_LOGIC;
           extOpOut : out  STD_LOGIC_VECTOR (1 downto 0);
           ALUSrcOut : out  STD_LOGIC;
           ALUctrOut : out  STD_LOGIC_VECTOR (3 downto 0);
           MemWrOut : out  STD_LOGIC;
			  MemRdOut : out  STD_LOGIC;
			  nPC_selOut : out  STD_LOGIC; -- bne, beq
			  branchOut : out STD_LOGIC; -- branch
			  regWrOut : out  STD_LOGIC;
           MemtoRegOut : out  STD_LOGIC;
			  controlByteOpOut: out STD_LOGIC
			  );
end component;

component DECSTAGE
	port ( 
		instr : in  STD_LOGIC_VECTOR (31 downto 0);
      rf_wren : in  STD_LOGIC;
      alout : in  STD_LOGIC_VECTOR (31 downto 0);
      memout : in  STD_LOGIC_VECTOR (31 downto 0);
		wrRegister: in STD_LOGIC_VECTOR (4 downto 0);
      rf_wrdata_sel : in  STD_LOGIC;
      rf_b_select : in  STD_LOGIC;
      immExt : in  STD_LOGIC_VECTOR (1 downto 0);
      clk : in  STD_LOGIC;
		rst : in 	STD_LOGIC;
		writeDataOut : out STD_LOGIC_VECTOR (31 downto 0);
      immed : out  STD_LOGIC_VECTOR (31 downto 0);
      rf_a : out  STD_LOGIC_VECTOR (31 downto 0);
      rf_b : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component IDEX
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
			  controlByteOpOut: out STD_LOGIC;
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
end component;

component forward_unit
	Port ( exmemRd : in  STD_LOGIC_VECTOR (4 downto 0);
           memwbRd : in  STD_LOGIC_VECTOR (4 downto 0);
           rs : in  STD_LOGIC_VECTOR (4 downto 0);
           rt : in  STD_LOGIC_VECTOR (4 downto 0);
			  exmemRegWrite: in STD_LOGIC;
			  memwbRegWrite: in STD_LOGIC;
           forwardA : out  STD_LOGIC_VECTOR (1 downto 0);
           forwardB : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component mux3x1
	Port ( input1 : in  STD_LOGIC_VECTOR (31  downto 0);
           input2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  input3 : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component EXSTAGE
    Port ( adderImmed : in STD_LOGIC_VECTOR(31 downto 0);
			  rf_a : in  STD_LOGIC_VECTOR (31 downto 0);
           rf_b : in  STD_LOGIC_VECTOR (31 downto 0);
           immed : in  STD_LOGIC_VECTOR (31 downto 0);
			  instr20_16 : in STD_LOGIC_VECTOR (4 downto 0);
           alu_bin_sel : in  STD_LOGIC;
           alu_func : in  STD_LOGIC_VECTOR (3 downto 0);
			  reg_dest : in STD_LOGIC;
           alu_out : out  STD_LOGIC_VECTOR (31 downto 0);
           alu_zero : out  STD_LOGIC;
			  instrShift : out STD_LOGIC_VECTOR (31 downto 0);
			  writeDest: out STD_LOGIC_VECTOR (4 downto 0));
end component;

component EXMEM
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
			  controlByteOpOut: out STD_LOGIC;
           branchOut : out  STD_LOGIC;
			  pc_selOut: out STD_LOGIC;
           RegWriteOut : out  STD_LOGIC;
           MemtoRegOut : out  STD_LOGIC;
			  zeroOut: out STD_LOGIC;
			  pcImmedOut: out STD_LOGIC_VECTOR(31 downto 0);
			  aluRstOut: out STD_LOGIC_VECTOR(31 downto 0);
			  rfbOut: out STD_LOGIC_VECTOR(31 downto 0);
			  inst5Out: out STD_LOGIC_VECTOR(4 downto 0));	
end component;

component MEMSTAGE
	Port ( 
		clk : in  STD_LOGIC;
		ByteOp : in STD_LOGIC;
      mem_wrEn : in  STD_LOGIC;
		mem_rdEn : in STD_LOGIC;
      alu_mem_addr : in  STD_LOGIC_VECTOR (31 downto 0);
      mem_dataIn : in  STD_LOGIC_VECTOR (31 downto 0);
		mem_dataOut : out  STD_LOGIC_VECTOR (31 downto 0);
      mm_addr : out  STD_LOGIC_VECTOR (31 downto 0);
      mm_wr : out  STD_LOGIC;
      mm_wrData : out  STD_LOGIC_VECTOR (31 downto 0);
      mm_rdData : in  STD_LOGIC_VECTOR (31 downto 0);
		zero: in STD_LOGIC;
		branch: in STD_LOGIC;
		pc_sel: in STD_LOGIC;
		branchOut: out STD_LOGIC);
end component;

component MEMWB
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
end component;

signal immediate, outputALU, busA, busB, dataMemToRF, outImmed, adderImmedIDEX, readDataWB, readDataMEMWB, aluRstMEMWB: STD_LOGIC_VECTOR (31 downto 0);
signal signalZero, regDstIDEX, memWrIDEX, memRdIDEX, brachIDEX, regWrIDEX, memToRegIDEX, memWrEXMEM, memRdEXMEM, brachEXMEM, regWrEXMEM, memToRegEXMEM: STD_LOGIC;
signal zeroEXMEM, byteOpIDEX, byteOpEXMEM, regWrMEMWB, memToRegMEMWB, pcSrc, pc_selOut, pc_selEXMEM, aluSrcIDEX, ifidEn, pcEn, muxHaz, RegDstHaz,controlByteOpHaz, ALUSrcHaz, regWrHaz, MemtoRegHaz, MemWrHaz, MemRdHaz, nPC_selHaz, branchHaz: STD_LOGIC;
signal instr, adderOutTemp, addOutReg, immediateDec, pcImmedEXMEM, aluRstEXMEM, rfEXMEM  : STD_LOGIC_VECTOR( 31 downto 0);
signal busaIDEX, busbIDEX, instrIDEX, writeToRegister, muxRfa, muxRfb: STD_LOGIC_VECTOR( 31 downto 0);
signal instr20_16IDEX, instr15_11IDEX, wrDestEXMEM, inst5EXMEM, inst5MEMWB, instr25_21IDEX: STD_LOGIC_VECTOR(4 downto 0);
signal shiftOpIDEX : std_logic_vector(2 downto 0);
signal aluCtrIDEX, ALUctrHaz: std_logic_vector(3 downto 0);
signal forwA, forwB, extOpHaz: std_logic_vector(1 downto 0);
begin

ifstage1 : IFSTAGE
					port map (
						pc_immed => immediate,
						pc_sel 	=>	pcSrc, --nPC_MUX_sel,
						pc_lden	=> pcEn, --maybe wrong always 1?
						rst 		=>	rst, --maybe on Datapath level
						clk 		=> clk,
						pc			=>	pcOutput,
						adderOut => adderOutTemp); -- this goes to ram
						
ifidA: IFID
					port map( 
						clk => clk,
						rst => rst,
						enable => ifidEn,
						pc_plus4 => adderOutTemp,
						instr => instruction,
						pcout => addOutReg,
						instrout => instr);
						
controlSignal <= instr;			

hazard: hazard_detection
					port map ( 
						memRdIDEX => memRdIDEX,
						rdIDEX => instr20_16IDEX,
						rs =>  instr( 25 downto 21),
						rt =>  instr(15 downto 11),
						IFIDenable => ifidEn,
						pcWrite => pcEn,
						muxSel => muxHaz);
						
			  
decoder1 : DECSTAGE
					port map (
						clk				=> clk,
						rst 				=>	rst, 
						instr 			=> instr, --erxete apo tous kataxwrites IFID
						rf_wren 			=> regWrMEMWB, --erxete apo to MEMWB
						-- auto ginete ston kiklo toy MEMWB
						alout 			=>	aluRstMEMWB, -- ayta erxontai apo MEMWB
						memout 			=> readDataMEMWB, -- ayta erxontai apo MEMWB
						wrRegister 		=> inst5MEMWB,
						rf_wrdata_sel 	=> memToRegMEMWB, -- ayta erxontai apo MEMWB
						-- dialegei metaksei tou rd and rt
						rf_b_select 	=> RegDst, -- comes from control
						immExt 			=> extOpHaz, --erxetai apo to control kai mas leei ti extend kanei
						-- output auta pane stous kataxwrites IDEX
						writeDataOut 	=> writeToRegister,
						immed 			=> immediateDec, --apla ginete signed extend
						rf_a 				=> busA,
						rf_b 				=> busB);
						
muxHazard : mux_hazard
					port map (
						control => muxHaz,
						regDst => RegDst,
						extOp => ExtOp,
						ALUSrc => ALUSrc,
						ALUctr => ALUctr,
						MemWr => MemWr,
						MemRd => MemRd,
						nPC_sel => nPC_MUX_sel,
						branch => branch,
						regWr => RegWr,
						MemtoReg => MemtoReg,
						controlByteOp => controlByteOp,
						regDstOut => RegDstHaz,
						extOpOut => extOpHaz,
						ALUSrcOut => ALUSrcHaz,
						ALUctrOut => ALUctrHaz,
						MemWrOut => MemWrHaz,
						MemRdOut => MemRdHaz,
						nPC_selOut => nPC_selHaz,
						branchOut => branchHaz,
						regWrOut => regWrHaz,
						MemtoRegOut => MemtoRegHaz,
						controlByteOpOut=> controlByteOpHaz);
						
idex1: IDEX 
					port map (
						clk => clk,
						rst => rst,
						adderImmed => adderOutTemp,
						aluSrc => ALUSrcHaz,
						aluCtr => ALUctrHaz,
						RegDst => RegDstHaz,
						memWrite => MemWrHaz,
						memRead => MemRdHaz,
						controlByteOp => controlByteOpHaz,
						branch => branchHaz,
						pc_sel => nPC_selHaz,
						RegWrite => regWrHaz, 
						MemtoReg => MemtoRegHaz,
						rd1 => busA,
						rd2 => busB,
						instrExt => immediateDec,
						instr25_21 => instr( 25 downto 21),
						instr15_11 => instr(15 downto 11),
						instr20_16 => instr(20 downto 16),
						adderImmedOut => adderImmedIDEX,
						aluSrcOut => aluSrcIDEX,
						aluCtrOut => aluCtrIDEX,
						RegDstOut => regDstIDEX,
						memWriteOut => memWrIDEX,
						memReadOut => memRdIDEX,
						controlByteOpOut => byteOpIDEX,
						branchOut => brachIDEX,
						pc_selOut => pc_selOut,
						RegWriteOut => regWrIDEX,
						MemtoRegOut => memToRegIDEX,
						rd1Out => busaIDEX,
						rd2Out => busbIDEX, 
						instrExtOut => instrIDEX,
						instr25_21Out => instr25_21IDEX,
						instr15_11Out => instr15_11IDEX,
						instr20_16Out => instr20_16IDEX);
						
forwarding_unit: forward_unit
					port map ( 
						exmemRd => inst5EXMEM,
						memwbRd => inst5MEMWB,
						rs => instr25_21IDEX,
						rt => instr15_11IDEX,
						exmemRegWrite => regWrEXMEM,
						memwbRegWrite => regWrMEMWB,
						forwardA => forwA,
						forwardB => forwB);

mux_rfa: mux3x1
		port map ( 
				input1 => aluRstEXMEM,
				input2 => writeToRegister,
				input3 => busaIDEX,
				control => forwA,
				output => muxRfa);

mux_rfb: mux3x1
		port map ( 
				input1 => aluRstEXMEM,
				input2 => writeToRegister,
				input3 => busbIDEX,
				control => forwB,
				output => muxRfB);
				
ex1 : EXSTAGE
					port map (
						adderImmed  => adderImmedIDEX,
						rf_a 			=> muxRfa,
						rf_b 			=>	muxRfB,
						immed 		=> instrIDEX,
						instr20_16  => instr20_16IDEX,
						alu_bin_sel => aluSrcIDEX, 
						alu_func 	=>	aluCtrIDEX, 
						reg_dest		=> regDstIDEX,
						alu_out 		=> outputALU,
						alu_zero 	=> signalZero,
						instrShift  => outImmed,
						writeDest   => wrDestEXMEM);		
						
exmem1: EXMEM
				port map( 
					clk => clk,
					rst => rst,
					memWrite => memWrIDEX,
					memRead => memRdIDEX,
					controlByteOp => byteOpIDEX,
					branch => brachIDEX,
					pc_sel => pc_selOut,
					RegWrite => regWrIDEX,
					MemtoReg => memToRegIDEX,
					zero => signalZero,
					pcImmed => outImmed,
					aluRst => outputALU,
					rfb => busbIDEX,
					inst5 => wrDestEXMEM,
					memWriteOut => memWrEXMEM,
					memReadOut => memRdEXMEM,
					controlByteOpOut => byteOpEXMEM,
					branchOut => brachEXMEM,
					pc_selOut => pc_selEXMEM,
					RegWriteOut => regWrEXMEM,
					MemtoRegOut => memToRegEXMEM,
					zeroOut => zeroEXMEM,
					pcImmedOut => pcImmedEXMEM,
					aluRstOut => aluRstEXMEM,
					rfbOut => rfEXMEM,
					inst5Out =>	inst5EXMEM);
						
memStage1 : MEMSTAGE
					port map (
						clk => clk,
						ByteOp => byteOpEXMEM,	-- comes from control
						mem_wrEn => memWrEXMEM, -- flag gia grapsimo stin mnimi
						mem_rdEn => memRdEXMEM, -- flag gia read apo stin mnimi
						alu_mem_addr => aluRstEXMEM, --apotelesma alu
						mem_dataIn =>	 rfEXMEM, -- bus b  gia grapsimo stin mnimi
						mem_dataOut => readDataWB, -- i sinoliki eksodos pou paei ston kataxwriti 
						mm_addr => memoryAddress, -- pane stin mnimi
						mm_wr => memoryWr,  -- pane stin mnimi
						mm_wrData => memoryData,  -- pane stin mnimi
						mm_rdData => dataFromMemory,  -- erxete apo tin mnimi paei sto mem_stage
						zero => zeroEXMEM, -- kainoyrgia gia to branch
						branch => brachEXMEM,
						pc_sel => pc_selEXMEM,
						branchOut => pcSrc
						);

memwb1: MEMWB
				port map( 
					clk => clk,
					rst => rst,
					RegWrite => regWrEXMEM,
					MemtoReg => memToRegEXMEM,
					rdData => readDataWB,
					aluResult => aluRstEXMEM,
					instr5 => inst5EXMEM, 
					RegWriteOut => regWrMEMWB,
					MemtoRegOut => memToRegMEMWB,
					rdDataOut => readDataMEMWB,
					aluResultOut => aluRstMEMWB,
					instr5Out => inst5MEMWB);	
					
end Behavioral;

