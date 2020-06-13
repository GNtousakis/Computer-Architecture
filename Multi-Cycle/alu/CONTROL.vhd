library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROL is
    Port ( 
				clk: in STD_LOGIC;
				rst: in STD_LOGIC;
				instruction : in  STD_LOGIC_VECTOR (31 downto 0);
				Zero : in  STD_LOGIC;
				pc_ldEn: out STD_LOGIC;
				nPC_sel : out  STD_LOGIC;
				regWr : out  STD_LOGIC;
				regDst : out  STD_LOGIC;
				extOp : out  STD_LOGIC_VECTOR (1 downto 0);
				ALUSrc : out  STD_LOGIC;
				ALUctr : out  STD_LOGIC_VECTOR (3 downto 0);
				MemWr : out  STD_LOGIC;
				MemtoReg : out  STD_LOGIC;
				controlByteOp: out STD_LOGIC;
				--Registers enable
				instrRegEn: out STD_LOGIC;
				rfaRegEn: out STD_LOGIC;
				rfbRegEn: out STD_LOGIC;
				immedRegEn: out STD_LOGIC;
				aluRegEn: out STD_LOGIC;
				memRegEn: out STD_LOGIC);
end CONTROL;

architecture Behavioral of CONTROL is

type stateType is (instFetch, decode, rType, IRstore, iType, branch, load1, load2, load3, store1, store2, branchCase, branchcase2);
signal currentS, nextS: stateType;

signal pcSel, regiWr, regiDst, ALUsource, MemoryWr, MemoryToReg, byteOp : std_logic;
signal extendOp: std_logic_vector(1 downto 0);
signal opcode: std_logic_vector(5 downto 0);
signal func, ALUcontrol: std_logic_vector(3 downto 0);

begin

