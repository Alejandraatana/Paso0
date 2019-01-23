--Alejandra Rodriguez Sanchez Ing. en Computacion

library ieee;

use ieee.std_logic_1164.all;
use work.bib_mult.all;

entity trans is
port (
        clk_50m:  in std_logic;
          reset:  in std_logic;
         resetl: out std_logic; 
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
           add: in std_logic_vector(7 downto 0);
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

component control is
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
end component control;

component contMod11 is
   port(
           clk: in std_logic;
        enable: in std_logic;
         reset: in std_logic;
          cont:out std_logic_vector(3 downto 0)
       );
end component contMod11;

component contMod250 is
   port(
           clk: in std_logic;
        enable: in std_logic;
         reset: in std_logic;
          cont:out std_logic_vector(7 downto 0)
        );
end component contMod250;

signal addD:std_logic_vector(7 downto 0):="00000000";
signal addR:std_logic_vector(7 downto 0):="00000000";
signal dato:std_logic_vector(39 downto 0):="0000000000000000000000000000000000000000";
signal wri:std_logic:='0';
signal dout:std_logic_vector(39 downto 0);
signal conta11:std_logic_vector(3 downto 0):="0000";
signal conta250:std_logic_vector(7 downto 0):="00000000";
signal enable11:std_logic;
signal enable250:std_logic;
signal clk:std_logic;

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
resetl<=reset;
add<=addD;

process(clk_50m,reset)
    variable cuenta:natural range 0 to 50000000:=0;
    begin
      if reset='0' then
		   cuenta:=0;
 	   elsif clk_50m'event and clk_50m='1' then
         cuenta:=cuenta + 1;
         if cuenta<25000000 then
				clk<='0';
			else
				clk<='1';
         end if;
      end if;
end process;

DAT:datos
port map(
         add=>addD,
        dat=>dato(15 downto 0)
        );

RES:resultado
port map(
        din=>dato,
        add=>addR,
         wr=>wri,
       dout=>dout
        );

CONT11:contMod11
port map(
        clk=>clk,
     enable=>enable11,
      reset=>reset,
       cont=>conta11
        );

CONT250:contMod250
port map(
        clk=>clk,
     enable=>enable250,
      reset=>reset,
       cont=>conta250
        );

CTRL:control
port map(
         clk=>clk,
       reset=>reset,
      cont11=>conta11,
     cont250=>conta250,
    enable11=>enable11,
   enable250=>enable250,
          wr=>wri,
        addD=>addD,
        addR=>addR
        );
end architecture beh;
