--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:48:49 04/02/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testTOPnoContr.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: topLevelNoControl
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
 
ENTITY testTOPnoContr IS
END testTOPnoContr;
 
ARCHITECTURE behavior OF testTOPnoContr IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT topLevelNoControl
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         nPC_MUX_sel : IN  std_logic;
         RegWr : IN  std_logic;
         RegDst : IN  std_logic;
         ExtOp : IN  std_logic_vector(1 downto 0);
         ALUSrc : IN  std_logic;
         ALUctr : IN  std_logic_vector(3 downto 0);
         MemWr : IN  std_logic;
         MemtoReg : IN  std_logic;
         controlByteOp : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal nPC_MUX_sel : std_logic := '0';
   signal RegWr : std_logic := '0';
   signal RegDst : std_logic := '0';
   signal ExtOp : std_logic_vector(1 downto 0) := (others => '0');
   signal ALUSrc : std_logic := '0';
   signal ALUctr : std_logic_vector(3 downto 0) := (others => '0');
   signal MemWr : std_logic := '0';
   signal MemtoReg : std_logic := '0';
   signal controlByteOp : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 200 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: topLevelNoControl PORT MAP (
          clk => clk,
          rst => rst,
          nPC_MUX_sel => nPC_MUX_sel,
          RegWr => RegWr,
          RegDst => RegDst,
          ExtOp => ExtOp,
          ALUSrc => ALUSrc,
          ALUctr => ALUctr,
          MemWr => MemWr,
          MemtoReg => MemtoReg,
          controlByteOp => controlByteOp
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
		wait for clk_period;
		
		rst <= '0';
		nPC_MUX_sel <= '0';
      RegWr <= '1';
      RegDst <= '1';
      ExtOp <= "00";
      ALUSrc <= '1';
      ALUctr <= "0000";
      MemWr <= '0';
      MemtoReg <= '0';
      controlByteOp <= '0';
      wait for clk_period;
		
		rst <= '0';
		nPC_MUX_sel <= '0';
      RegWr <= '1';
      RegDst <= '1';
      ExtOp <= "00";
      ALUSrc <= '1';
      ALUctr <= "0000";
      MemWr <= '0';
      MemtoReg <= '0';
      controlByteOp <= '0';
      wait for clk_period;
		
		rst <= '0';
		nPC_MUX_sel <= '0';
      RegWr <= '0';
      RegDst <= '1';
      ExtOp <= "00";
      ALUSrc <= '1';
      ALUctr <= "0000";
      MemWr <= '1';
      MemtoReg <= '0';
      controlByteOp <= '0';
      wait for clk_period;

		rst <= '1';  
		RegWr <= '1';
		MemWr <= '0';
      wait;
   end process;

END;