opcode <= instruction(31 downto 26);
ALUcontrol <= instruction (3 downto 0);
fsm_comb: process(currentS, opcode, instruction, Zero)
	begin
		case currentS IS
			when instFetch => nextS <= decode;	
									pc_ldEn <= '0';
									nPC_sel <= '0';
									instrRegEn <= '1';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '0';
									memRegEn <= '0';
									regWr <= '0';
									regDst <= '0';
									extOp <= "00";
									ALUSrc <= '0';
									ALUctr <= "0000";
									MemWr <= '0';
									MemtoReg <= '0';
									controlByteOp <= '0';
			when decode	=> 	case opcode IS
										when "100000" => nextS <= rType;
															  regDst <= '0';
															  extOp <= "00";
										when "111000"  => nextS <= iType;
															 regDst <= '1';
															 extOp <= "00";
										when "110000" => nextS <= iType;
															 regDst <= '1';
															 extOp <= "00";
										when "111001" => nextS <= iType;
															  regDst <= '1';
															  extOp <= "11";
										when "110010"  => nextS <= iType;
															  regDst <= '1';
															  extOp <= "10";	
										when "110011" => nextS <= iType;
															  regDst <= '1';
															  extOp <= "10";																					 
										when "111111" => nextS <= branch;
																regDst <= '1';
																extOp <= "01";
										when "000000" => nextS <= branchCase;
																regDst <= '1';
																extOp <= "01";
										when "000001" => nextS <= branchCase;
															  regDst <= '1';
															  extOp <= "01";
										when "000011" => nextS <= load1;
																regDst <= '1';
																extOp <= "00";
										when "001111" => nextS <= load1;
																regDst <= '1';
																extOp <= "00";
										when "000111" => nextS <= store1;
															regDst <= '1';
															extOp <= "00";
										when "011111" => nextS <= store1;
															regDst <= '1';
															extOp <= "00";										
										when others => nextS <= instFetch;
										end case;
									regWr <= '0';
									instrRegEn <= '0';
									rfaRegEn <= '1';
									rfbRegEn <= '1';
									immedRegEn <= '1';
									aluRegEn <= '0';
									memRegEn <= '0';
								   ALUSrc <= '0';
									ALUctr <= "0000";
									MemWr <= '0';
									MemtoReg <= '0';
									controlByteOp <= '0';
			when rType => nextS <= IRstore;
									--Registers
									instrRegEn <= '0';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '1';
									memRegEn <= '0';
									--Commands
									pc_ldEn <= '0';
									nPC_sel <= '0';
									ALUSrc <= '0';
									ALUctr <= ALUcontrol;
									regWr <= '0';
									regDst <= '0';
									extOp <= "00";
									MemWr <= '0';
									MemtoReg <= '0';
									controlByteOp <= '0';								
			when IRstore => nextS <= instFetch;
									--Registers
									instrRegEn <= '0';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '0';
									memRegEn <= '0';
									--Commands
									pc_ldEn <= '1';
									nPC_sel <= '0';
									ALUSrc <= '0';
									ALUctr <= ALUcontrol;
									regWr <= '1';
									regDst <= '0';
									extOp <= "00";
									MemWr <= '0';
									MemtoReg <= '0';
									controlByteOp <= '0';	
			when iType => nextS <= IRstore;
									--Registers
									instrRegEn <= '0';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '1';
									memRegEn <= '0';
									--Commands
									pc_ldEn <= '0';
									nPC_sel <= '0';
									ALUSrc <= '1';
									if (opcode= "110010") then
										ALUctr <= "0101";
									elsif (opcode= "110011") then
										ALUctr <= "0011";
									else 
										ALUctr <= "0000";
									end if;
									regWr <= '0';
									regDst <= '0';
									extOp <= "00";
									MemWr <= '0';
									MemtoReg <= '0';
									controlByteOp <= '0';	
			when branch => nextS <= instFetch;
									--Registers
									instrRegEn <= '0';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '0';
									memRegEn <= '0';
									--Commands
									pc_ldEn <= '1';
									nPC_sel <= '1';
									ALUSrc <= '1';
									ALUctr <= "0000";
									regWr <= '0';
									regDst <= '0';
									extOp <= "00";
									MemWr <= '0';
									MemtoReg <= '0';
									controlByteOp <= '0';		
			when store1 => nextS <= store2;
									--Registers
									instrRegEn <= '0';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '1';
									memRegEn <= '0';
									--Commands
									pc_ldEn <= '0';
									nPC_sel <= '0';
									ALUSrc <= '1';
									ALUctr <= "0000";
									regWr <= '0';
									regDst <= '0';
									extOp <= "00";
									MemWr <= '0';
									MemtoReg <= '0';
									controlByteOp <= '0';	
			when store2 => nextS <= instFetch;
									--Registers
									instrRegEn <= '0';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '0';
									memRegEn <= '0';
									--Commands
									pc_ldEn <= '1';
									nPC_sel <= '0';
									ALUSrc <= '0';
									ALUctr <= "0000";
									regWr <= '0';
									regDst <= '0';
									extOp <= "00";
									MemWr <= '1';
									MemtoReg <= '0';
									if (opcode = "000111") then
										controlByteOp <= '1';
									else 
										controlByteOp <= '0';
									end if;
			when load1 => nextS <= load2;
									--Registers
									instrRegEn <= '0';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '1';
									memRegEn <= '0';
									--Commands
									pc_ldEn <= '0';
									nPC_sel <= '0';
									ALUSrc <= '1';
									ALUctr <= "0000";
									regWr <= '0';
									regDst <= '0';
									extOp <= "00";
									MemWr <= '0';
									MemtoReg <= '0';
									controlByteOp <= '0';
			when load2 => nextS <= load3;
									--Registers
									instrRegEn <= '0';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '0';
									memRegEn <= '1';
									--Commands
									pc_ldEn <= '0';
									nPC_sel <= '0';
									ALUSrc <= '0';
									ALUctr <= "0000";
									regWr <= '0';
									regDst <= '0';
									extOp <= "00";
									MemWr <= '0';
									MemtoReg <= '0';
									if (opcode = "000011") then
										controlByteOp <= '1';
									else 
										controlByteOp <= '0';
									end if;
			when load3 => nextS <= instFetch;
									--Registers
									instrRegEn <= '0';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '0';
									memRegEn <= '0';
									--Commands
									pc_ldEn <= '1';
									nPC_sel <= '0';
									ALUSrc <= '0';
									ALUctr <= "0000";
									regWr <= '1';
									regDst <= '0';
									extOp <= "00";
									MemWr <= '0';
									MemtoReg <= '1';
									controlByteOp <= '0';
			when branchCase => nextS <= branchCase2;
									--Registers
									instrRegEn <= '0';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '1';
									memRegEn <= '0';
									--Commands
									pc_ldEn <= '0';
									nPC_sel <= '0';
									ALUSrc <= '0';
									ALUctr <= "0001";
									regWr <= '0';
									regDst <= '0';
									extOp <= "00";
									MemWr <= '0';
									MemtoReg <= '0';
									controlByteOp <= '0';					
			when branchCase2 => nextS <= instFetch;
									--Registers
									instrRegEn <= '0';
									rfaRegEn <= '0';
									rfbRegEn <= '0';
									immedRegEn <= '0';
									aluRegEn <= '0';
									memRegEn <= '0';
									--Commands
									pc_ldEn <= '1';
									if (opcode = "000000") then 
										if (Zero = '0') then
											nPC_sel <= '0';
										else
											nPC_sel <= '1';
										end if;
									else 
										if (Zero = '0') then
											nPC_sel <= '1';
										else
											nPC_sel <= '0';
										end if;
									end if;
									ALUSrc <= '0';
									ALUctr <= "0000";
									regWr <= '0';
									regDst <= '0';
									extOp <= "00";
									MemWr <= '0';
									MemtoReg <= '0';
									controlByteOp <= '0';							
	end case;
end process fsm_comb;

fsm_synch: process (clk, rst)
	begin
		if (rst='1')  	   			then 	currentS <= instFetch;  
       	elsif (rising_edge(clk))  	then	currentS <= nextS; 
     	end if;
end process fsm_synch;


end Behavioral;
