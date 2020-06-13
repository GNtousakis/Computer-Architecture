--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:44:07 05/11/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testMuxHazard.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_hazard
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
 
ENTITY testMuxHazard IS
END testMuxHazard;
 
ARCHITECTURE behavior OF testMuxHazard IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_hazard
    PORT(
         control : IN  std_logic;
         regDst : IN  std_logic;
         extOp : IN  std_logic_vector(1 downto 0);
         ALUSrc : IN  std_logic;
         ALUctr : IN  std_logic_vector(3 downto 0);
         MemWr : IN  std_logic;
         MemRd : IN  std_logic;
         nPC_sel : IN  std_logic;
         branch : IN  std_logic;
         regWr : IN  std_logic;
         MemtoReg : IN  std_logic;
         controlByteOp : IN  std_logic;
         regDstOut : OUT  std_logic;
         extOpOut : OUT  std_logic_vector(1 downto 0);
         ALUSrcOut : OUT  std_logic;
         ALUctrOut : OUT  std_logic_vector(3 downto 0);
         MemWrOut : OUT  std_logic;
         MemRdOut : OUT  std_logic;
         nPC_selOut : OUT  std_logic;
         branchOut : OUT  std_logic;
         regWrOut : OUT  std_logic;
         MemtoRegOut : OUT  std_logic;
         controlByteOpOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal control : std_logic := '0';
   signal regDst : std_logic := '0';
   signal extOp : std_logic_vector(1 downto 0) := (others => '0');
   signal ALUSrc : std_logic := '0';
   signal ALUctr : std_logic_vector(3 downto 0) := (others => '0');
   signal MemWr : std_logic := '0';
   signal MemRd : std_logic := '0';
   signal nPC_sel : std_logic := '0';
   signal branch : std_logic := '0';
   signal regWr : std_logic := '0';
   signal MemtoReg : std_logic := '0';
   signal controlByteOp : std_logic := '0';

 	--Outputs
   signal regDstOut : std_logic;
   signal extOpOut : std_logic_vector(1 downto 0);
   signal ALUSrcOut : std_logic;
   signal ALUctrOut : std_logic_vector(3 downto 0);
   signal MemWrOut : std_logic;
   signal MemRdOut : std_logic;
   signal nPC_selOut : std_logic;
   signal branchOut : std_logic;
   signal regWrOut : std_logic;
   signal MemtoRegOut : std_logic;
   signal controlByteOpOut : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_hazard PORT MAP (
          control => control,
          regDst => regDst,
          extOp => extOp,
          ALUSrc => ALUSrc,
          ALUctr => ALUctr,
          MemWr => MemWr,
          MemRd => MemRd,
          nPC_sel => nPC_sel,
          branch => branch,
          regWr => regWr,
          MemtoReg => MemtoReg,
          controlByteOp => controlByteOp,
          regDstOut => regDstOut,
          extOpOut => extOpOut,
          ALUSrcOut => ALUSrcOut,
          ALUctrOut => ALUctrOut,
          MemWrOut => MemWrOut,
          MemRdOut => MemRdOut,
          nPC_selOut => nPC_selOut,
          branchOut => branchOut,
          regWrOut => regWrOut,
          MemtoRegOut => MemtoRegOut,
          controlByteOpOut => controlByteOpOut
        );


   -- Stimulus process
   stim_proc: process
   begin		
		control <= '1';
 		regDst <= '1';
      extOp <= "10";
      ALUSrc <= '1';
      ALUctr <= "0100";
      MemWr <= '1';
		MemRd <= '0';
		nPC_sel <= '1';
		branch <= '1';
		regWr <= '1';
      MemtoReg <= '1';
		controlByteOp <= '0'; 
      wait for 100 ns;	


		control <= '1';
 		regDst <= '0';
      extOp <= "10";
      ALUSrc <= '1';
      ALUctr <= "0101";
      MemWr <= '0';
		MemRd <= '0';
		nPC_sel <= '1';
		branch <= '1';
		regWr <= '0';
      MemtoReg <= '0';
		controlByteOp <= '0'; 
      wait for 100 ns;
		
		control <= '0';
 		regDst <= '1';
      extOp <= "10";
      ALUSrc <= '1';
      ALUctr <= "0100";
      MemWr <= '1';
		MemRd <= '0';
		nPC_sel <= '1';
		branch <= '1';
		regWr <= '1';
      MemtoReg <= '1';
		controlByteOp <= '0'; 
      wait for 100 ns;
      -- insert stimulus here 

		control <= '1';
 		regDst <= '0';
      extOp <= "10";
      ALUSrc <= '1';
      ALUctr <= "0101";
      MemWr <= '0';
		MemRd <= '0';
		nPC_sel <= '1';
		branch <= '1';
		regWr <= '0';
      MemtoReg <= '0';
		controlByteOp <= '0'; 
      wait for 100 ns;
		
		control <= '0';
 		regDst <= '0';
      extOp <= "10";
      ALUSrc <= '1';
      ALUctr <= "0101";
      MemWr <= '0';
		MemRd <= '0';
		nPC_sel <= '1';
		branch <= '1';
		regWr <= '0';
      MemtoReg <= '0';
		controlByteOp <= '0'; 
      wait for 100 ns;
      wait;
   end process;

END;
