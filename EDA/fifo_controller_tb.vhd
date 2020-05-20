--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   04:33:21 05/20/2020
-- Design Name:   
-- Module Name:   D:/EDA/New folder/EDA/fifo_controller_tb.vhd
-- Project Name:  EDA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fifo_controller
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
 
ENTITY fifo_controller_tb IS
END fifo_controller_tb;
 
ARCHITECTURE behavior OF fifo_controller_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fifo_controller
    PORT(
         reset : IN  std_logic;
         rdclk : IN  std_logic;
         wclk : IN  std_logic;
         rreq : IN  std_logic;
         wreq : IN  std_logic;
         write_valid : OUT  std_logic;
         read_valid : OUT  std_logic;
         w_ptr : OUT  std_logic_vector(2 downto 0);
         r_ptr : OUT  std_logic_vector(2 downto 0);
         empty : OUT  std_logic;
         full : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal rdclk : std_logic := '0';
   signal wclk : std_logic := '0';
   signal rreq : std_logic := '0';
   signal wreq : std_logic := '0';

 	--Outputs
   signal write_valid : std_logic;
   signal read_valid : std_logic;
   signal w_ptr : std_logic_vector(2 downto 0);
   signal r_ptr : std_logic_vector(2 downto 0);
   signal empty : std_logic;
   signal full : std_logic;

   -- Clock period definitions
   constant rdclk_period : time := 10 ns;
   constant wclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fifo_controller PORT MAP (
          reset => reset,
          rdclk => rdclk,
          wclk => wclk,
          rreq => rreq,
          wreq => wreq,
          write_valid => write_valid,
          read_valid => read_valid,
          w_ptr => w_ptr,
          r_ptr => r_ptr,
          empty => empty,
          full => full
        );

   -- Clock process definitions
   rdclk_process :process
   begin
		rdclk <= '0';
		wait for rdclk_period/2;
		rdclk <= '1';
		wait for rdclk_period/2;
   end process;
 
   wclk_process :process
   begin
		wclk <= '0';
		wait for wclk_period/2;
		wclk <= '1';
		wait for wclk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	reset<='0';
	wreq<='1';
	rreq<='1';

	for i in 0 to 8 loop
	     wait until rdclk='1' and rdclk'event;
   end loop;
	   wreq<='0';
	for i in 0 to 7 loop
	     wait until rdclk='1' and rdclk'event;
   end loop;
      wait;
   end process;

END;
