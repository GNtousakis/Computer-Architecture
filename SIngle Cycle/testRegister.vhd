--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:11:01 02/26/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testRegister.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: myregister
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
 
ENTITY testRegister IS
END testRegister;
 
ARCHITECTURE behavior OF testRegister IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT myregister
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         input : IN  std_logic_vector(31 downto 0);
         writeEnable : IN  std_logic;
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal input : std_logic_vector(31 downto 0) := (others => '0');
   signal writeEnable : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: myregister PORT MAP (
          clk => clk,
          rst => rst,
          input => input,
          writeEnable => writeEnable,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <= '1';
		writeEnable <= '1';
		input <= "00000000000000000000001100011011";
      wait for 100 ns;	
		
		rst <= '0';
		writeEnable <= '1';
		input <= "00000000000000000000000000000011";
      wait for 100 ns;
	
		rst <= '0';		
		writeEnable <= '1';
		input <= "00000000000000000000000000011011";
      wait for clk_period*2;		
      -- insert stimulus here
		
		rst <= '0';				
		writeEnable <= '0';
		input <= "00000000000000000000001100011011";
      wait for clk_period*2;		
		
		rst <= '0';		
		writeEnable <= '1';
		input <= "00000000000000000000001100011011";
      wait for clk_period*2;	
      wait;
   end process;

END;
