----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:58:50 03/10/2020 
-- Design Name: 
-- Module Name:    EXSTAGE - Behavioral 
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

entity EXSTAGE is
    Port ( rf_a : in  STD_LOGIC_VECTOR (31 downto 0);
           rf_b : in  STD_LOGIC_VECTOR (31 downto 0);
           immed : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_bin_sel : in  STD_LOGIC;
           alu_func : in  STD_LOGIC_VECTOR (3 downto 0);
           alu_out : out  STD_LOGIC_VECTOR (31 downto 0);
           alu_zero : out  STD_LOGIC);
end EXSTAGE;

architecture Behavioral of EXSTAGE is


component mux2x1
    Port ( input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component alu
		    Port (
				A : in  STD_LOGIC_VECTOR (31 downto 0);
				B : in  STD_LOGIC_VECTOR (31 downto 0);
				op : in  STD_LOGIC_VECTOR (3 downto 0);
				result : out  STD_LOGIC_VECTOR (31 downto 0);
				zero : out  STD_LOGIC;
				cout : out  STD_LOGIC;
				ovf : out  STD_LOGIC);
end component;

signal tempOutput, tempRes : STD_LOGIC_VECTOR( 31 downto 0);
signal tempZero	: STD_LOGIC;
begin

mux : 	mux2x1
				port map (
					input1		=> rf_b,
					input2 		=> immed,
					control		=> alu_bin_sel,
					output		=> tempOutput);
					
alu1 : 	alu
				port map (
					A 			=> rf_a,
					B			=> tempOutput,
					op			=> alu_func,
					result	=> tempRes,
					zero		=> tempZero,
					ovf		=> open,
					cout		=> open);

alu_out <= tempRes;
alu_zero <= tempZero;
end Behavioral;

