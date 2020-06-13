--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:24:47 03/11/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testOffset.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memOffset
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
use ieee.numeric_std.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testOffset IS
END testOffset;
 
ARCHITECTURE behavior OF testOffset IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memOffset
    PORT(
         memAddr : IN  std_logic_vector(31 downto 0);
         memAddrOffs : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal memAddr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal memAddrOffs : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memOffset PORT MAP (
          memAddr => memAddr,
          memAddrOffs => memAddrOffs
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      
		for i in 0 to 1024 loop	
				memAddr	<= std_logic_vector( to_unsigned(i, memAddr'length));
				wait for 20 ns;
		end loop;


      wait;
   end process;

END;
