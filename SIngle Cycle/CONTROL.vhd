library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONTROL is
    Port ( instruction : in  STD_LOGIC_VECTOR (31 downto 0);
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
end CONTROL;

architecture Behavioral of CONTROL is
signal pcSel, regiWr, regiDst, ALUsource, MemoryWr, MemoryToReg, byteOp : std_logic;
signal extendOp: std_logic_vector(1 downto 0);
signal opcode: std_logic_vector(5 downto 0);
signal func, ALUcontrol: std_logic_vector(3 downto 0);


begin

opcode <= instruction(31 downto 26);
		
--ALUsource signal
process (opcode, regiDst, ALUsource)
begin
	if (opcode = "100000" or opcode = "000000" or opcode = "000001" ) then
		ALUsource <= '0';		
	else
		ALUsource <= '1';
	end if;
end process;

process (opcode, regiDst)
begin
	if (opcode = "100000") then
		regiDst <= '0';
	else 
		regiDst <= '1';
	end if;
end process;




--ALUctr signal
process (opcode, ALUcontrol, instruction) 
begin
	if (opcode(5) = '1' and opcode(4) = '0') then
		ALUcontrol <= instruction(3 downto 0);		--func	
	elsif (opcode = "110010") then
		ALUcontrol <= "0101";	
	elsif (opcode = "110011" or opcode = "111111") then
		ALUcontrol <= "0011";
	elsif (opcode = "000000" or opcode = "000001") then
		ALUcontrol <= "0001";
	else 
		ALUcontrol <= "0000";
	end if;
end process;

--MemoryWr
process (opcode, MemoryWr)
begin
	if (opcode = "000111" or opcode = "011111") then
		MemoryWr <= '1';
	else
		MemoryWr <= '0';
	end if;
end process;

-- this is for pcSel // branch
process (opcode, pcSel, Zero)
begin
	if (opcode = "111111") then -- b command
		pcSel <= '1';
	elsif (opcode = "000000") then -- beq command
		if (Zero = '0') then
			pcSel <= '0';
		else 
			pcSel <= '1';
		end if;
	elsif (opcode = "000001") then -- bne command
		if (Zero = '0') then
			pcSel <= '1';
		else 
			pcSel <= '0';
		end if;
	else
		pcSel <= '0';
	end if;
end process;

--byteop
process (opcode, byteOp)
begin
	if (opcode = "000011" or opcode = "000111") then
		byteOp <= '1';
	else
		byteOp <= '0';
	end if;
end process;

--memToReg
process (opcode, MemoryToReg)
begin 
	if (opcode = "000011" or opcode = "011111" or opcode = "001111") then
		MemoryToReg <= '1';
	else 
		MemoryToReg <= '0';
	end if;
end process;

--regWrite
process (opcode, regiWr)
begin
	if (opcode = "000000" or opcode = "000001" or opcode = "000111" or opcode = "011111") then
		regiWr <= '0';
	else
		regiWr <= '1';
	end if;
end process;

--ExtOp
process (opcode, extendOp)
begin
	if (opcode = "111001") then
		extendOp <= "11";
	elsif (opcode = "110010" or opcode = "110011") then
		extendOp <= "10";
	elsif (opcode = "111111" or opcode = "000000" or opcode = "000001") then
		extendOp <= "01";
	else 
		extendOp <= "00";
	end if;
end process;

--signals connection
regDst <= regiDst;
ALUsrc <= ALUsource;
ALUctr <= ALUcontrol;
MemWr <= MemoryWr;
nPC_sel <= pcSel;
controlByteOp <= byteop;
memToReg <= MemoryToReg;
regWr <= regiWr;
ExtOp <= extendOp;

end Behavioral;
