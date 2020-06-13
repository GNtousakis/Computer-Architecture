--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:11:49 03/10/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testMux2x1_5bit.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux2x1_5bit
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
 
ENTITY testMux2x1_5bit IS
END testMux2x1_5bit;
 
ARCHITECTURE behavior OF testMux2x1_5bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux2x1_5bit
    PORT(
         input1 : IN  std_logic_vector(4 downto 0);
         input2 : IN  std_logic_vector(4 downto 0);
         control : IN  std_logic;
         output : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input1 : std_logic_vector(4 downto 0) := (others => '0');
   signal input2 : std_logic_vector(4 downto 0) := (others => '0');
   signal control : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(4 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2x1_5bit PORT MAP (
          input1 => input1,
          input2 => input2,
          control => control,
          output => output
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		input1 <= "00000";
		input2 <= "11111";
		control <= '1';
      wait for 100 ns;	

      -- hold reset state for 100 ns.
		input1 <= "00000";
		input2 <= "11111";
		control <= '0';
      wait for 100 ns;	

      -- hold reset state for 100 ns.
		input1 <= "00110";
		input2 <= "10011";
		control <= '1';
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
