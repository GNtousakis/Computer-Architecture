----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:19:56 02/27/2020 
-- Design Name: 
-- Module Name:    registerFile - Behavioral 
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
use work.matrix32.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registerFile is
    Port ( 
		ard1 		: in  STD_LOGIC_VECTOR (4 downto 0);
      ard2 		: in  STD_LOGIC_VECTOR (4 downto 0);
      awr 		: in  STD_LOGIC_VECTOR (4 downto 0);
		rst 		: in 	STD_LOGIC;
      dout1 	: out  STD_LOGIC_VECTOR (31 downto 0);
      dout2 	: out  STD_LOGIC_VECTOR (31 downto 0);
      din 		: in  STD_LOGIC_VECTOR (31 downto 0);
      wrEn 		: in  STD_LOGIC;
      clk 		: in  STD_LOGIC);
end registerFile;

architecture Behavioral of registerFile is
component decoder
	Port ( 	
		input 	: in  STD_LOGIC_VECTOR (4 downto 0);
		output 	: out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component mux
   Port ( 
		input		: in 	matrix(0 to 31);
		control  : in  STD_LOGIC_VECTOR (4 downto 0);
		output   : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component myregister
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC_VECTOR (31 downto 0);
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC_VECTOR (31 downto 0));
end component;

-- signal declaration
type 	matr2x31 is array (0 to 31) of STD_LOGIC;
signal decodeSignal, outSignals1, outSignals2 	: STD_LOGIC_VECTOR (31 downto 0);
signal outRegisters 	: matrix (0 to 31); 
signal enableMe		: matr2x31;	

begin
decoder1 : decoder	port map ( input => awr, output => decodeSignal);

register0 : myregister
					port map (
						clk 			=> clk,
						rst 			=> rst,
						input 		=> din,
						writeEnable	=> '0',
						output 		=> outRegisters(0));

generateRegisters:
for i in 1 to 31 generate
	enableMe(i) <= (decodeSignal(i) and wrEn) after 2 ns;
	registerComp : myregister	
							port map ( 
								clk 			=> clk, 
								rst 			=> rst,
								input 		=> din,
								writeEnable => enableMe(i),
								output 		=> outRegisters(i));
end generate generateRegisters;

muxComp	: mux
					port map (
						input => outRegisters,
						control 	=> ard1,
						output	=> outSignals1);

muxComp2	: mux
					port map (
						input => outRegisters,
						control 	=> ard2,
						output	=> outSignals2);

dout1 <= outSignals1;
dout2 <= outSignals2;
end Behavioral;

