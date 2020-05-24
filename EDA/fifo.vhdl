Library IEEE;
USE IEEE.Std_logic_1164.all;
use ieee.numeric_std.all;
entity FIFO is
port(
reset : in std_logic;
rclk : in std_logic;
wclk : std_logic;
rreq : std_logic;
wreq : std_logic;
datain : in std_logic_vector(7 downto 0);
dataout: out std_logic_vector(7 downto 0);
empty: out std_logic;
full : out STD_LOGIC;
);
end FIFO

architecture Behavioral of FIFO is

component fifo_controller is
    Port ( reset : in  STD_LOGIC;
           rdclk : in  STD_LOGIC;
           wclk : in  STD_LOGIC;
           rreq : in  STD_LOGIC;
           wreq : in  STD_LOGIC;
           w_valid : out  STD_LOGIC;
           r_valid : out  STD_LOGIC;
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

begin

     p1 : fifo_controller PORT MAP (
         reset=>reset,
         rdclk=>rclk,
         wclk=>wclk,
         rreq=>rreq,
         wreq=>wreq,
         empty=>empty,
         full=>full
          );  

    p2 : ram PORT MAP (
         d_in=>datain,
         clk_a=>rclk,
         clk_b=>wclk,
          );

    r_en => r_valid;
    w_en => w_valid;
    addr_a => r_ptr;
    addr_b => w_ptr;       


   end Beahavioral;









       


































