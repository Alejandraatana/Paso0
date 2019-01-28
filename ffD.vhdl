--Alejandra Rodriguez Sanchez Ing. en Computacion

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ffD is
port(
          clk: in std_logic;
        reset: in std_logic;
       enable: in std_logic;
            d: in std_logic_vector(7 downto 0);
            q:out std_logic_vector(7 downto 0)
    );
end entity ffD;

architecture beh of ffD is
signal retenido:std_logic_vector(7 downto 0):="00000000";
begin
q<=retenido;

process(clk,reset)
    begin
    if reset='0' then
      retenido<="00000000";
    elsif clk'event and clk='1' and enable='1' then
      retenido<=d;
    end if;
end process;

end architecture beh;
