--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:27:14 05/10/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/forward_unit_TB.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: forward_unit
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
 
ENTITY forward_unit_TB IS
END forward_unit_TB;
 
ARCHITECTURE behavior OF forward_unit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT forward_unit
    PORT(
         exmemRd : IN  std_logic_vector(4 downto 0);
         memwbRd : IN  std_logic_vector(4 downto 0);
         rs : IN  std_logic_vector(4 downto 0);
         rt : IN  std_logic_vector(4 downto 0);
         exmemRegWrite : IN  std_logic;
         memwbRegWrite : IN  std_logic;
         forwardA : OUT  std_logic_vector(1 downto 0);
         forwardB : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal exmemRd : std_logic_vector(4 downto 0) := (others => '0');
   signal memwbRd : std_logic_vector(4 downto 0) := (others => '0');
   signal rs : std_logic_vector(4 downto 0) := (others => '0');
   signal rt : std_logic_vector(4 downto 0) := (others => '0');
   signal exmemRegWrite : std_logic := '0';
   signal memwbRegWrite : std_logic := '0';

 	--Outputs
   signal forwardA : std_logic_vector(1 downto 0);
   signal forwardB : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: forward_unit PORT MAP (
          exmemRd => exmemRd,
          memwbRd => memwbRd,
          rs => rs,
          rt => rt,
          exmemRegWrite => exmemRegWrite,
          memwbRegWrite => memwbRegWrite,
          forwardA => forwardA,
          forwardB => forwardB
        );


   -- Stimulus process
   stim_proc: process
   begin		
		exmemRd <= "00000";
		memwbRd <= "00010";
		rs <= "00000";
		rt <= "00000";
		exmemRegWrite <= '1';
		memwbRegWrite <= '1';
      wait for 100 ns;	

		exmemRd <= "00000";
		memwbRd <= "00010";
		rs <= "00000";
		rt <= "00000";
		exmemRegWrite <= '1';
		memwbRegWrite <= '1';
      wait for 100 ns;	
		
		exmemRd <= "00100";
		memwbRd <= "00010";
		rs <= "00010";
		rt <= "00000";
		exmemRegWrite <= '1';
		memwbRegWrite <= '1';
      wait for 100 ns;	
		
		exmemRd <= "00100";
		memwbRd <= "00010";
		rs <= "00000";
		rt <= "00000";
		exmemRegWrite <= '1';
		memwbRegWrite <= '1';
      wait for 100 ns;	
			
		exmemRd <= "00110";
		memwbRd <= "01000";
		rs <= "01000";
		rt <= "00110";
		exmemRegWrite <= '1';
		memwbRegWrite <= '1';
      wait for 100 ns;	

		exmemRd <= "00110";
		memwbRd <= "00111";
		rs <= "01000";
		rt <= "00111";
		exmemRegWrite <= '1';
		memwbRegWrite <= '1';
      wait for 100 ns;	

		exmemRd <= "00111";
		memwbRd <= "00111";
		rs <= "01000";
		rt <= "00111";
		exmemRegWrite <= '1';
		memwbRegWrite <= '1';
      wait for 100 ns;	
      wait;
   end process;

END;
