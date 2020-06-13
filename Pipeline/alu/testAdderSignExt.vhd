--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:50:16 03/09/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testAdderSignExt.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adderSignExt
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
 
ENTITY testAdderSignExt IS
END testAdderSignExt;
 
ARCHITECTURE behavior OF testAdderSignExt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adderSignExt
    PORT(
         inputNumber : IN  std_logic_vector(31 downto 0);
         immed16 : IN  std_logic_vector(15 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inputNumber : std_logic_vector(31 downto 0) := (others => '0');
   signal immed16 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adderSignExt PORT MAP (
          inputNumber => inputNumber,
          immed16 => immed16,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		
		inputNumber <= "00000000000000000000000000000000";
		immed16 		<= "0000000000000010";
      wait for 100 ns;	

		inputNumber <= "00000000000000000000000000000000";
		immed16 		<= "1000000000000010";
      wait for 100 ns;	
		
		inputNumber <= "00000000000000000000000000000011";
		immed16 		<= "0000000000001110";
      wait for 100 ns;	
		
		inputNumber <= "00111000000000110000000001110000";
		immed16 		<= "1000000001100010";
      wait for 100 ns;	

      wait;
   end process;

END;
