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
    PORT(
         rf_a : IN  std_logic_vector(31 downto 0);
         rf_b : IN  std_logic_vector(31 downto 0);
         immed : IN  std_logic_vector(31 downto 0);
         alu_bin_sel : IN  std_logic;
         alu_func : IN  std_logic_vector(3 downto 0);
         alu_out : OUT  std_logic_vector(31 downto 0);
         alu_zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rf_a : std_logic_vector(31 downto 0) := (others => '0');
   signal rf_b : std_logic_vector(31 downto 0) := (others => '0');
   signal immed : std_logic_vector(31 downto 0) := (others => '0');
   signal alu_bin_sel : std_logic := '0';
   signal alu_func : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal alu_out : std_logic_vector(31 downto 0);
   signal alu_zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: EXSTAGE PORT MAP (
          rf_a => rf_a,
          rf_b => rf_b,
          immed => immed,
          alu_bin_sel => alu_bin_sel,
          alu_func => alu_func,
          alu_out => alu_out,
          alu_zero => alu_zero
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
	
		rf_a <= 	"11111001111000000111001111111111";
		rf_b <= 	"00011110000000110000000000001111";
		immed <= "00000000011000110000000000011011";
		alu_bin_sel <= '0';
		alu_func <= "0000";
      wait for 100 ns;	

		rf_a <= 	"00000000000000000000000000000000";
		rf_b <= 	"00011110000000110000000000001111";
		immed <= "00000000000000000000000000000000";
		alu_bin_sel <= '1';
		alu_func <= "0000";
      wait for 100 ns;	

      wait;
   end process;

END;
