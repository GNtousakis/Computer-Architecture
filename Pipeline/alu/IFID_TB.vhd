--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:54:57 05/02/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/IFID_TB.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IFID
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
 
ENTITY IFID_TB IS
END IFID_TB;
 
ARCHITECTURE behavior OF IFID_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IFID
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         pc_plus4 : IN  std_logic_vector(31 downto 0);
         instr : IN  std_logic_vector(31 downto 0);
         pcout : OUT  std_logic_vector(31 downto 0);
         instrout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal pc_plus4 : std_logic_vector(31 downto 0) := (others => '0');
   signal instr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal pcout : std_logic_vector(31 downto 0);
   signal instrout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 30 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IFID PORT MAP (
          clk => clk,
          rst => rst,
          pc_plus4 => pc_plus4,
          instr => instr,
          pcout => pcout,
          instrout => instrout
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
      
		rst <= '1';
		pc_plus4 <= (others => '0');
		instr <= (others => '0');		
      wait for clk_period*2;

		rst <= '0';
		pc_plus4 <= (others => '0');
		instr <= "00000000000000000000000000110010";		
      wait for clk_period*2;

		rst <= '0';
		pc_plus4 <= "00000000000000000000000000110010";
		instr <= (others => '0');		
      wait for clk_period*2;

		rst <= '0';
		pc_plus4 <= "00000000000000000000000000110010";
		instr <= "00000000000000000000000000110010";		
      wait for clk_period*2;

		rst <= '0';
		pc_plus4 <= "00000000000011000000000000110010";
		instr <= "00000000111100000000000000110010";		
      wait for clk_period*2;

      -- insert stimulus here 

      wait;
   end process;

END;
