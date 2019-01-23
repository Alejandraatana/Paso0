--Alejandra Rodriguez Sanchez Ing. en Computacion

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control is
port(
        clk:  in std_logic;
      reset:  in std_logic;
     cont11:  in std_logic_vector(3 downto 0);
    cont250:  in std_logic_vector(7 downto 0);
   enable11: out std_logic;
  enable250: out std_logic;
         wr: out std_logic;
       addD: out std_logic_vector(7 downto 0);
       addR: out std_logic_vector(7 downto 0)
    );
end entity control;

architecture beh of control is
signal ini:std_logic:='1';
signal addDat:std_logic_vector(7 downto 0):="00000000";
signal addRes:std_logic_vector(7 downto 0):="00000000";
signal cont:integer range 0 to 10:=0;

begin

addD<=addDat;
addR<=addRes;
cont<=to_integer(unsigned(cont11));

process(clk,reset)
    begin
    if reset='0' then
      wr<='0';
      ini<='1';
      addDat<="00000000";
      addRes<="00000000";
    elsif clk'event and clk='1' then
      if cont<10 then
         wr<='0';
         enable11<='1';
         enable250<='0';
      else
         if not ini='1' then
            addDat<=cont250;
            addRes<=cont250;
         else
            ini<='0';
         end if;
         enable11<='0';
         enable250<='1';
         wr<='1';
      end if;
    end if;
end process;
end architecture beh;
