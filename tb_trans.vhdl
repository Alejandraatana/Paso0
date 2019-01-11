--Alejandra rodriguez Sanchez Ing. en Computacion
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_trans is
end entity tb_trans;

architecture beh of tb_trans is
component trans is
port(
            clk: in std_logic;
          reset: in std_logic;
           clkl: out std_logic;
            add: out std_logic_vector(7 downto 0);
        datout0: out std_logic_vector(6 downto 0); 
        datout1: out std_logic_vector(6 downto 0);
        datout2: out std_logic_vector(6 downto 0); 
        datout3: out std_logic_vector(6 downto 0); 
        datout4: out std_logic_vector(6 downto 0); 
        datout5: out std_logic_vector(6 downto 0); 
        datout6: out std_logic_vector(6 downto 0);
        datout7: out std_logic_vector(6 downto 0) 
    );
end component trans;

signal btnclk:std_logic:='0';
signal btnreset:std_logic:='1';
signal ledclk:std_logic:='1';
signal ledadd:std_logic_vector(7 downto 0);
signal led0:std_logic_vector(6 downto 0);
signal led1:std_logic_vector(6 downto 0);
signal led2:std_logic_vector(6 downto 0);
signal led3:std_logic_vector(6 downto 0);
signal led4:std_logic_vector(6 downto 0);
signal led5:std_logic_vector(6 downto 0);
signal led6:std_logic_vector(6 downto 0);
signal led7:std_logic_vector(6 downto 0);
begin

tra:trans
   port map(
         clk=>btnclk,
           reset=>btnreset,
            clkl=>ledclk,
             add=>ledadd,
         datout0=>led0,
         datout1=>led1,
         datout2=>led2,
         datout3=>led3,
         datout4=>led4,
         datout5=>led5,
         datout6=>led6,
         datout7=>led7
           );
process
   begin
   wait for 10 ns;
      btnclk<='1';
   wait for 10 ns;
      btnclk<='0';
end process;

process
   begin
   wait for 200 ns;
      --btnreset<='0';
   wait for 10 ns;
      btnreset<='1';
end process;
end architecture beh;
