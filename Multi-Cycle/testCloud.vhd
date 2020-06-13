--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:19:18 03/09/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testCloud.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myCloud
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
 
ENTITY testCloud IS
END testCloud;
 
ARCHITECTURE behavior OF testCloud IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myCloud
    PORT(
         immediate : IN  std_logic_vector(15 downto 0);
         control : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal immediate : std_logic_vector(15 downto 0) := (others => '0');
   signal control : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);

 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myCloud PORT MAP (
          immediate => immediate,
          control => control,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		immediate 	<= "0000000000000011";
		control 		<= "00";		
      wait for 100 ns;	

		immediate 	<= "0000000000000010";
		control 		<= "11";		
      wait for 100 ns;	
		
		immediate 	<= "1000000000000100";
		control 		<= "01";		
      wait for 100 ns;	
		
		immediate 	<= "1000000000000011";
		control 		<= "10";		
      wait for 100 ns;	
		
		immediate 	<= "1000000000001100";
		control 		<= "11";		
      wait for 100 ns;	
		
		immediate 	<= "1110000111000000";
		control 		<= "00";		
      wait for 100 ns;	
      wait;
   end process;

END;
