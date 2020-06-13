--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:07:52 05/10/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testMux3_1.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux3x1
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
 
ENTITY testMux3_1 IS
END testMux3_1;
 
ARCHITECTURE behavior OF testMux3_1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux3x1
    PORT(
         input1 : IN  std_logic_vector(31 downto 0);
         input2 : IN  std_logic_vector(31 downto 0);
         input3 : IN  std_logic_vector(31 downto 0);
         control : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input1 : std_logic_vector(31 downto 0) := (others => '0');
   signal input2 : std_logic_vector(31 downto 0) := (others => '0');
   signal input3 : std_logic_vector(31 downto 0) := (others => '0');
   signal control : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux3x1 PORT MAP (
          input1 => input1,
          input2 => input2,
          input3 => input3,
          control => control,
          output => output
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		input1 <= "00001001000010000100001000010000";
		input2 <= "00010001000010000100001000010000";
		input3 <= "00100001000010000100001000010000";
		control <= "00";
      wait for 100 ns;	

		input1 <= "00001001000010000100001000010000";
		input2 <= "00010001000010000100001000010000";
		input3 <= "00100001000010000100001000010000";
		control <= "01";
      wait for 100 ns;	
		
		input1 <= "00001001000010000100001000010000";
		input2 <= "00010001000010000100001000010000";
		input3 <= "00100001000010000100001000010000";
		control <= "10";
      wait for 100 ns;	

      wait;
   end process;

END;
