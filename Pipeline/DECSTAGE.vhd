----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:21:37 03/10/2020 
-- Design Name: 
-- Module Name:    DECSTAGE - Behavioral 
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

entity DECSTAGE is
    Port ( clk : in  STD_LOGIC;
			  rst	: in 	STD_LOGIC;
			  instr : in  STD_LOGIC_VECTOR (31 downto 0);
           rf_wren : in  STD_LOGIC;
           alout : in  STD_LOGIC_VECTOR (31 downto 0);
           memout : in  STD_LOGIC_VECTOR (31 downto 0);
			  wrRegister: in STD_LOGIC_VECTOR (4 downto 0);
           rf_wrdata_sel : in  STD_LOGIC;
           rf_b_select : in  STD_LOGIC;
           immExt : in  STD_LOGIC_VECTOR (1 downto 0);
			  writeDataOut : out STD_LOGIC_VECTOR (31 downto 0);
           immed : out  STD_LOGIC_VECTOR (31 downto 0);
           rf_a : out  STD_LOGIC_VECTOR (31 downto 0);
           rf_b : out  STD_LOGIC_VECTOR (31 downto 0));
end DECSTAGE;

architecture Behavioral of DECSTAGE is

--component declaration
component mux2x1
    Port ( input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component mux2x1_5bit
    Port ( input1 : in  STD_LOGIC_VECTOR (4 downto 0);
           input2 : in  STD_LOGIC_VECTOR (4 downto 0);
           control : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (4 downto 0));
end component;

component myCloud
	    Port ( 	immediate : in  STD_LOGIC_VECTOR (15 downto 0);
					control : in  STD_LOGIC_VECTOR (1 downto 0);
					output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component registerFile
		    Port ( 	ard1 		: in  STD_LOGIC_VECTOR (4 downto 0);
						ard2 		: in  STD_LOGIC_VECTOR (4 downto 0);
						awr 		: in  STD_LOGIC_VECTOR (4 downto 0);
						rst 		: in 	STD_LOGIC;
						dout1 	: out  STD_LOGIC_VECTOR (31 downto 0);
						dout2 	: out  STD_LOGIC_VECTOR (31 downto 0);
						din 		: in  STD_LOGIC_VECTOR (31 downto 0);
						wrEn 		: in  STD_LOGIC;
						clk 		: in  STD_LOGIC);
end component;

--signal declaration
signal writeData, finalOutput1, finalOutput2, finalImmed : STD_LOGIC_VECTOR (31 downto 0);
signal tempImmed : STD_LOGIC_VECTOR (15 downto 0);
signal tempRs, tempRd, tempRt, outSignalReg2 : STD_LOGIC_VECTOR (4 downto 0);

signal controlBSel, controlWrData, tempRfEnable : STD_LOGIC;
begin

tempImmed 	<= instr(15 downto 0);
tempRt 		<= instr(15 downto 11);
tempRd 		<= instr(20 downto 16);
tempRs		<= instr(25 downto 21);

controlWrData <= rf_wrdata_sel;
tempRfEnable  <= rf_wren;

cloud1 	: myCloud
				port map (
					immediate 	=> tempImmed,
					control 		=> immExt,
					output		=> finalImmed);

-- for 0 ~> tempRt else tempRd
mux1 		: mux2x1_5bit
				port map (
					input1		=> tempRt,
					input2 		=> tempRd,
					control		=> rf_b_select,
					output		=> outSignalReg2);
					
mux2 		: mux2x1
				port map (
					input1		=> alout,
					input2 		=> memout,
					control		=> controlWrData,
					output		=> writeData);

registerFile1 : registerFile
							port map (
								ard1	=> tempRs,
								ard2 	=> outSignalReg2,
								awr 	=> wrRegister,
								din	=> writeData,
								wrEn 	=> tempRfEnable,
								clk 	=> clk,
								rst 	=> rst,
								dout1	=> finalOutput1,
								dout2	=> finalOutput2);

immed <= finalImmed;								
rf_a <= finalOutput1;
rf_b <= finalOutput2;
writeDataOut <= writeData;
end Behavioral;

