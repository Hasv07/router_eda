----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:03 05/19/2020 
-- Design Name: 
-- Module Name:    Gray_Counter - Behavioral 
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Gray_Counter is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count_out : out  STD_LOGIC_VECTOR (3 downto 0));
			  
end Gray_Counter;

architecture Behavioral of Gray_Counter is  
SIGNAL curr, next_s,temp: std_logic_vector (3 DOWNTO 0):=(others=>'0');
signal bin:Integer:=1;
begin

p1:process(clk,reset)
begin
if reset='1' then
    bin<=0;
	 end if;
if en='1' then
     if clk='1' and clk'event then
	       curr<=next_s;
			 if bin <15 then 
			   bin<=bin+1;
			 else
			   bin<=0;
				end if;
      end if;
end if;
     
end process;
temp<=std_logic_vector(to_unsigned(bin,temp'length));
next_s(3)<=temp(3);
next_s(2)<=temp(3) xor temp(2);
next_s(1)<=temp(2) xor temp(1);
next_s(0)<=temp(1) xor temp(0);		
count_out<=curr;
end Behavioral;

