--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:24:53 03/09/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testMux2x1.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux2x1
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
 
ENTITY testMux2x1 IS
END testMux2x1;
 
ARCHITECTURE behavior OF testMux2x1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux2x1
    PORT(
         input1 : IN  std_logic_vector(31 downto 0);
         input2 : IN  std_logic_vector(31 downto 0);
         control : IN  std_logic;
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input1 : std_logic_vector(31 downto 0) := (others => '0');
   signal input2 : std_logic_vector(31 downto 0) := (others => '0');
   signal control : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2x1 PORT MAP (
          input1 => input1,
          input2 => input2,
          control => control,
          output => output
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		input1 	<= "00000000000000000000000000110011";
		input2 	<= "00000000000000000000000000000111";
		control	<= '0';
      wait for 100 ns;	
		
      -- hold reset state for 100 ns.
		input1 	<= "00000000000000000000000000110011";
		input2 	<= "00000000000000000000000000000111";
		control	<= '1';
      wait for 100 ns;	
		
		      -- hold reset state for 100 ns.
		input1 	<= "00000000000000000000000000110011";
		input2 	<= "11110000000000000000000000000111";
		control	<= '1';
      wait for 100 ns;	

		input1 	<= "00000000000000011111100000110011";
		input2 	<= "11110000000000000000000000000111";
		control	<= '0';
      wait for 100 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
