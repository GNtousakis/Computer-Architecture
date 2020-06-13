--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:30:16 05/03/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/pc_immedAdd_TB.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: pc_immedAdder
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
 
ENTITY pc_immedAdd_TB IS
END pc_immedAdd_TB;
 
ARCHITECTURE behavior OF pc_immedAdd_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pc_immedAdder
    PORT(
         immed : IN  std_logic_vector(31 downto 0);
         pc_addr : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal immed : std_logic_vector(31 downto 0) := (others => '0');
   signal pc_addr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pc_immedAdder PORT MAP (
          immed => immed,
          pc_addr => pc_addr,
          output => output
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		immed <= "00000000000000000000000000000000";
		pc_addr <= "00000000000000000000000000000000";
      wait for 100 ns;	

		immed <= "00000000000000000000000011000000";
		pc_addr <= "00000000000000000000000000000000";
      wait for 100 ns;	

		immed <= "00000000000000000000000000000001";
		pc_addr <= "00000000000000000000000000000001";
      wait for 100 ns;	

		immed <= "00000000000000000000000000000000";
		pc_addr <= "00000000000000000000000000000111";
      wait for 100 ns;	

		immed <= "00000000000000000000000000000011";
		pc_addr <= "00000000000000000000000000000011";
      wait for 100 ns;	

      wait;
   end process;

END;
