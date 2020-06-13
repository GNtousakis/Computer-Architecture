----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:43:26 02/25/2020 
-- Design Name: 
-- Module Name:    lab1 - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.ALL;
--use IEEE.STD_LOGIC_SIGNED.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.					
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           op : in  STD_LOGIC_VECTOR (3 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0);
           zero : out  STD_LOGIC;
           cout : out  STD_LOGIC;
           ovf : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is
signal temp, tempA, tempB : STD_LOGIC_VECTOR (31 downto 0);
signal signalCout : STD_LOGIC_VECTOR (32 downto 0);
signal tempZero, tempCout, tempOvf : STD_LOGIC;
begin
--tempA <= (not A) + "00000000000000000000000000000001";
--tempB <= (not B) + "00000000000000000000000000000001";
tempA <= A;
tempB <= B;

process (tempA, tempB, temp, tempZero, tempOvf, tempCout, signalCout, op)
begin
	case op is
		when "0000" => 
			temp <= tempA + tempB; 	-- Add
			signalCout <= ('0' & tempA) + ('0' & tempB);
		when "0001" => 
			temp <= tempA - tempB;		-- Sub
			signalCout <= ('0' & tempA) - ('0' & tempB);
		when "0010" => 
			temp <= tempA and tempB; -- AND
			signalCout <= (others => '0');
		when "0011" =>
			temp <= tempA or tempB;	-- OR
			signalCout <= (others => '0');
		when "0100" => 
			temp <= NOT tempA;		-- NOT
			signalCout <= (others => '0');
		when "0101" => 				-- NAND
			temp <= tempA nand tempB;
			signalCout <= (others => '0');
		when "0110" => 				-- NOR
			temp <= tempA nor tempB;
			signalCout <= (others => '0');
		when "1000" => 				-- SRA
			temp <= std_logic_vector(shift_right(signed(tempA), 1)); 
			signalCout <= (others => '0');			
		when "1001" => 				-- SRL
			temp <= std_logic_vector(shift_right(unsigned(tempA), 1));
			signalCout <= (others => '0');			
		when "1010" => 				-- SLL
			temp <= std_logic_vector(shift_left(unsigned(tempA), 1)); 
			signalCout <= (others => '0');
		when "1100" => 				-- ROL
			temp <= std_logic_vector(unsigned(tempA) rol 1);
			signalCout <= (others => '0');
		when "1101" => 				-- ROR
			temp <= std_logic_vector(unsigned(tempA) ror 1);
			signalCout <= (others => '0');
		when others => 
			temp <= A;	-- For all other case we push A
			signalCout <= (others => '0');
	end case;
	
	--We check for zero result
	if (temp = "00000000000000000000000000000000") then
		tempZero <= '1';
	else 
		tempZero <= '0';
	end if;
	
	-- This is for overflow
	-- The pattern is [(0/0 // 1) || (1/1 // 0)] => overflow
	if (tempA(31) = tempB(31)) then
		if (temp(31) /= tempA(31)) then 
			tempOvf <= '1';
		else 
			tempOvf <= '0';
		end if;
	else 
		tempOvf <= '0';
	end if;
	
	-- This is for signal out
	if (signalCout(32) = '1') then
		tempCout <= '1';
	else 	
		tempCout <= '0';
	end if;
end process;

result <= temp;	-- We pass the temp argument to out
zero <= tempZero;				-- If out is zero this 1
ovf <= tempOvf;
cout <= tempCout;
end Behavioral;

