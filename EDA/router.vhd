----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:34:26 05/27/2020 
-- Design Name: 
-- Module Name:    router - Behavioral 
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

entity router is
    Port ( datai1 : in  STD_LOGIC_VECTOR (7 downto 0);
           datai2 : in  STD_LOGIC_VECTOR (7 downto 0);
           datai3 : in  STD_LOGIC_VECTOR (7 downto 0);
           datai4 : in  STD_LOGIC_VECTOR (7 downto 0);
           wr1 : in  STD_LOGIC;
           wr2 : in  STD_LOGIC;
           wr3 : in  STD_LOGIC;
           wr4 : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           wclock : in  STD_LOGIC;
           rclock : in  STD_LOGIC;
           datao1 : out  STD_LOGIC_VECTOR (7 downto 0);
           datao2 : out  STD_LOGIC_VECTOR (7 downto 0);
           datao3 : out  STD_LOGIC_VECTOR (7 downto 0);
           datao4 : out  STD_LOGIC_VECTOR (7 downto 0));
end router;

architecture Behavioral of router is
component register8 is
    Port ( data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (7 downto 0);
           clk_en : in  STD_LOGIC;
           reset : in  STD_LOGIC);
end component;
component demux8 is
    Port ( d_in : in  STD_LOGIC_VECTOR (7 downto 0);
           d_out1 : out  STD_LOGIC_VECTOR (7 downto 0);
           d_out2 : out  STD_LOGIC_VECTOR (7 downto 0);
           d_out3 : out  STD_LOGIC_VECTOR (7 downto 0);
           d_out4 : out  STD_LOGIC_VECTOR (7 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           en : in  STD_LOGIC);
end component;
component FIFO is
    Port ( reset : in  STD_LOGIC;
           rclk : in  STD_LOGIC;
           wclk : in  STD_LOGIC;
           rreq : in  STD_LOGIC;
           wreq : in  STD_LOGIC;
           datain : in  STD_LOGIC_VECTOR (7 downto 0);
           dataout : inout  STD_LOGIC_VECTOR (7 downto 0);
           empty : out  STD_LOGIC;
           full : out  STD_LOGIC);
end component;
component ROUND_ROBIN is



  port (

		clk : in std_logic;

		dout: out  std_logic_vector(7 downto 0);

		din1: in  std_logic_vector(7 downto 0);  

		din2: in  std_logic_vector(7 downto 0);  

		din3: in  std_logic_vector(7 downto 0);  

		din4: in  std_logic_vector(7 downto 0);

	  rst   : in  std_logic

		);

end component;

type arr4_1 is array (0 to 3) of std_logic_vector(7 downto 0);
signal d_i:arr4_1;
signal rr_out: arr4_1;
type arr4 is array (0 to 3) of std_logic;
signal w:arr4;
type arr8 is array (0 to 3) of std_logic_vector(7 downto 0);
signal d : arr8;
type arr16 is array (0 to 15) of std_logic_vector(7 downto 0);
signal fifo_i:arr16;
signal fifo_out:arr16;
type arr16_v is array (0 to 15) of std_logic;
signal full:arr16_v;
signal empty:arr16_v;
begin
d_i(0)<=datai1;
d_i(1)<=datai2;
d_i(2)<=datai3;
d_i(3)<=datai4;
w(0)<=wr1;
w(1)<=wr2;
w(2)<=wr3;
w(3)<=wr4;

IBg:
for I in 0 to 3 generate
      IB: register8 port map
        (d_i(I), wclock, d(I),w(I),rst);
   end generate IBg ;
demux_g:
for I in 0 to 3 generate
      demux: demux8 port map
        (d(I),fifo_i(I),fifo_i(4+I),fifo_i(8+I),
		  fifo_i(12+I),d(I)(1 downto 0),not rst);
   end generate demux_g ;	
fifo_g:
for I in 0 to 15 generate
      fifo_component: FIFO port map
        (rst,rclock,wclock,not empty(I),not full(I)and w(I mod 4),fifo_i(I),fifo_out(I),empty(I),full(I));
   end generate fifo_g ;
rr_g:
for I in 0 to 3 generate
      rr: ROUND_ROBIN port map
        (rclock,rr_out(I),fifo_out((I*4)),fifo_out((I*4)+1),fifo_out((I*4)+2),fifo_out((I*4)+3),rst);
   end generate rr_g ;

datao1<=rr_out(0);
datao2<=rr_out(1);
datao3<=rr_out(2);
datao4<=rr_out(3);

end Behavioral;
