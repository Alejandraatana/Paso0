--Alejandra Rodriguez Sanchez Ing. en Computacion
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity coeficientes is
   port(
           add: in std_logic_vector(3 downto 0);
          coef:out std_logic_vector(15 downto 0) 
       );
end entity coeficientes;

architecture beh of coeficientes is
type arreglo is array (0 to 10) of std_logic_vector(15 downto 0);
signal coefi: arreglo:=(
                        0=>"1000001001111100", --33404
                        1=>"1000010111101001", --34281
                        2=>"1000101000001110", --35342
                        3=>"1000111010011101", --36509
                        4=>"1001001100110101", --37685
                        5=>"1001011101101111", --38767
                        6=>"1001001100110101", --37685
                        7=>"1000111010011101", --36509
                        8=>"1000101000001110", --35342
                        9=>"1000010111101001", --34281
                       10=>"1000001001111100", --33404
                       others=>(others=>'-')
                       );
begin
   coef<=coefi(to_integer(unsigned(add)));
end architecture beh;
