--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:51:04 05/27/2020
-- Design Name:   
-- Module Name:   D:/EDA/New folder/EDA/fifo_tb.vhd
-- Project Name:  EDA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FIFO
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
 
ENTITY fifo_tb IS
END fifo_tb;
 
ARCHITECTURE behavior OF fifo_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FIFO
    PORT(
         reset : IN  std_logic;
         rclk : IN  std_logic;
         wclk : IN  std_logic;
         rreq : IN  std_logic;
         wreq : IN  std_logic;
         datain : IN  std_logic_vector(7 downto 0);
         dataout : INOUT  std_logic_vector(7 downto 0);
         empty : OUT  std_logic;
         full : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal rclk : std_logic := '0';
   signal wclk : std_logic := '0';
   signal rreq : std_logic := '0';
   signal wreq : std_logic := '0';
   signal datain : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal dataout : std_logic_vector(7 downto 0);

 	--Outputs
   signal empty : std_logic;
   signal full : std_logic;

   -- Clock period definitions
   constant rclk_period : time := 10 ns;
   constant wclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FIFO PORT MAP (
          reset => reset,
          rclk => rclk,
          wclk => wclk,
          rreq => rreq,
          wreq => wreq,
          datain => datain,
          dataout => dataout,
          empty => empty,
          full => full
        );

   -- Clock process definitions
   rclk_process :process
   begin
		rclk <= '0';
		wait for rclk_period/2;
		rclk <= '1';
		wait for rclk_period/2;
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
		datain<="11111001";
		wreq<='1';
		wait for wclk_period;
	wreq<='0';
	rreq<='1';
	wreq<='1';
	datain<="11111011";
			wait for wclk_period;

	wreq<='0';
	
	wait;
   end process;

END;
