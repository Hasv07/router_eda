--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:26:10 05/18/2020
-- Design Name:   
-- Module Name:   D:/EDA/New folder/EDA/demux8_tb.vhd
-- Project Name:  EDA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: demux8
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
 
ENTITY demux8_tb IS
END demux8_tb;
 
ARCHITECTURE behavior OF demux8_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT demux8
    PORT(
         d_in : IN  std_logic_vector(7 downto 0);
         d_out1 : OUT  std_logic_vector(7 downto 0);
         d_out2 : OUT  std_logic_vector(7 downto 0);
         d_out3 : OUT  std_logic_vector(7 downto 0);
         d_out4 : OUT  std_logic_vector(7 downto 0);
         sel : IN  std_logic_vector(1 downto 0);
         en : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d_in : std_logic_vector(7 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');
   signal en : std_logic := '0';

 	--Outputs
   signal d_out1 : std_logic_vector(7 downto 0);
   signal d_out2 : std_logic_vector(7 downto 0);
   signal d_out3 : std_logic_vector(7 downto 0);
   signal d_out4 : std_logic_vector(7 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: demux8 PORT MAP (
          d_in => d_in,
          d_out1 => d_out1,
          d_out2 => d_out2,
          d_out3 => d_out3,
          d_out4 => d_out4,
          sel => sel,
          en => en
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
    en<='1';
	 for i in 0 to 6 loop
	     d_in<=std_logic_vector(to_signed(i,d_in'length));
		  sel<=std_logic_vector(to_signed(i rem 4,sel'length));
		  wait for 20 ns;
	end loop;
	
 en<='0';
	 for i in 0 to 6 loop
	     d_in<=std_logic_vector(to_signed(i,d_in'length));
		  sel<=std_logic_vector(to_signed(i rem 4,sel'length));
		  wait for 20 ns;
	end loop;
      wait;
   end process;

END;
