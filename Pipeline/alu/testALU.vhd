--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:30:28 02/25/2020
-- Design Name:   
-- Module Name:   /home/ISC/gntousakis/lab1/testALU.vhd
-- Project Name:  lab1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lab1
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
 
ENTITY testALU IS
END testALU;
 
ARCHITECTURE behavior OF testALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         op : IN  std_logic_vector(3 downto 0);
         result : OUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic;
         cout : OUT  std_logic;
         ovf : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal op : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   signal zero : std_logic;
   signal cout : std_logic;
   signal ovf : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          A => A,
          B => B,
          op => op,
          result => result,
          zero => zero,
          cout => cout,
          ovf => ovf
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

      -- hold reset state for 100 ns.
		A <= "00000000000000000000000000010011";	--19
		B <= "00000000000000000000000000001100"; 	--12
		op <= "0000"; 	-- Add

      wait for 100 ns;	
		
		-- hold reset state for 100 ns.
		A <= "00000000000000000000000000000000";	--19
		B <= "00000000000000000000000000000000"; 	--12
		op <= "0000"; 	-- Add

      wait for 100 ns;	
		
		-- hold reset state for 100 ns.
		A <= "11111111111111111111111111111111";	--19
		B <= "00000000000000000000000000001100"; 	--12
		op <= "0000"; 	-- Add

      wait for 100 ns;

		
		-- hold reset state for 100 ns.
		A <= "01111111111111111111111111111111";	--19
		B <= "00000000000000000000000000001100"; 	--12
		op <= "0000"; 	-- Add

      wait for 100 ns;		
		-- hold reset state for 100 ns.
		A <= "11111111111111111111111111111111";	--19
		B <= "10000000000000000000000000001100"; 	--12
		op <= "0000"; 	-- Add

      wait for 100 ns;
		
		-- hold reset state for 100 ns.
		A <= "10000000000000000000000000000001";	--19
		B <= "10000000000000000000000000000001"; 	--12
		op <= "0000"; 	-- Add

      wait for 100 ns;
		
		A <= "00000000000000000000000000010011";	--19
		B <= "00000000000000000000000000001100"; 	--12
		op <= "0001"; 	-- Sub

      wait for 100 ns;	

		op <= "0100"; 	-- Sub
      wait for 100 ns;	
		
		A <= "10000000000000000000000000010011";	--19
		op <= "1000"; 	-- Sub
      wait for 100 ns;	
		
		op <= "1001"; 	-- Sub
      wait for 100 ns;	

		op <= "1010"; 	-- Sub
      wait for 100 ns;	
     -- wait for <clock>_period*10;

		op <= "1100"; 	-- Sub
      wait for 100 ns;	
     -- wait for <clock>_period*10;
	  
	  op <= "1101"; 	-- Sub
      wait for 100 ns;	
     -- wait for <clock>_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;
