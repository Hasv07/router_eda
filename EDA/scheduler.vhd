
library ieee;

use ieee.std_logic_1164.all;

entity ROUND_ROBIN is



  port (

		clk : in std_logic;

		dout: out  std_logic_vector(7 downto 0);

		din1: in  std_logic_vector(7 downto 0);  

		din2: in  std_logic_vector(7 downto 0);  

		din3: in  std_logic_vector(7 downto 0);  

		din4: in  std_logic_vector(7 downto 0);

	  rst   : in  std_logic

		);

end entity ROUND_ROBIN;



architecture arch of ROUND_ROBIN is

type state is (s1,s2,s3,s4);      

signal Current_state,next_state : state;  



begin  



p1: process(Current_state)

	begin

		case Current_state is

			when s1 => dout <= din1;

			next_state <= s2;

			when s2 => dout <= din2;

			next_state <= s3;

			when s3 => dout <= din3;

			next_state <= s4;

			when s4 => dout <= din4;

			next_state <= s1;

			when others => next_state <= s1;

		end case;

end process p1;

			

			

cs: process (clk, rst)

  begin 

    if rst = '1' then                   

     Current_state<=s1;

    elsif clk'event and clk = '1' then  

      Current_state<=next_state;

    end if;

end process cs;

end architecture arch;