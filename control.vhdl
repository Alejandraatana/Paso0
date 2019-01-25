--Alejandra Rodriguez Sanchez Ing. en Computacion

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control is
port(
        clk:  in std_logic;
      reset:  in std_logic;
     cont11:  in std_logic_vector(3 downto 0);
   enable11: out std_logic;
 enable250d: out std_logic;
 enable250r: out std_logic;
 enablebuff: out std_logic;
  enableope: out std_logic;
   resetope: out std_logic;
         wr: out std_logic
    );
end entity control;

architecture beh of control is
signal cont:integer range 0 to 10:=0;
signal contd:integer range 0 to 2:=0;
signal ini:std_logic:='1';

begin

cont<=to_integer(unsigned(cont11));

process(clk,reset)
    begin
    if reset='0' then
      wr<='0';
      enable11<='0';
      enable250d<='0';
      enable250r<='0';
      enablebuff<='0';
      enableope<='0';
      resetope<='0';
      ini<='0';
      contd<=0;
    elsif clk'event and clk='1' then
      if cont<10 then
         if ini='1' then 
             wr<='0';
             enable11<='0';
             enable250d<='1';
             enable250r<='0';
             enablebuff<='1';
             enableope<='0';
             resetope<='0';
             ini<='0';
         else 
             wr<='0';
             enable11<='1';
             enable250d<='0';
             enable250r<='0';
             enablebuff<='0';
             enableope<='1';
             resetope<='1'; 
         end if;
      else
         wr<='1';
         enable11<='0';
         enable250d<='0';
         enablebuff<='0';
         enableope<='0';
         resetope<='1';
         ini<='1';
         enable250r<='1';
      end if;
    end if;
end process;
end architecture beh;
