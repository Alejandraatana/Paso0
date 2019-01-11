--Alejandra Rodriguez Sanchez Ing. en Computacion

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.bib_mult.all;

entity trans is
port (
        clk_50m: in std_logic;
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
end entity trans;

architecture beh of trans is
component datos is
   port(
           dir: in std_logic_vector(7 downto 0);
           dat:out std_logic_vector(15 downto 0)
       );
end component datos;

component resultado is
   port(
            din: in std_logic_vector(39 downto 0);
            add: in std_logic_vector(7 downto 0);
             wr: in std_logic;
           dout:out std_logic_vector(39 downto 0)
       );
end component resultado;

signal addD:std_logic_vector(7 downto 0):="00000000";
signal addR:std_logic_vector(7 downto 0):="00000000";
signal dato:std_logic_vector(39 downto 0):="0000000000000000000000000000000000000000";
signal wri:std_logic:='0';
signal dout:std_logic_vector(39 downto 0);
signal ini:std_logic:='1';
signal clk:std_logic;
signal cont:natural range 0 to 9:=0;

begin

datout0<=bin2seg(dout(3 downto 0));
datout1<=bin2seg(dout(7 downto 4));
datout2<=bin2seg(dout(11 downto 8));
datout3<=bin2seg(dout(15 downto 12));
datout4<=bin2seg(dout(19 downto 16));
datout5<=bin2seg(dout(23 downto 20));
datout6<=bin2seg(dout(27 downto 24));
datout7<=bin2seg(dout(31 downto 28));
clkl<=clk;
add<=addD;

process(clk_50m)
    variable cuenta:natural range 0 to 50000000:=0;
    begin
 	if clk_50m'event and clk_50m='1' then
         cuenta:=cuenta + 1;
         if cuenta<25000000 then
				clk<='0';
			else
				clk<='1';
         end if;
      end if;
end process;

process(clk)
    begin
    if clk'event and clk='1' then
      if cont<9 then
         wri<='0';
         cont<=cont + 1;
      else
         if not ini='1' then
            addD<=std_logic_vector(unsigned(addD)+1);
            addR<=std_logic_vector(unsigned(addR) + 1);
         else
            ini<='0';
         end if;
         wri<='1';
         cont<=0;
      end if;
    end if;
end process;

DAT:datos
port map(
         dir=>addD,
        dat=>dato(15 downto 0)
        );

RES:resultado
port map(
        din=>dato,
        add=>addR,
         wr=>wri,
       dout=>dout
        );
end architecture beh;
