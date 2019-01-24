--Alejandra Rodriguez Sanchez Ing. en Computacion

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity buffDat is
   port(
             clk: in std_logic;
           reset: in std_logic;
          enable: in std_logic;
             add: in std_logic_vector(3 downto 0);
           datIn: in std_logic_vector(15 downto 0);
          datOut:out std_logic_vector(15 downto 0)
       );
end entity buffDat;

architecture beh of buffDat is
type datos is array (0 to 10) of std_logic_vector(15 downto 0);
signal dato: datos:=(others=>(others=>'0')
                   ); 

begin
   datOut<=dato(to_integer(unsigned(add)));

   process(clk,reset,enable)
    begin
      if reset='0' then
         dato<=(others=>(others=>'0'));
      elsif clk'event and clk='1' and enable='1' then
         dato(10)<=dato(9);
         dato(9)<=dato(8);
         dato(8)<=dato(7);
         dato(7)<=dato(6);
         dato(6)<=dato(5);
         dato(5)<=dato(4);
         dato(4)<=dato(3);
         dato(3)<=dato(2);
         dato(2)<=dato(1);
         dato(1)<=dato(0);
         dato(0)<=datIn;
      end if;
   end process;
end architecture beh;
