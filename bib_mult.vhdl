--Alejandra Rodriguez Sanchez Ing. en Computacion
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package bib_mult is
      function bin2seg(num:std_logic_vector(3 downto 0))return std_logic_vector;
end package bib_mult;

package body bib_mult is 
   function bin2seg(num:std_logic_vector(3 downto 0))return std_logic_vector is
   variable dis:std_logic_vector(6 downto 0) :="1111111";
   begin
      case num is
            when "0000"=>
					dis:="1000000";
				when "0001"=>
					dis:="1111001";
				when "0010"=>
					dis:="0100100";
				when "0011"=>
					dis:="0110000";
				when "0100"=>
					dis:="0011001";
				when "0101"=>
					dis:="0010010";
				when "0110"=>
					dis:="0000010";
				when "0111"=>
					dis:="0111000";
				when "1000"=>
					dis:="0000000";
				when "1001"=>
					dis:="0011000";
				when "1010"=>
					dis:="0001000";
				when "1011"=>
					dis:="0000011";
				when "1100"=>
					dis:="0100111";
				when "1101"=>
					dis:="0100001";
				when "1110"=>
					dis:="0000110";
				when "1111"=>
					dis:="0001110";
				when others =>
			end case;
         return dis;
   end function  bin2seg;
end package body bib_mult;
