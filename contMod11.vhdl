--Alejandra Rodriguez Sanchez Ing. en Computacion

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contMod11 is
   port(
           clk: in std_logic;
        enable: in std_logic;
         reset: in std_logic;
          cont:out std_logic_vector(3 downto 0)
       );
end entity contMod11;

architecture beh of contMod11 is
signal contador:natural range 0 to 10:=0;
begin
cont<=std_logic_vector(to_unsigned(contador,4));

   process(clk,reset,enable)
    begin
      if reset='0' then
         contador<=0;
      elsif clk'event and clk='1' and enable='1' then
         if contador<10 then
            contador<=contador + 1;
         else
            contador<=0;
         end if;
      end if;
   end process;
end architecture beh;
