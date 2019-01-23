--Alejandra Rodriguez Sanchez Ing. en Computacion
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity resultado is
   port(
            din: in std_logic_vector(39 downto 0);
            add: in std_logic_vector(7 downto 0);
             wr: in std_logic;
           dout:out std_logic_vector(39 downto 0)
       );
end entity resultado;

architecture beh of resultado is
type dat is array (0 to 255) of std_logic_vector(39 downto 0);
signal res:dat;
signal cont:integer range 0 to 255:=0;
begin
    process(din,wr,add)
    begin
    if wr='1' then
      res(to_integer(unsigned(add)))<=din;
      cont<=to_integer(unsigned(add));
    end if;
   end process;

   process(cont)
    begin
    if cont>0 then
      dout<=res(cont-1);
    else
      dout<=res(cont);
    end if;
   end process;
end architecture beh;
