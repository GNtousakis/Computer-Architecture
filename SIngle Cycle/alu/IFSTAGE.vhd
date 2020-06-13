----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:33 03/09/2020 
-- Design Name: 
-- Module Name:    IFSTAGE - Behavioral 
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
use ieee.std_logic_unsigned.all;


entity IFSTAGE is
    Port ( pc_immed : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_sel : in  STD_LOGIC;
           pc_lden : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           pc : out  STD_LOGIC_VECTOR (31 downto 0));
end IFSTAGE;

architecture Behavioral of IFSTAGE is

--component declaration
component myregister
	Port ( 
		clk		: in  STD_LOGIC;
		rst 		: in STD_LOGIC;
      input 	: in  STD_LOGIC_VECTOR (31 downto 0);
      writeEnable	: in  STD_LOGIC;
      output 	: out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component mux2x1
    Port ( input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component adder4
    Port ( input : in  STD_LOGIC_VECTOR (31 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

--signal declaration
signal outSignalMux, outSignalsAddImmed, outSignalAdder4, finalSignal, output 	: STD_LOGIC_VECTOR (31 downto 0);


begin
adder4_1			:	adder4
							port map (
											input 		=> finalSignal,
											output		=> outSignalAdder4);

process (outSignalsAddImmed, outSignalAdder4, pc_immed)
begin
	outSignalsAddImmed <= pc_immed + outSignalAdder4;
end process;
				
mux				: mux2x1
							port map (
								input1 		=> outSignalAdder4,
								input2		=>	outSignalsAddImmed,
								control		=> pc_sel,
								output		=> outSignalMux);
											
myregister1		: myregister
							port map (
								clk			=> clk,
								rst			=> rst,
								input 		=> outSignalMux,
								writeEnable	=> pc_lden,
								output		=> finalSignal);
						

pc <= finalSignal;
end Behavioral;

