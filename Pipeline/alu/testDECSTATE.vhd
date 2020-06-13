--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:35:37 03/10/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testDECSTATE.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DECSTAGE
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
 
ENTITY testDECSTATE IS
END testDECSTATE;
 
ARCHITECTURE behavior OF testDECSTATE IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DECSTAGE
    PORT(
         instr : IN  std_logic_vector(31 downto 0);
         rf_wren : IN  std_logic;
         alout : IN  std_logic_vector(31 downto 0);
         memout : IN  std_logic_vector(31 downto 0);
         rf_wrdata_sel : IN  std_logic;
         rf_b_select : IN  std_logic;
			wrRegister: in STD_LOGIC_VECTOR (4 downto 0);
         immExt : IN  std_logic_vector(1 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
			writeDataOut : OUT std_logic_vector (31 downto 0);
         immed : OUT  std_logic_vector(31 downto 0);
         rf_a : OUT  std_logic_vector(31 downto 0);
         rf_b : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal instr : std_logic_vector(31 downto 0) := (others => '0');
   signal rf_wren : std_logic := '0';
   signal alout : std_logic_vector(31 downto 0) := (others => '0');
   signal memout : std_logic_vector(31 downto 0) := (others => '0');
   signal rf_wrdata_sel : std_logic := '0';
   signal rf_b_select : std_logic := '0';
	signal wrRegister : std_logic_vector(4 downto 0) := (others => '0');
   signal immExt : std_logic_vector(1 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal writeDataOut : std_logic_vector(31 downto 0);
   signal immed : std_logic_vector(31 downto 0);
   signal rf_a : std_logic_vector(31 downto 0);
   signal rf_b : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DECSTAGE PORT MAP (
          instr => instr,
          rf_wren => rf_wren,
          alout => alout,
          memout => memout,
          rf_wrdata_sel => rf_wrdata_sel,
          rf_b_select => rf_b_select,
			 wrRegister => wrRegister,
			 immExt => immExt,
          clk => clk,
          rst => rst,
          immed => immed,
			 writeDataOut => writeDataOut,
          rf_a => rf_a,
          rf_b => rf_b
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
		
		instr <= 	"00000000000000000000000000000011";
      rf_wren <= '1';
		wrRegister <= "00001";
      alout <= 	"11111001111000000111001111111111";
      memout <= 	"00000001111000000111001111111111";
      rf_wrdata_sel <= '0';
      rf_b_select <= '0';
      immExt <= "00";
      rst <= '1';
      wait for clk_period;

		
		instr <= 	"00000000000000111000000000001111";
      rf_wren <= '1';
		wrRegister <= "00011";
      alout <= 	"11111001111000000111001111111111";
      memout <= 	"00000001111000000111001111111111";
      rf_wrdata_sel <= '0';
      rf_b_select <= '0';
      immExt <= "00";
      rst <= '0';
      wait for clk_period;

		instr <= 	"00000000011000110010000000011011";
      rf_wren <= '1';
		wrRegister <= "00010";
      alout <= 	"11111001111000000111001111111111";
      memout <= 	"00000001111000000111001111111111";
      rf_wrdata_sel <= '0';
      rf_b_select <= '0';
      immExt <= "01";
      rst <= '0';
      wait for clk_period;
		
		instr <= 	"00000000011000111000000000011011";
      rf_wren <= '1';
		wrRegister <= "00001";
      alout <= 	"11111001111000000111001111111111";
      memout <= 	"00000001111000000111001111111111";
      rf_wrdata_sel <= '0';
      rf_b_select <= '0';
      immExt <= "10";
      rst <= '0';
      wait for clk_period;
		
		instr <= 	"00000000011000111000000000011011";
      rf_wren <= '1';
		wrRegister <= "10001";
      alout <= 	"11111001111000000111001111111111";
      memout <= 	"00000001111000000111001111111111";
      rf_wrdata_sel <= '0';
      rf_b_select <= '0';
      immExt <= "11";
      rst <= '0';
      wait for clk_period;
		
		instr <= 	"00000000011000110000001100011011";
      rf_wren <= '1';
		wrRegister <= "00101";
      alout <= 	"11111001111000000111001111111111";
      memout <= 	"00000001111000000111001111111111";
      rf_wrdata_sel <= '1';
      rf_b_select <= '0';
      immExt <= "01";
      rst <= '0';
      wait for clk_period;
      -- insert stimulus here 
      wait;
   end process;

END;
