#Alejandra Rodriguez Sanchez Ing. en Computacion
all:tb_trans

tb_trans:bib_mult.o datos.o resultado.o control.o trans.o tb_trans.o
	ghdl -e --ieee=synopsys tb_trans 
	./tb_trans --stop-time=60500ns --vcd=tb_trans.vcd
	gtkwave tb_trans.vcd ondas.sav

trans.o:trans.vhdl
	ghdl -a --ieee=synopsys trans.vhdl

tb_trans.o:tb_trans.vhdl
	ghdl -a --ieee=synopsys tb_trans.vhdl

bib_mult.o:bib_mult.vhdl
	ghdl -a --ieee=synopsys bib_mult.vhdl

datos.o:datos.vhdl
	ghdl -a --ieee=synopsys datos.vhdl

resultado.o:resultado.vhdl
	ghdl -a --ieee=synopsys resultado.vhdl

control.o:control.vhdl
	ghdl -a --ieee=synopsys control.vhdl
	
clean:
	rm *.o tb_trans *.vcd *.cf
