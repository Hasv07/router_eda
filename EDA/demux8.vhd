----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:04:31 05/18/2020 
-- Design Name: 
-- Module Name:    demux8 - Behavioral 
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

entity demux8 is
    Port ( d_in : in  STD_LOGIC_VECTOR (7 downto 0);
           d_out1 : out  STD_LOGIC_VECTOR (7 downto 0);
           d_out2 : out  STD_LOGIC_VECTOR (7 downto 0);
           d_out3 : out  STD_LOGIC_VECTOR (7 downto 0);
           d_out4 : out  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           en : in  STD_LOGIC);
end demux8;

architecture Behavioral of demux8 is

begin
p1:process(sel)
begin
if en= '1' then
		    case sel is
		      when "00"=> 
				    d_out1<=d_in;
				when "01"=> 
				     d_out2<=d_in;
			   when "10"=> 
				     d_out3<=d_in;
				when others=> 
				      d_out4<=d_in;
         end case;
	   end if;
	end process;

end Behavioral;

