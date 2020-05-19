----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:26:32 05/19/2020 
-- Design Name: 
-- Module Name:    gra_to_binary - Behavioral 
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

entity gray_to_binary is
    Port (
	        clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           reset : in  STD_LOGIC;
	        gray_in : inout  STD_LOGIC_VECTOR (3 downto 0);
           bin_out : out  STD_LOGIC_VECTOR (2 downto 0)
			  
			  );

end gray_to_binary;

architecture Behavioral of gray_to_binary is

component Gray_Counter is
    Port ( clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count_out : out  STD_LOGIC_VECTOR (3 downto 0));
			  
end component;
   BEGIN  
     C1: Gray_Counter  PORT MAP (clk=>clk,reset=>reset,en=>en,count_out=>gray_in);
    bin_out(2)<= gray_in(3) xor gray_in(2);
    bin_out(1)<= gray_in(3) xor gray_in(2) xor gray_in(1);
    bin_out(0)<= gray_in(3) xor gray_in(2) xor gray_in(1) xor gray_in(0);

end Behavioral;

