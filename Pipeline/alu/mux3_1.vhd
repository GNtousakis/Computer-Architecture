
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3x1 is
    Port ( input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           input2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  input3 : in  STD_LOGIC_VECTOR (31 downto 0);
           control : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (31 downto 0));
end mux3x1;

architecture Behavioral of mux3x1 is
begin
process (input1, input2, input3, control)
begin 
	if ( control = "10") then
		output <= input1;
	elsif (control = "01") then
		output <= input2;
	else 
		output <= input3;
	end if;
end process;
end Behavioral;
