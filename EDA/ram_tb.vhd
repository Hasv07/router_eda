--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:40:42 05/18/2020
-- Design Name:   
-- Module Name:   D:/EDA/New folder/EDA/ram_tb.vhd
-- Project Name:  EDA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ram
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
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ram_tb IS
END ram_tb;
 
ARCHITECTURE behavior OF ram_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ram
    PORT(
         d_in : IN  std_logic_vector(7 downto 0);
         d_out : INOUT  std_logic_vector(7 downto 0);
         w_en : IN  std_logic;
         r_en : IN  std_logic;
         addr_a : IN  std_logic_vector(2 downto 0);
         addr_b : IN  std_logic_vector(2 downto 0);
         clk_a : IN  std_logic;
         clk_b : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d_in : std_logic_vector(7 downto 0) := (others => '0');
   signal w_en : std_logic := '0';
   signal r_en : std_logic := '0';
   signal addr_a : std_logic_vector(2 downto 0) := (others => '0');
   signal addr_b : std_logic_vector(2 downto 0) := (others => '0');
   signal clk_a : std_logic := '0';
   signal clk_b : std_logic := '0';

	--BiDirs
   signal d_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_a_period : time := 10 ns;
   constant clk_b_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ram PORT MAP (
          d_in => d_in,
          d_out => d_out,
          w_en => w_en,
          r_en => r_en,
          addr_a => addr_a,
          addr_b => addr_b,
          clk_a => clk_a,
          clk_b => clk_b
        );

   -- Clock process definitions
   clk_a_process :process
   begin
		clk_a <= '0';
		wait for clk_a_period/2;
		clk_a <= '1';
		wait for clk_a_period/2;
   end process;
 
   clk_b_process :process
   begin
		clk_b <= '0';
		wait for clk_b_period/2;
		clk_b <= '1';
		wait for clk_b_period/2;
   end process;
 

   -- Stimulus process
   p1_read: process
   begin		
	   wait for 10 ns;
      r_en<='1';
		for i in 0 to 7  loop		   
		   addr_b<=std_logic_vector(to_unsigned(i,addr_b'length));
	     wait for clk_b_period;

		end loop;

      wait;
   end process;
	
		  p1_write: process
   begin		
      w_en<='1';
		for j in 0 to 7 loop
		   addr_a<=std_logic_vector(to_unsigned(j,addr_a'length));
			d_in<=std_logic_vector(to_unsigned(j,d_in'length));
	     wait for clk_a_period;
		end loop;
			for k in 0 to 7 loop
		   addr_a<=std_logic_vector(to_unsigned(k,addr_a'length));
			d_in<=std_logic_vector(to_unsigned(k+3,d_in'length));
	     wait for clk_a_period;
		end loop;

      wait;
   end process;
	




END;
