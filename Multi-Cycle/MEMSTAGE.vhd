library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity MEMSTAGE is
    Port ( clk : in  STD_LOGIC;
			  ByteOp : in STD_LOGIC;
           mem_wrEn : in  STD_LOGIC;
           alu_mem_addr : in  STD_LOGIC_VECTOR (31 downto 0);
           mem_dataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           mem_dataOut : out  STD_LOGIC_VECTOR (31 downto 0);
           mm_addr : out  STD_LOGIC_VECTOR (31 downto 0);
           mm_wr : out  STD_LOGIC;
           mm_wrData : out  STD_LOGIC_VECTOR (31 downto 0);
           mm_rdData : in  STD_LOGIC_VECTOR (31 downto 0));
end MEMSTAGE;

architecture Behavioral of MEMSTAGE is

component memOffset
   Port ( 
		memAddr : in  STD_LOGIC_VECTOR (31 downto 0);
      memAddrOffs : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

signal dataIn, dataOut : std_logic_vector(7 downto 0);
signal finalOut, finalIn, addrOffset: std_logic_vector(31 downto 0);
begin
-- This is for mem_dataOut
process (dataOut, mm_rdData, finalOut, byteOp)
begin
	if (byteOp = '1') then 
		dataOut <= mm_rdData(7 downto 0);
      finalOut <= std_logic_vector(resize(unsigned(dataOut), 32)); -- load byte
	else 
		dataOut <= "00000000";
		finalOut <= mm_rdData;
	end if;
end process;

-- This is for mm_wrData
process (dataIn, mem_dataIn, finalIn, byteOp, mem_wrEn)
begin
	if (mem_wrEn = '1' and byteOp = '1') then
		dataIn <= mem_dataIn(7 downto 0);
      finalIn <= std_logic_vector(resize(unsigned(dataIn), 32)); -- store byte
   else 
		dataIn <= "00000000";
		finalIn <= mem_dataIn;
	end if;
end process;

mm_wrData <= finalIn;
mem_dataOut <= finalOut;

mm_wr <= mem_wrEn;

addrOff : memOffset
    port map (
        memAddr => alu_mem_addr,
        memAddrOffs => addrOffset);
mm_addr <= std_logic_vector(shift_left((unsigned(addrOffset)), 2));


end Behavioral;