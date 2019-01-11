--Alejandra Rodriguez Sanchez Ing. en Computacion

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control is
port(
        clk:  in std_logic;
      reset:  in std_logic;
         wr: out std_logic;
       addD: out std_logic_vector(7 downto 0);
       addR: out std_logic_vector(7 downto 0)
    );
end entity control;

architecture beh of control is
signal cont:natural range 0 to 9:=0;
signal ini:std_logic:='1';
signal addDat:std_logic_vector(7 downto 0):="00000000";
signal addRes:std_logic_vector(7 downto 0):="00000000";
begin

addD<=addDat;
addR<=addRes;

process(clk,reset)
    begin
    if reset='0' then
      cont<=0;
      wr<='0';
      ini<='1';
      addDat<="00000000";
      addRes<="00000000";
    elsif clk'event and clk='1' then
      if cont<9 then
         wr<='0';
         cont<=cont + 1;
      else
         if not ini='1' then
            addDat<=std_logic_vector(unsigned(addDat)+1);
            addRes<=std_logic_vector(unsigned(addRes)+1);
         else
            ini<='0';
         end if;
         wr<='1';
         cont<=0;
      end if;
    end if;
end process;
end architecture beh;
