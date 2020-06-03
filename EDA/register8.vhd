----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:55:40 05/17/2020 
-- Design Name: 
-- Module Name:    register8 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register8 is
    Port ( data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (7 downto 0);
           clk_en : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end register8;

architecture Behavioral of register8 is
begin
p1:process(clk,reset)
Begin
  if reset='1' then
     data_out<="00000000";
  elsif clk_en= '1' then
      if clk='1'and clk'event then
		     data_out<=data_in;
	   end if;
	else   data_out<="UUUUUUUU";

	end if;
   
end process;
end Behavioral;
