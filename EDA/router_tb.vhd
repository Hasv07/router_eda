--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:58:42 05/27/2020
-- Design Name:   
-- Module Name:   D:/EDA/New folder/EDA/router_tb.vhd
-- Project Name:  EDA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: router
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
 
ENTITY router_tb IS
END router_tb;
 
ARCHITECTURE behavior OF router_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT router
    PORT(
         datai1 : IN  std_logic_vector(7 downto 0);
         datai2 : IN  std_logic_vector(7 downto 0);
         datai3 : IN  std_logic_vector(7 downto 0);
         datai4 : IN  std_logic_vector(7 downto 0);
         wr1 : IN  std_logic;
         wr2 : IN  std_logic;
         wr3 : IN  std_logic;
         wr4 : IN  std_logic;
         rst : IN  std_logic;
         wclock : IN  std_logic;
         rclock : IN  std_logic;
         datao1 : OUT  std_logic_vector(7 downto 0);
         datao2 : OUT  std_logic_vector(7 downto 0);
         datao3 : OUT  std_logic_vector(7 downto 0);
         datao4 : OUT  std_logic_vector(7 downto 0)
	
        );
    END COMPONENT;
    

   --Inputs
   signal datai1 : std_logic_vector(7 downto 0) := (others => '0');
   signal datai2 : std_logic_vector(7 downto 0) := (others => '0');
   signal datai3 : std_logic_vector(7 downto 0) := (others => '0');
   signal datai4 : std_logic_vector(7 downto 0) := (others => '0');
   signal wr1 : std_logic := '0';
   signal wr2 : std_logic := '0';
   signal wr3 : std_logic := '0';
   signal wr4 : std_logic := '0';
   signal rst : std_logic := '0';
   signal wclock : std_logic := '0';
   signal rclock : std_logic := '0';

 	--Outputs
   signal datao1 : std_logic_vector(7 downto 0);
   signal datao2 : std_logic_vector(7 downto 0);
   signal datao3 : std_logic_vector(7 downto 0);
   signal datao4 : std_logic_vector(7 downto 0);


   -- Clock period definitions
   constant wclock_period : time := 10 ns;
   constant rclock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: router PORT MAP (
          datai1 => datai1,
          datai2 => datai2,
          datai3 => datai3,
          datai4 => datai4,
          wr1 => wr1,
          wr2 => wr2,
          wr3 => wr3,
          wr4 => wr4,
          rst => rst,
          wclock => wclock,
          rclock => rclock,
          datao1 => datao1,
          datao2 => datao2,
          datao3 => datao3,
          datao4 => datao4
			
        );

   -- Clock process definitions
   wclock_process :process
   begin
		wclock <= '0';
		wait for wclock_period/2;
		wclock <= '1';
		wait for wclock_period/2;
   end process;
 
   rclock_process :process
   begin
		rclock <= '0';
		wait for rclock_period/2;
		rclock <= '1';
		wait for rclock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

  wr1<='1';	
    datai1<="10111000";	  
     wr2<='1';	
		datai2<="11011001";	  
	  wr3<='1';	
		datai3<="11101010";	  
      wr4<='1';	
		datai4<="11110011";	
		
		wait for wclock_period;
			wr1<='0';	
     wr2<='0';	
     wr3<='0';	
     wr4<='0';	
	
	  wait for wclock_period;
	      datai1<="01111000";	  
		datai2<="00111001";	  		
		datai3<="00011010";	 
		datai4<="00001011";		 
	     wr1<='1';	
     wr2<='1';	
	  wr3<='1';	
      wr4<='1';
		
 	
	

		

		wait;
   end process;

END;
