-------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:00:23 05/17/2020
-- Design Name:   
-- Module Name:   D:/EDA/New folder/EDA/register8_tb.vhd
-- Project Name:  EDA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register8
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY register8_tb IS
END register8_tb;
 
ARCHITECTURE behavior OF register8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register8
    PORT(
         data_in : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0);
         clk_en : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal clk_en : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register8 PORT MAP (
          data_in => data_in,
          clk => clk,
          data_out => data_out,
          clk_en => clk_en,
          reset => reset
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
  
 

   -- Stimulus process
   stim_proc: process
   begin		
	clk_en<='0';
   wait for clk_period/2;
	reset<='0';
	for i in 1 to 6 loop
	     data_in<=std_logic_vector(to_signed(i,data_in'length));
	     wait for clk_period;
	end loop;
	clk_en<='1';
	
	for i in 7 to 12 loop
		   data_in<=std_logic_vector(to_signed(i,data_in'length));

	     wait for clk_period;
		  if i=8 then
		  clk_en<='0';
		  end if;
		  wait for 5 ns;
	 end loop;
    wait;
   end process;

END;