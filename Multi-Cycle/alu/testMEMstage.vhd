--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:12:55 04/06/2020
-- Design Name:   
-- Module Name:   C:/Users/greg/Documents/labOrganosi/alu/testMEMstage.vhd
-- Project Name:  alu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MEMSTAGE
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
 
ENTITY testMEMstage IS
END testMEMstage;
 
ARCHITECTURE behavior OF testMEMstage IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MEMSTAGE
    PORT(
         clk : IN  std_logic;
         ByteOp : IN  std_logic;
         mem_wrEn : IN  std_logic;
         alu_mem_addr : IN  std_logic_vector(31 downto 0);
         mem_dataIn : IN  std_logic_vector(31 downto 0);
         mem_dataOut : OUT  std_logic_vector(31 downto 0);
         mm_addr : OUT  std_logic_vector(31 downto 0);
         mm_wr : OUT  std_logic;
         mm_wrData : OUT  std_logic_vector(31 downto 0);
         mm_rdData : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ByteOp : std_logic := '0';
   signal mem_wrEn : std_logic := '0';
   signal alu_mem_addr : std_logic_vector(31 downto 0) := (others => '0');
   signal mem_dataIn : std_logic_vector(31 downto 0) := (others => '0');
   signal mm_rdData : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal mem_dataOut : std_logic_vector(31 downto 0);
   signal mm_addr : std_logic_vector(31 downto 0);
   signal mm_wr : std_logic;
   signal mm_wrData : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MEMSTAGE PORT MAP (
          clk => clk,
          ByteOp => ByteOp,
          mem_wrEn => mem_wrEn,
          alu_mem_addr => alu_mem_addr,
          mem_dataIn => mem_dataIn,
          mem_dataOut => mem_dataOut,
          mm_addr => mm_addr,
          mm_wr => mm_wr,
          mm_wrData => mm_wrData,
          mm_rdData => mm_rdData
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
		byteOp <= '0';
      mem_wrEn <= '0';
      alu_mem_addr <= "00000001110000000000000000000001";
      mem_dataIn <= "00000000000000100000011000000001";
      mm_rdData <= "00000000000011000000000000110001";
      wait for clk_period;    
        
      byteOp <=  '0';
      mem_wrEn <= '1';
      alu_mem_addr <= "00000001110000000000000000000001";
      mem_dataIn <= "00000000000000100000011000000001";
      mm_rdData <= "00000000000011000000000000110001";
      wait for clk_period;    
        
      byteOp <= '1';
      mem_wrEn <= '0';
      alu_mem_addr <= "00000001110000000000000000000001";
      mem_dataIn <= "00000000000000100000011000000001";
      mm_rdData <= "00000000000011000000000000110001";
      wait for clk_period;    
        
        byteOp <= '1';
      mem_wrEn <= '1';
      alu_mem_addr <= "00000001110000000000000000000001";
      mem_dataIn <= "00000000000000100000011000000001";
      mm_rdData <= "00000000000011000000000000110001";
      wait for clk_period;    
   end process;

END;
