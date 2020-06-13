--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:49:38 02/28/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testRF.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registerFile
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
 
ENTITY testRF IS
END testRF;
 
ARCHITECTURE behavior OF testRF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerFile
    PORT(
         ard1 : IN  std_logic_vector(4 downto 0);
         ard2 : IN  std_logic_vector(4 downto 0);
         awr : IN  std_logic_vector(4 downto 0);
         rst : IN  std_logic;
         dout1 : OUT  std_logic_vector(31 downto 0);
         dout2 : OUT  std_logic_vector(31 downto 0);
         din : IN  std_logic_vector(31 downto 0);
         wrEn : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal ard1 : std_logic_vector(4 downto 0) := (others => '0');
   signal ard2 : std_logic_vector(4 downto 0) := (others => '0');
   signal awr : std_logic_vector(4 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal din : std_logic_vector(31 downto 0) := (others => '0');
   signal wrEn : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal dout1 : std_logic_vector(31 downto 0);
   signal dout2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerFile PORT MAP (
          ard1 => ard1,
          ard2 => ard2,
          awr => awr,
          rst => rst,
          dout1 => dout1,
          dout2 => dout2,
          din => din,
          wrEn => wrEn,
          clk => clk
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
		din <= (others => '0');
		wrEn <= '0';
		awr <= "00000";
		ard1 <= "00000";
		ard2 <= "00000";
      wait for 200 ns;	
		
		rst <= '0';
		din <= (others => '1');
		wrEn <= '1';
		awr <= "00001";
		ard1 <= "00001";
		ard2 <= "00001";
      wait for clk_period*3;

		rst <= '0';
		din <= (others => '1');
		wrEn <= '1';
		awr <= "00011";
		ard1 <= "00001";
		ard2 <= "00011";
      wait for clk_period*3;
		
		rst <= '0';
		din <= (others => '1');
		wrEn <= '1';
		awr <= "00000";
		ard1 <= "00000";
		ard2 <= "00011";
      wait for clk_period;
      -- insert stimulus here 
		
      wait;
   end process;

END;
