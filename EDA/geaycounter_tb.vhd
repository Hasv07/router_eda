--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:24:26 05/19/2020
-- Design Name:   
-- Module Name:   D:/EDA/New folder/EDA/geaycounter_tb.vhd
-- Project Name:  EDA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Gray_Counter
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY geaycounter_tb IS
END geaycounter_tb;
 
ARCHITECTURE behavior OF geaycounter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Gray_Counter
    PORT(
         clk : IN  std_logic;
         en : IN  std_logic;
         reset : IN  std_logic;
         count_out : OUT  std_logic_vector(3 downto 0)

  );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal en : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal count_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Gray_Counter PORT MAP (
          clk => clk,
          en => en,
          reset => reset,
          count_out => count_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   stim_proc: process
   begin	
    reset <='1';
	 en<='1';
	 reset<='0';
	 for i in 0 to 15 loop
       WAIT UNTIL clk='1' AND clk'EVENT;
	  end loop;
    	 
   

      wait;
   end process;

END;
