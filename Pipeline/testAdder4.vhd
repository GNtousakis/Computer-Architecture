--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:08:49 03/09/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testAdder4.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adder4
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
 
ENTITY testAdder4 IS
END testAdder4;
 
ARCHITECTURE behavior OF testAdder4 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adder4
    PORT(
         input : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adder4 PORT MAP (
          input => input,
          output => output
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		input <= "00000000000000000000000000010011";
      wait for 100 ns;	
		input <= "00000000000000000000000000000111";
      wait for 100 ns;	
		input <= "00000000000000000000000001011111";
      wait for 100 ns;
		input <= "00000000000000000000000000010000";
      wait for 100 ns;
		input <= "00000000000000000000000000000000";
      wait for 100 ns;
		input <= "10000000000000000000000000000000";
      wait for 100 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
