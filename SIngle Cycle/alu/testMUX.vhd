--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.matrix32.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY testMux IS
END testMux;
 
ARCHITECTURE behavior OF testMux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux
    PORT(
         input : IN  matrix (0 to 31);
         control : in  STD_LOGIC_VECTOR (4 downto 0);
         output : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : matrix(0 to 31) := (others => "00000000000000000000000000000000");
   signal control :  std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut:  mux PORT MAP (
          input => input,
          control => control,
          output => output
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
	   input(3) <= (others => '1');
		input(1) <= (7 downto 4 => '1',others => '0');
		control <= "00001";
		wait for 50 ns;
		
		control <= "00011";
		wait for 50 ns;
		
		control <= "00000";
		wait for 50 ns;
		
		input(10) <= (5 downto 0 => '1', others => '0');
		input(13) <= (24 downto 10 => '1', others => '0');
		control <= "00001";
		wait for 50 ns;
		
		control <= "01101";
		wait for 50 ns;
		
		control <= "01010";
		wait for 50 ns;
		
		input(0) <= (3 downto 2 => '1', others => '0');
		control <= "00000";
		
		input(31) <= (2 downto 2 => '1', others => '0');
		control <= "11111";
      -- insert stimulus here 
		-- TODO: more test

      wait;
   end process;

END;
