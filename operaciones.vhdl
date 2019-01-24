--Alejandra Rodriguez Sanchez Ing. en Computacion

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity operaciones is
port(
           clk: in std_logic;
         reset: in std_logic;
        enable: in std_logic;
          coef: in std_logic_vector(15 downto 0);
         senal: in std_logic_vector(15 downto 0);
     resultado:out std_logic_vector(39 downto 0)
    );
end entity operaciones;

architecture beh of operaciones is
signal res:std_logic_vector(39 downto 0):="0000000000000000000000000000000000000000";
signal multiplicacion:std_logic_vector(31 downto 0);
begin

resultado<=res;

process(clk,reset)
    begin
      if reset='0' then
         multiplicacion<="00000000000000000000000000000000";
         res<="0000000000000000000000000000000000000000";
      elsif clk'event and clk='1' and enable='1' then
         multiplicacion<=std_logic_vector(unsigned(coef) * unsigned(senal));
         res<=std_logic_vector(unsigned(res) + unsigned(multiplicacion));
      end if;
end process;
end architecture beh;
