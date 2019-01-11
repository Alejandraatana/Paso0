--Alejandra Rodriguez Sanchez Ing. en Computacion
library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datos is
   port(
           dir: in std_logic_vector(7 downto 0);
           dat:out std_logic_vector(15 downto 0)
       );
end entity datos;
architecture beh of datos is
type data is array (0 to 255) of std_logic_vector(15 downto 0);
signal dato: data:=
               (
                  0=>"0001111000110001",
                  1=>"0001110010100010",
                  2=>"0010011101011011",
                  3=>"0010101011110110",
                  4=>"0010110011101110",
                  5=>"0010111000000101",
                  6=>"0011000001111101",
                  7=>"0011000011110010",
                  8=>"0011011011110110",
                  9=>"0011010111011101",
                 10=>"0100011100001010",
                 11=>"0011100001000001",
                 12=>"0100000100110011",
                 13=>"0100000100001110",
                 14=>"0100010000010000",
                 15=>"0101001001110000",
                 16=>"0100001101001110",
                 17=>"0101000010110000",
                 18=>"0101010001010000",
                 19=>"0101001100110001",
                 20=>"0100111000010010",
                 21=>"0101000101001000",
                 22=>"0100101111111111",
                 23=>"0101110111011101",
                 24=>"0101001111001111",
                 25=>"0101001101100110",
                 26=>"0100110110001110",
                 27=>"0101101110110100",
                 28=>"0100101110010101",
                 29=>"0100001001100100",
                 30=>"0101000001000010",
                 31=>"0100001100100011",
                 32=>"0011110010111100", 
                 33=>"0010001111011011", 
                 34=>"0010000110001010", 
                 35=>"0001101110110111",
                 36=>"0010010111110110",
                 37=>"0001010000011100",
                 38=>"0000111111001111",
                 39=>"0000111100100001",
                 40=>"0001000100101110",
                 41=>"0000101110101101",
                 42=>"0000111100001000",
                 43=>"0000101101100100",
                 44=>"0000010001110110",
                 45=>"0000100101111011",
                 46=>"0000000011111010",
                 47=>"0000101110110011",
                 48=>"0000011101111110",
                 49=>"0001000011001001",
                 50=>"0000001001101001",
                 51=>"0000101010011011",
                 52=>"0000011001111110",
                 53=>"0000011001010101",
                 54=>"0000001111000000",
                 55=>"0000000111110100",
                 56=>"0000100001000010",
                 57=>"0000100100110010",
                 58=>"0000101101010100",
                 59=>"0001001100001110",
                 60=>"0010001100001100",
                 61=>"0010010011110100",
                 62=>"0010110000010011",
                 63=>"0011111100010011",
                 64=>"0100000011101001",
                 65=>"0100000110001010",
                 66=>"0100100100010111",
                 67=>"0101011000010100",
                 68=>"0110111100010000",
                 69=>"0111010000111100",
                 70=>"0110000101110000",
                 71=>"0110101000111111",
                 72=>"0110110001110000",
                 73=>"0111011111110010",
                 74=>"0111101110110111",
                 75=>"0111110110111001",
                 76=>"0111111000100010",
                 77=>"0111011100000110",
                 78=>"0111111101101000",
                 79=>"0111110101001011",
                 80=>"0111110111010010",
                 81=>"0111000010010110",
                 82=>"0111100001100111",
                 83=>"0111001111000000",
                 84=>"0111000111100101",
                 85=>"0111101101100001",
                 86=>"0101111001000101",
                 87=>"0101101011001101",
                 88=>"0101011111110100",
                 89=>"0100100001010001",
                 90=>"0100011110011010",
                 91=>"0011110001011010",
                 92=>"0011000110001101",
                 93=>"0010110010111011",
                 94=>"0010110000010000",
                 95=>"0010001110011100",
                 96=>"0001111100100111",
                 97=>"0010000001000111",
                 98=>"0010000000001011",
                 99=>"0001001000100001",
                100=>"0001010001110000",
                101=>"0001011001011100",
                102=>"0001000011111011",
                103=>"0001000011011111",
                104=>"0000101111100101",
                105=>"0000010001001011",
                106=>"0000011111110011",
                107=>"0000100101101011",
                108=>"0000011010111111",
                109=>"0000001101010100",
                110=>"0000010001101110",
                111=>"0000001111000110",
                112=>"0000101100010110",
                113=>"0001011110010001",
                114=>"0000100100001111",
                115=>"0000110011011110",
                116=>"0000111000000011",
                117=>"0010001101110100",
                118=>"0001010001001010",
                119=>"0001101001000101",
                120=>"0001011110010000",
                121=>"0001100100101100",
                122=>"0010100000110101",
                123=>"0010010100100011",
                124=>"0010101010000001",
                125=>"0010101100011100",
                126=>"0011000111110101",
                127=>"0011001000001101",
                128=>"0011101000101101",
                129=>"0100000001010001",
                130=>"0011111111010000",
                131=>"0100000111010110",
                132=>"0100101100110001",
                133=>"0101101001010110",
                134=>"0101001111010101",
                135=>"0100100011100001",
                136=>"0100111111111010",
                137=>"0110000100100111",
                138=>"0100111001001110",
                139=>"0101100100110000",
                140=>"0101010010110001",
                141=>"0101010111011010",
                142=>"0101101000001101",
                143=>"0101000001011001",
                144=>"0110000011100001",
                145=>"0100101001100101",
                146=>"0100111001111100",
                147=>"0100110000001110",
                148=>"0100100000001110",
                149=>"0100100110100011",
                150=>"0100011100100010",
                151=>"0011101011100110",
                152=>"0011111110110101",
                153=>"0011101011001111",
                154=>"0011100001011011",
                155=>"0011101011100010",
                156=>"0010101000011000",
                157=>"0011011111101111",
                158=>"0011011101100111",
                159=>"0001111100110000",
                160=>"0010000010011000",
                161=>"0001101110011111",
                162=>"0010010111001011",
                163=>"0001011101100001",
                164=>"0000111001011111",
                165=>"0000100100010001",
                166=>"0001101001100101",
                167=>"0000110011011011",
                168=>"0001001110001011",
                169=>"0000010101111001",
                170=>"0000011010111100",
                171=>"0000011101000001",
                172=>"0000101000101101",
                173=>"0000001100100011",
                174=>"0000101010110110",
                175=>"0000101110011011",
                176=>"0000100100000010",
                177=>"0000111010001010",
                178=>"0000110100000100",
                179=>"0001000101001011",
                180=>"0001011010000010",
                181=>"0001010100000111",
                182=>"0001111000001100",
                183=>"0010000011110100",
                184=>"0011010101011100",
                185=>"0001111101010010",
                186=>"0010010001010111",
                187=>"0010100110000010",
                188=>"0011111100101011",
                189=>"0011011101010011",
                190=>"0100001100001001",
                191=>"0100101100001110",
                192=>"0101001010110011",
                193=>"0100001101111010",
                194=>"0101000010001000",
                195=>"0100011101101001",
                196=>"0101001010110011",
                197=>"0100011100101100",
                198=>"0100101101110011",
                199=>"0101100000011110",
                200=>"0101001110010001",
                201=>"0101011110011111",
                202=>"0100111011011010",
                203=>"0110000000101011",
                204=>"0101010111101101",
                205=>"0101110110000010",
                206=>"0100111000111101",
                207=>"0101000011010110",
                208=>"0101000010101000",
                209=>"0101001010110101",
                210=>"0100111110011001",
                211=>"0100101011001011",
                212=>"0100100010010010",
                213=>"0100000111000111",
                214=>"0011110101110111",
                215=>"0011111000100011",
                216=>"0100011010001011",
                217=>"0010111101001111",
                218=>"0010111110010010",
                219=>"0010101111000001",
                220=>"0010100101010001",
                221=>"0010101110011000",
                222=>"0010000100100101",
                223=>"0001101110011001",
                224=>"0001111010101100",
                225=>"0001011011101001",
                226=>"0001001011111000",
                227=>"0000111101110011",
                228=>"0001101010010011",
                229=>"0000110101110100",
                230=>"0000011001010000",
                231=>"0000001011001101",
                232=>"0000110000100001",
                233=>"0000001011000000",
                234=>"0000010111000001",
                235=>"0000011110011100",
                236=>"0001000110110110",
                237=>"0001011010101000",
                238=>"0000011011011101",
                239=>"0000010000001110",
                240=>"0000100110000011",
                241=>"0001001001000101",
                242=>"0001111111011011",
                243=>"0001101011010110",
                244=>"0001001000000011",
                245=>"0001010011111100", 
                246=>"0001100010100000",
                247=>"0001111010111100",
                248=>"0010100001100000",
                249=>"0010001110000011",
                others=>(others=>'0')
                );
begin
   dat<=dato(to_integer(unsigned(dir)));
end architecture beh;
