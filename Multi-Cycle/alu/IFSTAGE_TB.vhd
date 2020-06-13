--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:25:12 03/09/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testIFSTAGE.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IFSTAGE
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
 
ENTITY testIFSTAGE IS
END testIFSTAGE;
 
ARCHITECTURE behavior OF testIFSTAGE IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IFSTAGE
    PORT(
         pc_immed : IN  std_logic_vector(31 downto 0);
         pc_sel : IN  std_logic;
         pc_lden : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         pc : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pc_immed : std_logic_vector(31 downto 0) := (others => '0');
   signal pc_sel : std_logic := '0';
   signal pc_lden : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal pc : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IFSTAGE PORT MAP (
          pc_immed => pc_immed,
          pc_sel => pc_sel,
          pc_lden => pc_lden,
          rst => rst,
          clk => clk,
          pc => pc
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
		
		-- TODO : Add result 
		rst <= '1';
		pc_immed <= (others => '0');
		pc_sel <= '0';
      pc_lden <= '0';
      wait for clk_period;
		
		rst <= '0';
		pc_immed <= (others => '0');
		pc_sel <= '0';
      pc_lden <= '0';
      wait for clk_period;
		
		rst <= '0';
		pc_immed <= (others => '0');
		pc_sel <= '0';
      pc_lden <= '1';
      wait for clk_period;
		
		rst <= '0';
		pc_immed <= "00000000000000000000000000000001";
		pc_sel <= '1';
      pc_lden <= '0';
      wait for clk_period;
		
		rst <= '0';
		pc_immed <= "00000000000000000000000000000001";
		pc_sel <= '1';
      pc_lden <= '1';
      wait for clk_period;

		rst <= '0';
		pc_immed <= "00000000000000000000000000000010";
		pc_sel <= '1';
      pc_lden <= '1';
      wait for clk_period;
		
		rst <= '0';
		pc_immed <= "00000000000000000000000000000001";
		pc_sel <= '0';
      pc_lden <= '1';
      wait for clk_period;
		
		rst <= '0';
		pc_immed <= "00000000000000000000000000000001";
		pc_sel <= '0';
      pc_lden <= '1';
      wait for clk_period;
		
		rst <= '0';
		pc_immed <= "10000000000000000000000011110001";
		pc_sel <= '1';
      pc_lden <= '1';
      wait for clk_period;
		
		rst <= '0';
		pc_immed <= "11111111111111111100000011110001";
		pc_sel <= '1';
      pc_lden <= '0';
      wait for clk_period;

      -- insert stimulus here 

      wait;
   end process;

END;
