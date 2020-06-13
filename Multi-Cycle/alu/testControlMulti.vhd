--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:22:52 04/26/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testControlMulti.vhd
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
 
ENTITY testControlMulti IS
END testControlMulti;
 
ARCHITECTURE behavior OF testControlMulti IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CONTROL
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         instruction : IN  std_logic_vector(31 downto 0);
         Zero : IN  std_logic;
         pc_ldEn : OUT  std_logic;
         nPC_sel : OUT  std_logic;
         regWr : OUT  std_logic;
         regDst : OUT  std_logic;
         extOp : OUT  std_logic_vector(1 downto 0);
         ALUSrc : OUT  std_logic;
         ALUctr : OUT  std_logic_vector(3 downto 0);
         MemWr : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         controlByteOp : OUT  std_logic;
         instrRegEn : OUT  std_logic;
         rfaRegEn : OUT  std_logic;
         rfbRegEn : OUT  std_logic;
         immedRegEn : OUT  std_logic;
         aluRegEn : OUT  std_logic;
         memRegEn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal instruction : std_logic_vector(31 downto 0) := (others => '0');
   signal Zero : std_logic := '0';

 	--Outputs
   signal pc_ldEn : std_logic;
   signal nPC_sel : std_logic;
   signal regWr : std_logic;
   signal regDst : std_logic;
   signal extOp : std_logic_vector(1 downto 0);
   signal ALUSrc : std_logic;
   signal ALUctr : std_logic_vector(3 downto 0);
   signal MemWr : std_logic;
   signal MemtoReg : std_logic;
   signal controlByteOp : std_logic;
   signal instrRegEn : std_logic;
   signal rfaRegEn : std_logic;
   signal rfbRegEn : std_logic;
   signal immedRegEn : std_logic;
   signal aluRegEn : std_logic;
   signal memRegEn : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CONTROL PORT MAP (
          clk => clk,
          rst => rst,
          instruction => instruction,
          Zero => Zero,
          pc_ldEn => pc_ldEn,
          nPC_sel => nPC_sel,
          regWr => regWr,
          regDst => regDst,
          extOp => extOp,
          ALUSrc => ALUSrc,
          ALUctr => ALUctr,
          MemWr => MemWr,
          MemtoReg => MemtoReg,
          controlByteOp => controlByteOp,
          instrRegEn => instrRegEn,
          rfaRegEn => rfaRegEn,
          rfbRegEn => rfbRegEn,
          immedRegEn => immedRegEn,
          aluRegEn => aluRegEn,
          memRegEn => memRegEn
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
		-- hold reset state for 50 ns.
		rst <= '1';
      wait for clk_period*2;
		
		instruction <= "10000001110000000000000000110000"; --ADD
		rst <= '0';
		Zero <= '0';
      wait for clk_period*4;
			
      -- hold reset state for 50 ns.
		instruction <= "10000001110000000000000000110001"; --SUB
		Zero <= '0';
      wait for clk_period*4;

		instruction <= "10000001110000000000000000110010"; --AND
		Zero <= '1';
      wait for clk_period*4;

		instruction <= "10000001110000000000000000110011"; --OR
		Zero <= '1';
      wait for clk_period*4;
		
		instruction <= "10000001110000000000000000110100"; --NOT
		Zero <= '1';
      wait for clk_period*4;

		instruction <= "10000001110000000000000000110101"; --NAND
		Zero <= '1';
      wait for clk_period*4;
				
		instruction <= "10000001110000000000000000110110"; --NOR
		Zero <= '1';
      wait for clk_period*4;
		
		instruction <= "10000001110000000000000000111000"; --SRA
		Zero <= '1';
      wait for clk_period*4;

		instruction <= "10000001110000000000000000111001"; --SRL
		Zero <= '1';
      wait for clk_period*4;

		instruction <= "10000001110000000000000000111010"; --SLL
		Zero <= '1';
      wait for clk_period*4;

		instruction <= "10000001110000000000000000111100"; --ROL
		Zero <= '1';
      wait for clk_period*4;

		instruction <= "10000001110000000000000000111101"; --ROR
		Zero <= '1';
      wait for clk_period*4;

		instruction <= "10000001110000000000000000111101"; --beq
		Zero <= '1';
      wait for clk_period*4;
		
		instruction <= "00000101110000000000000000000001"; --bne
		Zero <= '0';
      wait for clk_period*4;
		
		instruction <= "11111101110000000000000000000001"; -- b
		Zero <= '0';
      wait for clk_period*3;
		
		instruction <= "11000000000001010000000000001000"; --bne
		Zero <= '0';
      wait for clk_period*4;
		
		
      --Na mpoun oles oi periptoseis sto testbench
      wait;
   end process;
END;
