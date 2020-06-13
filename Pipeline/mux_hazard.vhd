----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:34:51 05/11/2020 
-- Design Name: 
-- Module Name:    mux_hazard - Behavioral 
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

entity mux_hazard is
    Port ( 
				control: in STD_LOGIC;
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
end mux_hazard;

architecture Behavioral of mux_hazard is

begin

process (control, regDst, extOp, ALUSrc, ALUctr, MemWr, MemRd, nPC_sel, branch, regWr, MemtoReg, controlByteOp)
begin
	if (control = '0') then
		regDstOut <= regDst;
      extOpOut <= extOp;
      ALUSrcOut <= ALUSrc;
      ALUctrOut <= ALUctr;
      MemWrOut <= MemWr;
		MemRdOut <= MemRd;
		nPC_selOut <= nPC_sel;
		branchOut <= branch;
		regWrOut <= regWr;
      MemtoRegOut <= MemtoReg;
		controlByteOpOut <= controlByteOp;
	else
		regDstOut <= '0';
      extOpOut <= "00";
      ALUSrcOut <= '0';
      ALUctrOut <= "0000";
      MemWrOut <= '0';
		MemRdOut <= '0';
		nPC_selOut <= '0';
		branchOut <= '0';
		regWrOut <= '0';
      MemtoRegOut <= '0';
		controlByteOpOut <= '0'; 
	end if;
end process;

end Behavioral;

