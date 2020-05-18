----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:49:47 05/18/2020 
-- Design Name: 
-- Module Name:    ram - Behavioral 
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

entity ram is
    Port ( d_in : in  STD_LOGIC_VECTOR (7 downto 0);
           d_out : inout  STD_LOGIC_VECTOR (7 downto 0);
           w_en : in  STD_LOGIC;
           r_en : in  STD_LOGIC;
           addr_a : in  STD_LOGIC_VECTOR (2 downto 0);
           addr_b : in  STD_LOGIC_VECTOR (2 downto 0);
           clk_a : in  STD_LOGIC;
           clk_b : in  STD_LOGIC);
end ram;

architecture Behavioral of ram is
type memory is array (0 to 7) of std_logic_vector(7 downto 0);
signal mem:memory;
begin
p1:process(clk_a,clk_b)
variable a:integer:=to_integer(Signed(addr_a));
variable b:integer:=to_integer(Signed(addr_b));
begin
if w_en='1' then
     if clk_a='1' and clk_a'event then
	       mem(a)<=d_in;
	  end if;
end if;
if r_en='1' then
        if clk_b='1' and clk_b'event then
		     d_out<=mem(b);
		 end if;
end if;
end process;
end Behavioral;

