--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:58:08 04/07/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testControl.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CONTROL
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
 
ENTITY testCONTROL IS
END testCONTROL;
 
ARCHITECTURE behavior OF testCONTROL IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONTROL
    PORT(
         instruction : IN  std_logic_vector(31 downto 0);
         nPC_sel : OUT  std_logic;
         regWr : OUT  std_logic;
         regDst : OUT  std_logic;
         extOp : OUT  std_logic_vector(1 downto 0);
         ALUSrc : OUT  std_logic;
         ALUctr : OUT  std_logic_vector(3 downto 0);
         MemWr : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         controlByteOp : OUT  std_logic;
         Zero : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');
   signal Zero : std_logic := '0';

 	--Outputs
   signal nPC_sel : std_logic;
   signal regWr : std_logic;
   signal regDst : std_logic;
   signal extOp : std_logic_vector(1 downto 0);
   signal ALUSrc : std_logic;
   signal ALUctr : std_logic_vector(3 downto 0);
   signal MemWr : std_logic;
   signal MemtoReg : std_logic;
   signal controlByteOp : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL PORT MAP (
          instruction => instruction,
          nPC_sel => nPC_sel,
          regWr => regWr,
          regDst => regDst,
          extOp => extOp,
          ALUSrc => ALUSrc,
          ALUctr => ALUctr,
          MemWr => MemWr,
          MemtoReg => MemtoReg,
          controlByteOp => controlByteOp,
          Zero => Zero
        );


   -- Stimulus process
   stim_proc: process
   begin
		-- hold reset state for 50 ns.
		instruction <= "10000001110000000000000000110000"; --ADD
		Zero <= '0';
      wait for 50 ns;	
			
      -- hold reset state for 50 ns.
		instruction <= "10000001110000000000000000110001"; --SUB
		Zero <= '0';
      wait for 50 ns;	

		instruction <= "10000001110000000000000000110010"; --AND
		Zero <= '1';
      wait for 50 ns;	

		instruction <= "10000001110000000000000000110011"; --OR
		Zero <= '1';
      wait for 50 ns;	
		
		instruction <= "10000001110000000000000000110100"; --NOT
		Zero <= '1';
      wait for 50 ns;	

		instruction <= "10000001110000000000000000110101"; --NAND
		Zero <= '1';
      wait for 50 ns;	
				
		instruction <= "10000001110000000000000000110110"; --NOR
		Zero <= '1';
      wait for 50 ns;	
		
		instruction <= "10000001110000000000000000111000"; --SRA
		Zero <= '1';
      wait for 50 ns;

		instruction <= "10000001110000000000000000111001"; --SRL
		Zero <= '1';
      wait for 50 ns;

		instruction <= "10000001110000000000000000111010"; --SLL
		Zero <= '1';
      wait for 50 ns;

		instruction <= "10000001110000000000000000111100"; --ROL
		Zero <= '1';
      wait for 50 ns;

		instruction <= "10000001110000000000000000111101"; --ROR
		Zero <= '1';
      wait for 50 ns;		

		instruction <= "10000001110000000000000000111101"; --beq
		Zero <= '1';
      wait for 50 ns;	
		
		instruction <= "00000101110000000000000000000001"; --bne
		Zero <= '0';
      wait for 50 ns;
		
		instruction <= "00000101110000000000000000000001"; 
		Zero <= '1';
      wait for 50 ns;
		
		instruction <= "11111101110000000000000000000001";
		Zero <= '0';
      wait for 50 ns;

		instruction <= "10000001110000000000000000110001"; 
		Zero <= '1';
      wait for 50 ns;
		
      --Na mpoun oles oi periptoseis sto testbench
      wait;
   end process;

END;
