----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:22:37 05/27/2020 
-- Design Name: 
-- Module Name:    FIFO - Behavioral 
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

entity FIFO is
    Port ( reset : in  STD_LOGIC;
           rclk : in  STD_LOGIC;
           wclk : in  STD_LOGIC;
           rreq : in  STD_LOGIC;
           wreq : in  STD_LOGIC;
           datain : in  STD_LOGIC_VECTOR (7 downto 0);
           dataout : inout  STD_LOGIC_VECTOR (7 downto 0);
           empty : out  STD_LOGIC;
           full : out  STD_LOGIC);
end FIFO;

architecture Behavioral of FIFO is

component fifo_controller is
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
end component;

component ram is
    Port ( d_in : in  STD_LOGIC_VECTOR (7 downto 0);
           d_out : inout  STD_LOGIC_VECTOR (7 downto 0);
           w_en : in  STD_LOGIC;
           r_en : in  STD_LOGIC;
           addr_a : in  STD_LOGIC_VECTOR (2 downto 0);
           addr_b : in  STD_LOGIC_VECTOR (2 downto 0);
           clk_a : in  STD_LOGIC;
           clk_b : in  STD_LOGIC);
end component;
signal r_flag: std_logic;
signal w_flag: std_logic;
signal r_v: std_logic;
signal w_v: std_logic;
signal addr_w :  STD_LOGIC_VECTOR (2 downto 0);
signal addr_r :   STD_LOGIC_VECTOR (2 downto 0);

begin
f:fifo_controller PORT MAP (reset=>reset,rdclk=>rclk,wclk=>wclk,rreq=>rreq,wreq=>wreq,write_valid=>w_v,read_valid=>r_v,
w_ptr=>addr_w,r_ptr=>addr_r,empty=>empty,full=>full);
r:ram PORT MAP (d_in=>datain,d_out=>dataout,w_en=>w_flag,r_en=>r_flag,addr_a=>addr_w,addr_b=>addr_r,clk_a=>wclk,clk_b=>rclk);
r_flag<=r_v and rreq;
w_flag<=w_v and wreq;


end Behavioral;

