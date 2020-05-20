
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:45:02 05/19/2020 
-- Design Name: 
-- Module Name:    fifo_controller - Behavioral 
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

entity fifo_controller is
    Port ( reset : in  STD_LOGIC;
           rdclk : in  STD_LOGIC;
           wclk : in  STD_LOGIC;
           rreq : in  STD_LOGIC;
           wreq : in  STD_LOGIC;
           write_valid : out  STD_LOGIC;
           read_valid : out  STD_LOGIC;
           w_ptr : out  STD_LOGIC_VECTOR (2 downto 0);
           r_ptr : out  STD_LOGIC_VECTOR (2 downto 0);

      empty : out  STD_LOGIC;
           full : out  STD_LOGIC);
end fifo_controller;

architecture Behavioral of fifo_controller is
component gray_to_binary is
    Port (
            clk : in  STD_LOGIC;
           en : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  	gray_out:out  STD_LOGIC_VECTOR (3 downto 0);
            bin_out : out  STD_LOGIC_VECTOR (2 downto 0)
              
              );

end component;           
signal w_p : STD_LOGIC_VECTOR (3 downto 0);
signal r_p : STD_LOGIC_VECTOR (3 downto 0);
signal f_check: std_logic;
signal e_check: std_logic;
signal r_flag: std_logic;
signal w_flag: std_logic;

begin 
r: gray_to_binary  PORT MAP (clk=>rdclk,reset=>reset,en=>r_flag,gray_out=>r_p,bin_out=>r_ptr);
w: gray_to_binary  PORT MAP (clk=>wclk,reset=>reset,en=>w_flag,gray_out=>w_p,bin_out=>w_ptr);
full<=f_check;
empty<=e_check;
  
   p1:process(e_check,f_check,rreq,wreq)
 begin
 if  e_check='0' then
        r_flag<=rreq and '1';
        read_valid<='1';
  else 
         r_flag<=rreq and '0';
        read_valid<='0';
 end if;
 if  f_check='0' then
        w_flag<=wreq and '1';
          write_valid<='1';
 else 
        w_flag<=wreq and '0';
          write_valid<='0';
  end if;
  end process;       
  p2:process(w_p,r_p)
  begin
   if w_p=r_p then
          e_check<='1';
    else   e_check<='0';
    end if;
   if w_p(3 downto 2)=not r_p(3 downto 2) and w_p(1 downto 0)= r_p(1 downto 0)   then
          f_check<='1';
    else  f_check<='0';
    end if;
   end process;  

 end Behavioral;