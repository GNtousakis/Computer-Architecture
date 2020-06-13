--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:12:11 03/10/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testEXSTAGE.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: EXSTAGE
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testEXSTAGE IS
END testEXSTAGE;
 
ARCHITECTURE behavior OF testEXSTAGE IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT EXSTAGE
    Port ( adderImmed : in STD_LOGIC_VECTOR(31 downto 0);
			  rf_a : in  STD_LOGIC_VECTOR (31 downto 0);
           rf_b : in  STD_LOGIC_VECTOR (31 downto 0);
           immed : in  STD_LOGIC_VECTOR (31 downto 0);
			  instr20_16 : in STD_LOGIC_VECTOR (4 downto 0);
			  instr15_11 : in STD_LOGIC_VECTOR (4 downto 0);
           alu_bin_sel : in  STD_LOGIC;
           alu_func : in  STD_LOGIC_VECTOR (3 downto 0);
			  reg_dest : in STD_LOGIC;
           alu_out : out  STD_LOGIC_VECTOR (31 downto 0);
           alu_zero : out  STD_LOGIC;
			  instrShift : out STD_LOGIC_VECTOR (31 downto 0);
			  writeDest: out STD_LOGIC_VECTOR (4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal adderImmed : std_logic_vector(31 downto 0) := (others => '0');
   signal rf_a : std_logic_vector(31 downto 0) := (others => '0');
   signal rf_b : std_logic_vector(31 downto 0) := (others => '0');
   signal immed : std_logic_vector(31 downto 0) := (others => '0');
	signal instr20_16 : std_logic_vector(4 downto 0) := (others => '0');
	signal instr15_11 : std_logic_vector(4 downto 0) := (others => '0');	
   signal alu_bin_sel : std_logic := '0';
   signal alu_func : std_logic_vector(3 downto 0) := (others => '0');
   signal reg_dest : std_logic := '0';

 	--Outputs
   signal alu_out : std_logic_vector(31 downto 0);
   signal alu_zero : std_logic;
   signal instrShift : std_logic_vector(31 downto 0);
   signal writeDest : std_logic_vector(4 downto 0);

   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: EXSTAGE PORT MAP (
			adderImmed => adderImmed,
          rf_a => rf_a,
          rf_b => rf_b,
          immed => immed,
			 instr20_16 => instr20_16,
			 instr15_11 => instr15_11,
          alu_bin_sel => alu_bin_sel,
          alu_func => alu_func,
			 reg_dest => reg_dest,
          alu_out => alu_out,
          alu_zero => alu_zero,
			 instrShift => instrShift,
			 writeDest => writeDest
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
		adderImmed <= "00000000000000000000000000011011";
		rf_a <= 	"11111001111000000111001111111111";
		rf_b <= 	"00011110000000110000000000001111";
		immed <= "00000000011000110000000000011011";
		instr20_16 <= "00000";
		instr15_11 <= "10000";
		alu_bin_sel <= '0';
		alu_func <= "0000";
		reg_dest <= '0';
      wait for 100 ns;	

		adderImmed <= "00000000000000000000000000000011";
		rf_a <= 	"00000000000000000000000000000000";
		rf_b <= 	"00011110000000110000000000001111";
		immed <= "00000000000000000000000000000001";
		instr20_16 <= "00000";
		instr15_11 <= "10000";
		alu_bin_sel <= '1';
		alu_func <= "0000";
		reg_dest <= '1';
      wait for 100 ns;	

		adderImmed <= "00000000000000000000000000011000";
		rf_a <= 	"00000000000000000000000000000000";
		rf_b <= 	"00011110000000110000000000001111";
		immed <= "00000000000000000000000000000011";
		instr20_16 <= "01100";
		instr15_11 <= "10000";
		alu_bin_sel <= '1';
		alu_func <= "0000";
		reg_dest <= '1';
      wait for 100 ns;	

		adderImmed <= "00000000000000000000000000011000";
		rf_a <= 	"00000000000000000000000000000011";
		rf_b <= 	"00011110000000110000000000001111";
		immed <= "00000000000000000000000000000011";
		instr20_16 <= "01100";
		instr15_11 <= "10000";
		alu_bin_sel <= '0';
		alu_func <= "0000";
		reg_dest <= '1';
      wait for 100 ns;	
      wait;
   end process;

END;
