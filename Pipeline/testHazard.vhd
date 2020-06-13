--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:27:53 05/11/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testHazard.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: hazard_detection
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
 
ENTITY testHazard IS
END testHazard;
 
ARCHITECTURE behavior OF testHazard IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT hazard_detection
    PORT(
         memRdIDEX : IN  std_logic;
         rdIDEX : IN  std_logic_vector(4 downto 0);
         rs : IN  std_logic_vector(4 downto 0);
         rt : IN  std_logic_vector(4 downto 0);
         IFIDenable : OUT  std_logic;
         pcWrite : OUT  std_logic;
         muxSel : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal memRdIDEX : std_logic := '0';
   signal rdIDEX : std_logic_vector(4 downto 0) := (others => '0');
   signal rs : std_logic_vector(4 downto 0) := (others => '0');
   signal rt : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal IFIDenable : std_logic;
   signal pcWrite : std_logic;
   signal muxSel : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: hazard_detection PORT MAP (
          memRdIDEX => memRdIDEX,
          rdIDEX => rdIDEX,
          rs => rs,
          rt => rt,
          IFIDenable => IFIDenable,
          pcWrite => pcWrite,
          muxSel => muxSel
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		memRdIDEX <= '0';
		rdIDEX <= "00010";
		rs <= "00010";
		rt <= "00011";
      wait for 100 ns;	

		memRdIDEX <= '1';
		rdIDEX <= "00010";
		rs <= "00010";
		rt <= "00011";
      wait for 100 ns;	
		
		memRdIDEX <= '1';
		rdIDEX <= "00010";
		rs <= "00010";
		rt <= "00010";
      wait for 100 ns;	
		
		memRdIDEX <= '1';
		rdIDEX <= "00010";
		rs <= "00110";
		rt <= "00011";
      wait for 100 ns;	
      wait;
   end process;

END;
